# skipped_tests - these are all the tests that the partcl implementation
# not only cannot pass, but cannot compile, or causes a parrot segfault, etc.
# must use exact test names.
#
# todo_tests - these are the tests that are known to fail because they
# require a feature we haven't implemented yet. Can use globs to specify
# a range of skippable tests.
#
# stored as a dictionary, with the reason as a key, and the list of tests
# that require the feature (or cause the listed error) as values.

set todo_tests [dict create \
  {list to string improvements} {
    list-1.1[23] list-1.26
  } {update diagnostic messages} {
    parse-11.2
  } {parsing errors} {
    list-1.1[56]
    parse-6.8 parse-15.15 parse-15.2[78] parse-15.42 parse-15.5[12]
    parseOld-1.2 parseOld-5.12 parseOld-7.6 parseOld-7.1[01234]
    parseOld-12.3
  } {compilation issues} {
    parse-8.12
  } {[trace]} {
    append-7.[12345]
    appendComp-7.[123456789]
    if-10.6
    lset-1.3 lset-5.[12]
  } {stacktrace support} {
    apply-2.[2345] apply-5.1
    if-5.3 if-6.4
    incr-2.3[01]
    incr-old-2.[45]
    parse-9.[12] parseOld-10.14
    set-[24].1
    switch-4.[15]
    while-old-4.6
  } {tcltest - testevalex} {
    lset-2.2 lset-7.[12] lset-10.3 lset-13.[012] lset-14.[12]
    parse-11.[58] parse-11.12
  } {tcltest - testset2} {
    set-5.1
  } {tcltest - testparser} {
    parse-1.[123456789] parse-1.10 parse-2.[12345] parse-3.[1234567]
    parse-4.[123456] parse-5.[123456789] parse-5.1[01368] parse-5.2[0234567]
    parse-6.[1234567] parse-6.1[12345678] parse-7.1
    parse-12.[678] parse-12.1[12348] parse-12.2[01235]
    parse-14.1[012] parse-14.[123456789] parse-15.[1234]
  } {tcltest - testevalobjv} {
    parse-8.[159]
  } {tcltest - testparsevarname} {
    parse-12.[123459] parse-12.1[05679] parse-12.24
  } {tcltest - testparsevar} {
    parse-13.[12345]
  } {tcltest - testwordend} {
    parseOld-14.[123456789] parseOld-14.1? parseOld-14.2[01]
  } {tcltest - testexprparser} {
    parseExpr-1.[123] parseExpr-2.[134569] parseExpr-3.[13456]
    parseExpr-4.[13456] parseExpr-5.[13456] parseExpr-6.[13456]
    parseExpr-7.[13456] parseExpr-8.[134567] parseExpr-9.[13456789]
    parseExpr-10.[134567] parseExpr-11.[134567] parseExpr-12.[134567]
    parseExpr-13.[12345678] parseExpr-14.[1234567] parseExpr-14.1[012]
    parseExpr-15.[1236789] parseExpr-15.1[0245679] parseExpr-15.2[12569]
    parseExpr-15.30 parseExpr-16.[12345789] parseExpr-16.11[ab]
    parseExpr-16.1[03456789] parseExpr-16.2[0123456789]
    parseExpr-16.3[012456789] parseExpr-16.4[0123] parseExpr-17.1
  } {[apply]} {
    apply-[4678].*
  } {http://code.google.com/p/partcl/issues/detail?id=2} {
    subst-5.7 subst-8.[123459] subst-10.[456] subst-10.[123] subst-11.[1236]
    subst-12.[34]
  } {[exec]} {
    subst-5.[89] subst-5.10
  } {better switch handling} {
    subst-7.[27]
    switch-3.1[234]
  } {[incr] should autovivify} {
    incr-1.13 incr-1.26 incr-2.13 incr-2.26 incr-old-2.3
  } {[expr wide()]} {
    incr-3.[12]
  } {[unknown]} {
    parse-8.[234] parse-8.1[01]
  } {[info complete]} {
    parse-15.17 parse-15.3[689] parse-15.4[35] parse-15.5[09] parse-15.60
    parseOld-15.2
  } {[subst]} {
    parse-16.1
  } {bigint support} {
    parseExpr-20.[123]
  }
]

