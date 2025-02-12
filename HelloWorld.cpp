#include "llvm/ADT/SmallVector.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Module.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"

using namespace llvm;

namespace {
struct Hello : public ModulePass {
  static char ID;
  Hello() : ModulePass(ID) {}

  DenseMap<int, SmallVector<int>> src2dstMap;
  DenseMap<BasicBlock *, int> BBIDMap;

  bool assignBasicBocksIDs(Module &M) {
    int blockCounter = 0;
    for (auto &F : M) {
      for (auto &BB : F) {
        BBIDMap[&BB] = blockCounter;
        blockCounter++;
      }
    }
    return false;
  }

  // bool isValidTarget(Function &Func) {
  //   // Exclude unwanted functions explicitly
  //   StringRef FuncName = Func.getName();
  //   if (FuncName.contains("not_entry_point")) {
  //       errs() << "  Skipping function: " << FuncName << "\n";
  //       return false;
  //   }
  //   return true;
  // }

  bool findIndirectJump(Module &M) {
    for (auto &F : M) {
      // if (!isValidTarget(F)) {
      //   continue;
      // }
      errs() << "Analyzing function: " << F.getName() << "\n";
      for (auto &BB : F) {
        for (auto &I : BB) {
          if (auto *CB = dyn_cast<CallBase>(&I)) {
            Value *CalledOperand = CB->getCalledOperand();
            if (!isa<Function>(CalledOperand)) {
              int sourceID = BBIDMap[&BB];
              FunctionType *FuncType = CB->getFunctionType();
              errs() << "Found indirect call in BB" << sourceID << "\n";

              for (auto &Func : M.functions()) {
                if (Func.getFunctionType() == FuncType) {
                  StringRef FuncName = Func.getName();
                  int targetID = BBIDMap[&Func.getEntryBlock()];
                  errs() << "  Potential target: " << FuncName << " (BB"
                         << targetID << ")\n";

                  src2dstMap[sourceID].push_back(targetID);
                  errs() << "  Added transition: BB" << sourceID << " -> BB"
                         << targetID << "\n";
                }
              }
            }
          }
        }
      }
    }
    return false;
  } // Set to 1 to enable debug prints, 0 to disable
  if (Function *F = M->getFunction(InitCFGName)) {
    return F;
  }

  LLVMContext &Context = M->getContext();
  FunctionType *InitCFGType =
      FunctionType::get(Type::getVoidTy(Context), false);
  return Function::Create(InitCFGType, Function::ExternalLinkage, InitCFGName,
                          M);
}

Function *
getCFICheckFunction(Module *M) {
  static const std::string CFICheckFuncName = "__cfi_check_bb";
  if (Function *F = M->getFunction(CFICheckFuncName)) {
    return F;
  }

  LLVMContext &Context = M->getContext();
  // Fix: declare with both parameters
  FunctionType *CheckFuncType = FunctionType::get(
      Type::getVoidTy(Context),
      {Type::getInt32Ty(Context), Type::getInt8PtrTy(Context)}, false);
  return Function::Create(CheckFuncType, Function::ExternalLinkage,
                          CFICheckFuncName, M);
}

bool instrumentInitCFGFunction(Module &M) {
  for (Function &F : M) {
    if (F.getName() == "main") {
      IRBuilder<> Builder(&*F.getEntryBlock().getFirstInsertionPt());
      Function *InitCFGFunc = getInitCFGFunction(&M);
      Builder.CreateCall(InitCFGFunc);
      return true;
    }
  }
  return false;
}

bool instrumentCFIcheckFunction(Module &M) {
  LLVMContext &Ctx = M.getContext();
  Type *Int32Ty = Type::getInt32Ty(Ctx);

  FunctionCallee cfiCheckFunc = M.getOrInsertFunction(
      "__cfi_check_bb",
      FunctionType::get(Type::getVoidTy(Ctx),
                        {Int32Ty, Type::getInt8PtrTy(Ctx)}, false));

  for (auto &F : M) {
    for (auto &BB : F) {
      int blockID = BBIDMap[&BB];
      IRBuilder<> Builder(&BB, BB.getFirstInsertionPt());
      Value *blockIDVal = ConstantInt::get(Int32Ty, blockID);
      Value *funcName = Builder.CreateGlobalStringPtr(F.getName());
      Builder.CreateCall(cfiCheckFunc, {blockIDVal, funcName});
    }
  }
  return true;
}

bool runOnModule(Module &M) override {
  assignBasicBocksIDs(M);
  findIndirectJump(M);
  instrumentInitCFGFunction(M);
  instrumentCFIcheckFunction(M);
  return true;
}
};
}

char Hello::ID = 0;
static RegisterPass<Hello> X("hello", "Hello World Pass",
                             false /* Only looks at CFG */,
                             false /* Analysis Pass */);

static RegisterStandardPasses Y(PassManagerBuilder::EP_EarlyAsPossible,
                                [](const PassManagerBuilder &Builder,
                                   legacy::PassManagerBase &PM) {
                                  PM.add(new Hello());
                                });