; ModuleID = 'cfi_icall.ll'
source_filename = "../cfi_icall.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.foo = type { [1 x i32 (i32)*], [1 x i32 (i32)*], [1 x i32 (float)*], [1 x i32 (i32)*] }

@.str = private unnamed_addr constant [20 x i8] c"Usage: %s <option>\0A\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Option values:\0A\00", align 1
@.str.2 = private unnamed_addr constant [26 x i8] c"\090\09Call correct function\0A\00", align 1
@.str.3 = private unnamed_addr constant [56 x i8] c"\091\09Call the wrong function but with the same signature\0A\00", align 1
@.str.4 = private unnamed_addr constant [57 x i8] c"\092\09Call a float function with an int function signature\0A\00", align 1
@.str.5 = private unnamed_addr constant [39 x i8] c"\093\09Call into the middle of a function\0A\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.7 = private unnamed_addr constant [66 x i8] c"\09All other options are undefined, but should be caught by CFI :)\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"\0A\0A\00", align 1
@.str.9 = private unnamed_addr constant [82 x i8] c"Here are some pointers so clang doesn't optimize away members of `struct foo f`:\0A\00", align 1
@.str.10 = private unnamed_addr constant [16 x i8] c"\09int_funcs: %p\0A\00", align 1
@_ZL1f = internal global %struct.foo { [1 x i32 (i32)*] [i32 (i32)* @_ZL7int_argi], [1 x i32 (i32)*] [i32 (i32)* @_ZL11bad_int_argi], [1 x i32 (float)*] [i32 (float)* @_ZL9float_argf], [1 x i32 (i32)*] [i32 (i32)* bitcast (i8* getelementptr (i8, i8* bitcast (i32 (i32)* @_ZL15not_entry_pointi to i8*), i64 32) to i32 (i32)*)] }, align 8
@.str.11 = private unnamed_addr constant [20 x i8] c"\09bad_int_funcs: %p\0A\00", align 1
@.str.12 = private unnamed_addr constant [18 x i8] c"\09float_funcs: %p\0A\00", align 1
@.str.13 = private unnamed_addr constant [18 x i8] c"\09not_entries: %p\0A\00", align 1
@.str.14 = private unnamed_addr constant [21 x i8] c"Calling a function:\0A\00", align 1
@.str.15 = private unnamed_addr constant [13 x i8] c"In %s: (%d)\0A\00", align 1
@__FUNCTION__._ZL7int_argi = private unnamed_addr constant [8 x i8] c"int_arg\00", align 1
@.str.16 = private unnamed_addr constant [39 x i8] c"CFI will not protect transfer to here\0A\00", align 1
@__FUNCTION__._ZL11bad_int_argi = private unnamed_addr constant [12 x i8] c"bad_int_arg\00", align 1
@.str.17 = private unnamed_addr constant [37 x i8] c"CFI should protect transfer to here\0A\00", align 1
@.str.18 = private unnamed_addr constant [13 x i8] c"In %s: (%f)\0A\00", align 1
@__FUNCTION__._ZL9float_argf = private unnamed_addr constant [10 x i8] c"float_arg\00", align 1
@.str.19 = private unnamed_addr constant [75 x i8] c"CFI ensures control flow only transfers to potentially valid destinations\0A\00", align 1
@__FUNCTION__._ZL15not_entry_pointi = private unnamed_addr constant [16 x i8] c"not_entry_point\00", align 1
@0 = private unnamed_addr constant [5 x i8] c"main\00", align 1
@1 = private unnamed_addr constant [5 x i8] c"main\00", align 1
@2 = private unnamed_addr constant [5 x i8] c"main\00", align 1
@3 = private unnamed_addr constant [5 x i8] c"main\00", align 1
@4 = private unnamed_addr constant [13 x i8] c"_ZL7int_argi\00", align 1
@5 = private unnamed_addr constant [18 x i8] c"_ZL11bad_int_argi\00", align 1
@6 = private unnamed_addr constant [15 x i8] c"_ZL9float_argf\00", align 1
@7 = private unnamed_addr constant [22 x i8] c"_ZL15not_entry_pointi\00", align 1