set skip_tests [dict create \
  BOOM {
    namespace-7.7
  } {[binary]} {
    string-5.14 string-5.15 string-5.16 string-12.21
    stringComp-5.14 stringComp-5.15 stringComp-5.16 stringComp-9.7
  } {stacktrace support} {
    basic-46.1
    cmdMZ-return-2.10 cmdMZ-3.5 cmdMZ-5.7
    dict-14.12 dict-17.13
    error-1.3 error-2.3 error-2.6 error-4.2 error-4.3 error-4.4
    eval-2.5
    iocmd-12.6
    misc-1.2
    namespace-8.5 namespace-8.6 namespace-25.6 namespace-25.7 namespace-25.8
    namespace-47.2 namespace-47.4 namespace-47.6 namespace-46.5
    proc-old-5.13 proc-old-5.16 proc-old-7.2  proc-old-7.11 proc-old-7.12
    proc-old-7.13 proc-old-7.14
  } {[interp]} {
    basic-11.1 basic-12.1 basic-12.2 basic-13.1 basic-13.2 basic-24.1
    basic-1.1 basic-10.1 basic-36.1
    namespace-8.7
  } {[file]} {
    cmdAH-2.2 cmdAH-2.3 cmdAH-2.4 cmdAH-2.5 cmdAH-2.6 cmdAH-2.6.1 cmdAH-2.6.2
  } {[expr wide()]} {
    dict-11.1 dict-11.2 dict-11.3 dict-11.4 dict-11.5 dict-11.6 dict-11.7
    expr-23.24 expr-23.25 expr-23.26 expr-23.27 expr-23.28 expr-23.29
    expr-23.30 expr-23.31 expr-23.32 expr-23.33 expr-24.3 expr-24.4 expr-24.7
    expr-24.8 expr-31.10 expr-31.14
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
    dict-9.5 dict-15.3 dict-15.5 dict-16.4 dict-21.16
  } {support for the variable named ""} {
    var-6.3 var-7.12 var-12.1
  } {Cannot get character past end of string} {
    format-8.17 format-8.18
  } {Cannot get character of empty string} {
    regexp-6.9 regexp-15.6 regexp-21.7
    regexpComp-6.9 regexpComp-15.6 regexpComp-21.7
  } {Cannot take substr outside string} {
    namespace-14.9 namespace-14.12
  } {[read]} {
    iocmd-4.1 iocmd-4.2 iocmd-4.3 iocmd-4.4 iocmd-4.5 iocmd-4.6 iocmd-4.7
    iocmd-4.8 iocmd-4.9 iocmd-4.10 iocmd-4.11 iocmd-4.12
  } {[seek]} {
    iocmd-5.1 iocmd-5.2 iocmd-5.3 iocmd-5.4 iocmd-12.4
  } {[tell]} {
    iocmd-6.1 iocmd-6.2 iocmd-6.3
  } {[fblocked]} {
    iocmd-10.1 iocmd-10.2 iocmd-10.3 iocmd-10.4 iocmd-10.5
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
  } {[testgetint]} {
    get-1.1 get-1.2 get-1.3 get-1.4 get-1.5 get-1.6 get-1.7 get-1.8 get-1.9
    get-1.10 get-1.11 get-1.12 get-1.13 get-1.14
  } {[testtranslatefilename]} {
    filename-10.1 filename-10.2 filename-10.3 filename-10.3.1 filename-10.6
    filename-10.7 filename-10.8 filename-10.9 filename-10.10 filename-10.17
    filename-10.18 filename-10.19 filename-10.20 filename-10.21 filename-10.22
    filename-10.23 filename-10.24
  } {[testdel]} {
    rename-4.1 rename-4.2 rename-4.3 rename-4.4 rename-4.5
  } {[testchmod]} {
    cmdAH-18.3
  } {[testcmdtoken]} {
    basic-20.1 basic-20.2 basic-20.3
  } {[testcreatecommand]} {
    basic-14.1 basic-14.2
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
  } {[testupvar]} {
    upvar-9.1 upvar-9.2 upvar-9.3 upvar-9.4 upvar-9.5 upvar-9.6 upvar-9.7
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
  } {[testdstring]} {
    util-8.2 util-8.3 util-8.4 util-8.5 util-8.6
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
  } ]

# Tests after which there is code (in or out of a test) which causes either
# a fatal harness error, or after which all tests fail/skip. Allows us to
# count passing tests that would otherwise be lost by the harness, as well
# as speed up processing by ignoring chunks of failing tests.
#
# stored as an array of test name -> reason pairs.

array set abort_after {
  parseExpr-20.3 {src/string.c:1109: failed assertion 'src->encoding == Parrot_fixed_8_encoding_ptr'}
  assocd-1.1           {}
  async-1.1            {}
  autoMkindex-1.1      {}
  basic-47.1           {need interp before these can work}
  case-1.1             {}
  cmdAH-31.13          {invalid command name "cd"}
  cmdinfo-1.1          {}
  cmdMZ-5.7            {invalid command name "cleanupTests"}
  dcall-1.1            {}
  dstring-1.1          {}
  encoding-1.1         {}
  env-1.3              {can't read "env(test)" no such element in array}
  event-1.1            {invalid command name "update"}
  fCmd-1.1             {}
  filename-11.13       {invalid command name "cd"}
  indexObj-1.1         {}
  init-1.1             {}
  iocmd-12.8           {invalid command name "close"}
  iogt-1.1             {}
  ioUtil-2.8           {invalid command name "cd"}
  link-1.1             {}
  macOSXFCmd-1.1       {}
  mathop-1.1           {}
  misc-1.1             {}
  msgcat-0.0           {}
  obj-1.1              {}
  opt-1.1              {don't have the opt package available}
  package-1.6          {}
  pkgconfig-1.1        {}
  pkgMkIndex-4.2       {invalid command name "pkg_mkIndex"}
  parse-19.4           {invalid command name "cleanupTests"}
  reg-0.1              {invalid command name "doing"}
  registry-1.1         {}
  safe-1.1             {}
  source-7.6           {invalid command name "cleanupTests"}
  Tcl_Main-1.1         {}
  thread-1.1           {}
  timer-1.1            {}
  tcltest-1.1          {}
  unixFile-1.1         {}
  unknown-1.1          {}
  unload-1.1           {}
  utf-1.1              {}
  unixInit-1.1         {}
  winpipe-1.1          {}
  winNotify-1.1        {}
  winTime-1.1          {}
}
