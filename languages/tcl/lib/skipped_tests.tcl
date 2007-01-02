# skipped_tests - these are all the tests that the partcl implementation
# cannot pass. Some of the tests cause harness failures (see RT#40716),
# others simply require some functionality that we haven't implemented yet.
#
# stored as a dictionary, with the reason as a key, and the list of tests
# that require the feature (or cause the listed error) as values.

set skipped_tests [dict create \
  {[binary]} {
    string-5.14 stringComp-5.14 stringComp-9.7
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
    parse-9.2 parse-10.14
    set-2.1 set-4.1
    switch-4.1
    while-4.3
    while-old-4.6
  } {[interp]} {
    basic-11.1 basic-12.1 basic-12.2 basic-13.1 basic-13.2 basic-24.1
    basic-1.1 basic-10.1 basic-36.1          
  } {[file]} {
    cmdAH-2.2 cmdAH-2.3 cmdAH-2.4 cmdAH-2.5 cmdAH-2.6 cmdAH-2.6.1 cmdAH-2.6.2
  } BOOM {
    format-3.1 format-3.2
    namespace-old-2.6 namespace-old-4.4 namespace-old-7.7
  } {[expr wide()]} {
    dict-11.1 dict-11.2 dict-11.3 dict-11.4 dict-11.5 dict-11.6 dict-11.7
    lindex-3.7
  } {nested dictionaries} {
    dict-3.5 dict-3.6 dict-3.7 dict-3.8 dict-3.9 dict-3.10 dict-9.3 dict-9.4
    dict-9.5 dict-15.3 dict-15.5 dict-16.4
  } {support for the variable named ""}
    var-7.12 var-12.1
  } {Cannot get character past end of string} {
    format-8.17 format-8.18
  } {Cannot get character of empty string} {
    var-6.3
  } {[lsearch -regexp]} {
    for-3.6
  } {Inf support} {
    scan-14.1 scan-14.2
  } {Can only replace inside string or index after end of string} {
    string-14.11
  } {[testupvar]} {
    var-3.3 var-3.4 var-3.4
  } {[testgetvarfullname]} {
    var-4.1 var-4.2 var-4.3
  } {[testsetnoerr]} {
    var-9.1 var-9.2 var-9.3 var-9.4 var-9.5 var-9.6 var-9.7 var-9.8 var-9.9
    var-9.1 var-9.11 var-9.12
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
  cmdMZ-return-2.17    {foreach handling borked?}
  env-1.3              {can't read "env(test)" no such element in array}
  event-4.2            {invalid command name "update"}
  filename-11.13       {invalid command name "cd"}
  info-32.0            {invalid command name "proc bar {} {info frame 0}"}
  iocmd-12.8           {invalid command name "close"}
  ioUtil-2.8           {invalid command name "cd"}
  uplevel-5.2          {invalid command name "set"}
  utf-1.4              {Invalid character for UTF-8 encoding}
  parse-8.12           {avoid infinite loop}
  source-7.6           {invalid command name "cleanupTests"}
  namespace-old-10.8   explode
}
