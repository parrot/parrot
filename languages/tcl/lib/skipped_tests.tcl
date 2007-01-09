# skipped_tests - these are all the tests that the partcl implementation
# cannot pass. Some of the tests cause harness failures (see RT#40716),
# others simply require some functionality that we haven't implemented yet.
#
# stored as a dictionary, with the reason as a key, and the list of tests
# that require the feature (or cause the listed error) as values.

set skipped_tests [dict create \
  {[binary]} {
    string-5.14 string-5.15
    stringComp-5.14 stringComp-5.15 stringComp-9.7
  } {[trace]} {
    append-7.1 append-7.2 append-7.3 append-7.4 append-7.5
    appendComp-7.1 appendComp-7.2 appendComp-7.3 appendComp-7.4 appendComp-7.5
    appendComp-7.6 appendComp-7.7 appendComp-7.8 appendComp-7.9
    if-10.6
    lset-1.3 lset-5.1 lset-5.2
  } {stacktrace support} {
    apply-2.2 apply-2.3 apply-2.4 apply-2.5 apply-5.1
    basic-46.1
    cmdMZ-2.10 cmdMZ-3.5 cmdMZ-5.7
    dict-14.12 dict-17.13
    error-1.3 error-2.3 error-2.6 error-4.2 error-4.3 error-4.4
    eval-2.5
    iocmd-12.6
    if-5.3 if-6.4
    incr-2.30 incr-2.31
    incr-old-2.4 incr-old-2.5
    misc-1.2
    namespace-8.5 namespace-8.6 namespace-25.6 namespace-25.7 namespace-25.8
    namespace-47.2 namespace-47.4 namespace-47.6
    parse-9.2 parse-10.14
    set-2.1 set-4.1
    switch-4.1 switch-4.5
    while-4.3
    while-old-4.6
  } {[interp]} {
    basic-11.1 basic-12.1 basic-12.2 basic-13.1 basic-13.2 basic-24.1
    basic-1.1 basic-10.1 basic-36.1          
    namespace-8.7
  } {[file]} {
    cmdAH-2.2 cmdAH-2.3 cmdAH-2.4 cmdAH-2.5 cmdAH-2.6 cmdAH-2.6.1 cmdAH-2.6.2
  } BOOM {
    format-3.1 format-3.2
    namespace-old-2.5 namespace-old-2.6 namespace-old-2.7 namespace-old-4.4
    namespace-old-7.7
  } {[expr wide()]} {
    dict-11.1 dict-11.2 dict-11.3 dict-11.4 dict-11.5 dict-11.6 dict-11.7
    expr-old-34.13 expr-old-34.14
    lindex-3.7
  } {[expr isqrt()]} {
    expr-47.1 expr-47.2 expr-47.4 expr-47.5 expr-47.6 expr-47.7 expr-47.8
    expr-47.9 expr-47.10 expr-47.11 expr-47.12
  } {[expr s?rand()]} {
    expr-old-32.51 expr-old-32.52 expr-old-32.53 expr-old-32.48 expr-old-32.49
    expr-old-32.50 expr-old-32.45
  } {[namespace code]} {
    namespace-22.1 namespace-22.2 namespace-22.3 namespace-22.4 namespace-22.5 
    namespace-22.6 
  } {[namespace delete]} {
    namespace-14.1
  } {[namespace export]} {
    namespace-11.1 namespace-26.6
  } {[namespace inscope]} {
    namespace-29.1 namespace-29.2 namespace-29.3 namespace-29.4 namespace-29.5
    namespace-29.6
  } {[namespace import]} {
    namespace-8.1 namespace-8.4 namespace-9.1 namespace-9.2 namespace-9.3
    namespace-9.4 namespace-9.5 namespace-9.6 namespace-9.7 namespace-11.2
    namespace-11.3 namespace-12.1 namespace-26.4 namespace-26.5 namespace-26.7
    namespace-28.2 namespace-28.3
  } {[namespace origin]} {
    namespace-30.1 namespace-30.2 namespace-30.3 namespace-30.4 namespace-30.5
  } {[namespace forget]} {
    namespace-10.1 namespace-10.2 namespace-10.3 namespace-13.1 namespace-27.1
    namespace-27.2 namespace-27.3
  } {nested dictionaries} {
    dict-3.5 dict-3.6 dict-3.7 dict-3.8 dict-3.9 dict-3.10 dict-9.3 dict-9.4
    dict-9.5 dict-15.3 dict-15.5 dict-16.4
  } {support for the variable named ""} {
    var-6.3 var-7.12 var-12.1
  } {Cannot get character past end of string} {
    format-8.17 format-8.18
  } {Cannot take substr outside string} {
    namespace-14.9 namespace-14.12
  } {[lsearch -regexp]} {
    for-3.6
  } {Inf support} {
    compExpr-old-11.13a
    expr-11.13b expr-22.2 expr-22.4 expr-22.6 expr-22.8 expr-30.3 expr-30.4
    expr-41.1 expr-45.7
    expr-old-26.10b expr-old-34.11 expr-old-34.12b expr-old-34.11
    expr-old-34.10
    scan-14.1 scan-14.2 
  } {NaN support} {
    expr-22.1 expr-22.3  expr-22.5 expr-22.7 expr-22.9 expr-45.8 expr-45.9
    expr-47.3
    expr-old-36.7
  } {[testexprstring]} {
    expr-old-38.2
  } {[testexprlong]} {
    expr-old-37.1 expr-old-37.2 expr-old-37.3 expr-old-37.4 expr-old-37.5
    expr-old-37.6 expr-old-37.8 expr-old-37.9 expr-old-37.11 expr-old-37.12
    expr-old-37.14 expr-old-37.15
  } {[testexprdouble]} {
    expr-old-37.17 expr-old-37.18 expr-old-37.19 expr-old-37.20 expr-old-37.21
    expr-old-37.22 expr-old-37.22 expr-old-37.23 expr-old-37.24 expr-old-37.25
  } {[testexprdoubleobj]} {
    expr-39.17 expr-39.19 expr-39.20 expr-39.21 expr-39.22 expr-39.23
    expr-39.24 expr-39.25 
  } {[testexprlongobj]} {
    expr-39.1 expr-39.2 expr-39.3 expr-39.4 expr-39.5 expr-39.6 expr-39.8
    expr-39.9 expr-39.11 expr-39.12 expr-39.14 expr-39.15
  } {[testevalobjv]} {
    parse-8.1 parse-8.5 parse-8.9
  } {[testparser]} {
    parse-1.1 parse-1.2 parse-1.3 parse-1.4 parse-1.5 parse-1.6 parse-1.7
    parse-1.8 parse-2.1 parse-2.2 parse-2.3 parse-2.4 parse-2.5 parse-3.1
    parse-3.2 parse-3.3 parse-3.4 parse-3.5 parse-3.6 parse-3.7 parse-4.1
    parse-4.2 parse-4.3 parse-4.4 parse-4.5 parse-4.6 parse-5.1 parse-5.2
    parse-5.3 parse-5.4 parse-5.5 parse-5.6 parse-5.7 parse-5.8 parse-5.9
    parse-5.10 parse-5.11 parse-5.13 parse-5.16 parse-5.18 parse-5.20
    parse-5.22 parse-5.23 parse-5.24 parse-5.25 parse-5.26 parse-5.27
    parse-6.1 parse-6.2 parse-6.3 parse-6.4 parse-6.5 parse-6.6 parse-6.7
    parse-6.11 parse-6.12 parse-6.13 parse-6.14 parse-6.15 parse-6.16
    parse-6.17 parse-6.18 parse-7.1 parse-12.6 parse-12.7 parse-12.8
    parse-12.11 parse-12.12 parse-12.13 parse-12.14 parse-12.18 parse-12.20
    parse-12.21 parse-12.22 parse-12.23 parse-12.25 parse-14.1 parse-14.2
    parse-14.3 parse-14.4 parse-14.5 parse-14.6 parse-14.7 parse-14.8
    parse-14.9 parse-14.10 parse-14.11 parse-14.12 parse-15.1 parse-15.2
    parse-15.3 parse-15.4
  } {[testparsevar]} {
    parse-13.1 parse-13.2 parse-13.3 parse-13.4 parse-13.5
  } {[testparsevarname]} {
    parse-12.1 parse-12.2 parse-12.3 parse-12.4 parse-12.5 parse-12.9
    parse-12.10 parse-12.15 parse-12.16 parse-12.17 parse-12.19 parse-12.24
  } {[testupvar]} {
    var-3.3 var-3.4 var-3.4
  } {[testgetvarfullname]} {
    var-4.1 var-4.2 var-4.3
  } {[testsetnoerr]} {
    var-9.1 var-9.2 var-9.3 var-9.4 var-9.5 var-9.6 var-9.7 var-9.8 var-9.9
    var-9.1 var-9.11 var-9.12
  } {[testdoubleobj]} {
    execute-3.2 execute-3.8 execute-3.14 execute-3.20 execute-3.26 execute-3.32
    execute-3.38 execute-3.44 execute-3.50 execute-3.56 execute-3.63 
    execute-3.64 execute-3.73
  } {[testintobj]} {
    execute-3.1 execute-3.3 execute-3.7 execute-3.9 execute-3.13 execute-3.15
    execute-3.19 execute-3.21 execute-3.25 execute-3.27 execute-3.31 
    execute-3.33 execute-3.37 execute-3.39 execute-3.43 execute-3.45
    execute-3.49 execute-3.51 execute-3.55 execute-3.57 execute-3.61
    execute-3.62 execute-3.65 execute-3.66 execute-3.72 execute-3.74
  } {[teststringobj]} {
    execute-3.4 execute-3.5 execute-3.6 execute-3.10 execute-3.11 execute-3.12
    execute-3.16 execute-3.17 execute-3.18 execute-3.22 execute-3.23
    execute-3.24 execute-3.28 execute-3.29 execute-3.30 execute-3.34
    execute-3.35 execute-3.36 execute-3.40 execute-3.41 execute-3.42
    execute-3.46 execute-3.47 execute-3.48 execute-3.52 execute-3.53
    execute-3.54 execute-3.58 execute-3.59 execute-3.60 execute-3.67
    execute-3.68 execute-3.69 execute-3.70 execute-3.71 execute-3.75
    execute-3.76 execute-3.77
  } {mathfunc} {
    compExpr-5.3 compExpr-5.4
    compExpr-old-15.7 compExpr-old-15.8 compExpr-old-15.9 compExpr-old-15.10
    compExpr-old-15.11
    expr-15.7 expr-15.8 expr-15.9 expr-15.10 expr-15.11 expr-15.12 expr=15.13
    expr=15.14 expr-15.15 expr-15.16
    expr-old-32.43 expr-old-32.44
  } {bigint} {
    expr-23.36 expr-23.37 expr-23.38 expr-23.39 expr-23.41 expr-23.42
    expr-23.43 expr-23.44 expr-23.47 expr-23.48 expr-24.10
    expr-old-32.39 expr-old-32.40 expr-old-36.11 expr-old-36.14 expr-old-34.15
    expr-old-34.16
  } {ICU} {
    binary-22.3 binary-22.4 binary-22.5 binary-22.11 binary-23.3 binary-23.4
    binary-23.11 binary-24.2 binary-24.3 binary-24.4 binary-24.6 binary-24.10
    binary-25.2 binary-25.3 binary-25.4 binary-25.6 binary-25.10 binary-26.2
    binary-26.3 binary-26.4 binary-26.5 binary-26.6 binary-26.7 binary-26.10
    binary-27.2 binary-27.3 binary-27.4 binary-27.5 binary-27.6 binary-27.9
    binary-28.2 binary-28.3 binary-28.4 binary-28.5 binary-28.6 binary-28.9
    binary-29.2 binary-29.3 binary-29.4 binary-29.5 binary-29.6 binary-29.9
    binary-30.2 binary-30.3 binary-30.4 binary-30.5 binary-30.6 binary-30.9
    binary-31.2 binary-31.3 binary-31.4 binary-31.5 binary-31.6 binary-31.7
    binary-31.8 binary-31.9 binary-31.10 binary-31.11 binary-31.13 binary-31.14
    binary-31.15 binary-32.2 binary-32.3 binary-32.4 binary-32.5 binary-32.6
    binary-32.7 binary-32.8 binary-32.9 binary-32.10 binary-32.11 binary-32.13
    binary-32.14 binary-32.15 binary-39.1 binary-39.2 binary-39.3 binary-39.4
    binary-39.5 binary-41.5 binary-41.6 binary-41.7 binary-41.8 binary-46.5
    binary-54.2 binary-54.3 binary-54.4 binary-54.5 binary-54.6 binary-54.9
    binary-55.2 binary-55.3 binary-55.4 binary-55.5 binary-55.6 binary-55.9
    binary-56.2 binary-56.3 binary-56.4 binary-56.5 binary-56.6 binary-56.9
    binary-57.2 binary-57.3 binary-57.4 binary-57.5 binary-57.6 binary-57.9
    binary-58.2 binary-58.3 binary-58.4 binary-58.5 binary-58.6 binary-58.7
    binary-58.8 binary-58.9 binary-58.10 binary-58.11 binary-58.13 binary-58.14
    binary-58.15 binary-59.2 binary-59.3 binary-59.4 binary-59.5 binary-59.6
    binary-59.7 binary-59.8 binary-59.9 binary-59.10 binary-59.11 binary-59.13
    binary-59.14 binary-59.15 cmdIL-4.24 cmdIL-4.25 expr-8.13 parseOld-7.12
    scan-7.6 scan-7.7
    subst-3.2
    string-2.12 string-2.31 string-3.4 string-6.19 string-6.83 string-6.84
    string-6.85 string-6.88 string-6.109 string-8.3 string-10.13 string-11.33
    string-12.20 string-15.10 string-16.10 string-17.6 string-17.7 string-18.11
    string-21.10 string-21.11 string-21.12 string-21.13 string-22.11
    stringComp-2.12 stringComp-2.31 stringComp-3.4
    stringComp-8.3 stringComp-11.33
    util-4.6 util-5.7 util-5.18 util-5.42 util-5.43 util-8.3
  } ]

# Tests after which there is code (in or out of a test) which causes either
# a fatal harness error, or after which all tests fail/skip. Allows us to
# count passing tests that would otherwise be lost by the harness, as well
# as speed up processing by ignoring chunks of failing tests.
#
# stored as an array of test name -> reason pairs.

array set abort_after {
  basic-47.1           {need interp before these can work}
  cmdAH-31.13          {invalid command name "cd"}
  cmdMZ-5.7            {invalid command name "cleanupTests"}
  env-1.3              {can't read "env(test)" no such element in array}
  event-4.2            {invalid command name "update"}
  filename-11.13       {invalid command name "cd"}
  iocmd-12.8           {invalid command name "close"}
  ioUtil-2.8           {invalid command name "cd"}
  parse-19.4           {invalid command name "cleanupTests"}
  uplevel-5.2          {invalid command name "set"}
  utf-1.4              {Invalid character for UTF-8 encoding}
  source-7.6           {invalid command name "cleanupTests"}
}
