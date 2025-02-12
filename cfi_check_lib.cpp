#include <stdexcept>
#include <unordered_map>
#include <unordered_set>

// for cfi_icall
// Input 0: BB-1 → BB0 → BB2 → BB4 → BB3
// Input 1: BB-1 → BB0 → BB2 → BB5 → BB3
// Input 2: BB-1 → BB0 → BB2 → BB6 (runtime error)
// Input 3: BB-1 → BB0 → BB2 → BB3 (segmentation fault)

#define DEBUG 1

#if DEBUG
#include <iostream>
#endif

std::unordered_map<int, std::unordered_set<int>> ValidTransitions;
int currentBBID = -1;

extern "C" void initCFG() {
//   ValidTransitions[0].insert(2);
//   ValidTransitions[2].insert(4);
//   ValidTransitions[2].insert(5);
    ValidTransitions[-1].insert(323);
    ValidTransitions[323].insert(324);

#if DEBUG
  std::cerr << "Valid transitions map:\n";
  for (const auto &[src, targets] : ValidTransitions) {
    std::cerr << "From BB" << src << " can go to: ";
    for (int target : targets) {
      std::cerr << "BB" << target << " ";
    }
    std::cerr << "\n";
  }
#endif
}

extern "C" void __cfi_check_bb(int targetBBID, const char *functionName) {
#if DEBUG
  std::cerr << "Checking transition from BB" << currentBBID << " to BB"
            << targetBBID << " (function: " << functionName << ")\n";
#endif

  if (currentBBID != -1) {
    auto it = ValidTransitions.find(currentBBID);
    if (it != ValidTransitions.end()) {
      const auto &validTargets = it->second;
#if DEBUG
      std::cerr << "Valid targets from BB" << currentBBID << ": ";
      for (int target : validTargets) {
        std::cerr << "BB" << target << " ";
      }
      std::cerr << "\n";
#endif

      if (validTargets.find(targetBBID) == validTargets.end()) {
#if DEBUG
        std::cerr << "Invalid transition detected!\n";
#endif
        throw std::runtime_error("Control flow integrity check failed");
      }

    }
  }

#if DEBUG
  std::cerr << "Setting currentBBID from " << currentBBID << " to "
            << targetBBID << "\n";
#endif
  currentBBID = targetBBID;
}