; Function Attrs: mustprogress noinline norecurse optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  call void @__cfi_check_bb(i32 0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @0, i32 0, i32 0))
  call void @initCFG()
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %idx = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load i32, i32* %argc.addr, align 4
  %cmp = icmp ne i32 %0, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @__cfi_check_bb(i32 1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @1, i32 0, i32 0))
  %1 = load i8**, i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 0
  %2 = load i8*, i8** %arrayidx, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i64 0, i64 0), i8* %2)
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0))
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.2, i64 0, i64 0))
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.3, i64 0, i64 0))
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.4, i64 0, i64 0))
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.5, i64 0, i64 0))
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i64 0, i64 0))
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.7, i64 0, i64 0))
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0))
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([82 x i8], [82 x i8]* @.str.9, i64 0, i64 0))
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.10, i64 0, i64 0), i8* bitcast (%struct.foo* @_ZL1f to i8*))
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.11, i64 0, i64 0), i8* bitcast (i32 (i32)** getelementptr inbounds (%struct.foo, %struct.foo* @_ZL1f, i32 0, i32 1, i64 0) to i8*))
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.12, i64 0, i64 0), i8* bitcast (i32 (float)** getelementptr inbounds (%struct.foo, %struct.foo* @_ZL1f, i32 0, i32 2, i64 0) to i8*))
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.13, i64 0, i64 0), i8* bitcast (i32 (i32)** getelementptr inbounds (%struct.foo, %struct.foo* @_ZL1f, i32 0, i32 3, i64 0) to i8*))
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  call void @__cfi_check_bb(i32 2, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @2, i32 0, i32 0))
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.14, i64 0, i64 0))
  %3 = load i8**, i8*** %argv.addr, align 8
  %arrayidx15 = getelementptr inbounds i8*, i8** %3, i64 1
  %4 = load i8*, i8** %arrayidx15, align 8
  %arrayidx16 = getelementptr inbounds i8, i8* %4, i64 0
  %5 = load i8, i8* %arrayidx16, align 1
  %conv = sext i8 %5 to i32
  %sub = sub nsw i32 %conv, 48
  store i32 %sub, i32* %idx, align 4
  %6 = load i32, i32* %idx, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx17 = getelementptr inbounds [1 x i32 (i32)*], [1 x i32 (i32)*]* getelementptr inbounds (%struct.foo, %struct.foo* @_ZL1f, i32 0, i32 0), i64 0, i64 %idxprom
  %7 = load i32 (i32)*, i32 (i32)** %arrayidx17, align 8
  %8 = load i32, i32* %idx, align 4
  %call18 = call i32 %7(i32 %8)
  store i32 %call18, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  call void @__cfi_check_bb(i32 3, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @3, i32 0, i32 0))
  %9 = load i32, i32* %retval, align 4
  ret i32 %9
}

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: mustprogress noinline optnone uwtable
define internal i32 @_ZL7int_argi(i32 %arg) #2 {
entry:
  call void @__cfi_check_bb(i32 4, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @4, i32 0, i32 0))
  %arg.addr = alloca i32, align 4
  store i32 %arg, i32* %arg.addr, align 4
  %0 = load i32, i32* %arg.addr, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.15, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @__FUNCTION__._ZL7int_argi, i64 0, i64 0), i32 %0)
  ret i32 0
}

; Function Attrs: mustprogress noinline optnone uwtable
define internal i32 @_ZL11bad_int_argi(i32 %arg) #2 {
entry:
  call void @__cfi_check_bb(i32 5, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @5, i32 0, i32 0))
  %arg.addr = alloca i32, align 4
  store i32 %arg, i32* %arg.addr, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.16, i64 0, i64 0))
  %0 = load i32, i32* %arg.addr, align 4
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.15, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @__FUNCTION__._ZL11bad_int_argi, i64 0, i64 0), i32 %0)
  ret i32 0
}

; Function Attrs: mustprogress noinline optnone uwtable
define internal i32 @_ZL9float_argf(float %arg) #2 {
entry:
  call void @__cfi_check_bb(i32 6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @6, i32 0, i32 0))
  %arg.addr = alloca float, align 4
  store float %arg, float* %arg.addr, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.17, i64 0, i64 0))
  %0 = load float, float* %arg.addr, align 4
  %conv = fpext float %0 to double
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.18, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @__FUNCTION__._ZL9float_argf, i64 0, i64 0), double %conv)
  ret i32 0
}

; Function Attrs: mustprogress noinline optnone uwtable
define internal i32 @_ZL15not_entry_pointi(i32 %arg) #2 {
entry:
  call void @__cfi_check_bb(i32 7, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @7, i32 0, i32 0))
  %arg.addr = alloca i32, align 4
  store i32 %arg, i32* %arg.addr, align 4
  call void asm sideeffect "nop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0Anop\0A", "~{dirflag},~{fpsr},~{flags}"() #4, !srcloc !4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.19, i64 0, i64 0))
  %0 = load i32, i32* %arg.addr, align 4
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.15, i64 0, i64 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @__FUNCTION__._ZL15not_entry_pointi, i64 0, i64 0), i32 %0)
  %1 = load i32, i32* %arg.addr, align 4
  call void @exit(i32 %1) #5
  unreachable
}

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare void @initCFG()

declare void @__cfi_check_bb(i32, i8*)

attributes #0 = { mustprogress noinline norecurse optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress noinline optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{!"clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)"}
!4 = !{i64 821, i64 830, i64 838, i64 846, i64 854, i64 862, i64 870, i64 878, i64 886, i64 894, i64 914, i64 922, i64 930, i64 938, i64 946, i64 954, i64 962, i64 970, i64 978, i64 986, i64 1006, i64 1014, i64 1022, i64 1030, i64 1038, i64 1046, i64 1054, i64 1062, i64 1070, i64 1078, i64 1098, i64 1106, i64 1114, i64 1122, i64 1130, i64 1138, i64 1146, i64 1154, i64 1162, i64 1170, i64 1190, i64 1198, i64 1206, i64 1214, i64 1222, i64 1230, i64 1238, i64 1246, i64 1254, i64 1262, i64 1282, i64 1290, i64 1298, i64 1306, i64 1314, i64 1322, i64 1330, i64 1338, i64 1346, i64 1354, i64 1374, i64 1382, i64 1390, i64 1398, i64 1406, i64 1414, i64 1422, i64 1430, i64 1438, i64 1446, i64 1466, i64 1474, i64 1482, i64 1490, i64 1498, i64 1506, i64 1514, i64 1522, i64 1530, i64 1538}
