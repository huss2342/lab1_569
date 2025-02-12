mkdir -p build && cd build 

cmake ../
make 

# $LLVM_DIR/bin/clang++ -emit-llvm -S ../cfi_icall.c -o cfi_icall.ll
# $LLVM_DIR/bin/opt -f -enable-new-pm=0 -load ./libHelloWorld.so -hello -S cfi_icall.ll -o transformed_cfi_call.ll
# $LLVM_DIR/bin/clang++ transformed_cfi_call.ll ../cfi_check_lib.cpp -o exe_cfi_icall


BUILDING="/home/cse569s/nevin/CppRobotics/src/rrt.cpp"
INCLUDES="/home/cse569s/nevin/CppRobotics/include"
PATH_TO_BIN="/home/cse569s/nevin/CppRobotics/bin"
OPENCV_INCLUDE_DIRS=$(pkg-config --cflags opencv4)
OPENCV_LIBS=$(pkg-config --libs opencv4)

$LLVM_DIR/bin/clang++ -emit-llvm -S $BUILDING -o $PATH_TO_BIN/rrt.ll -I$INCLUDES $OPENCV_INCLUDE_DIRS
$LLVM_DIR/bin/opt -f -enable-new-pm=0 -load ./libHelloWorld.so -hello -S $PATH_TO_BIN/rrt.ll -o $PATH_TO_BIN/transformed_rrt.ll
$LLVM_DIR/bin/clang++ $PATH_TO_BIN/transformed_rrt.ll ../cfi_check_lib.cpp -o $PATH_TO_BIN/exe_rrt $OPENCV_LIBS



