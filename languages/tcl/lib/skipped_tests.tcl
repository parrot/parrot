        # RT#40716: Some of these tests cause pathological harness
        # failures. skip them.  Put the skip here instead of in the test
        # file to keep all our hacks in one basket.

        # Other tests are parsable, and generally work, but require a
        # feature that hasn't been implemented, making passing them
        # impossible

array set skipped_tests {
  append-4.21          explode
  append-4.22          explode
  append-5.1           explode
  append-7.1           {trace}
  append-7.2           {trace}
  append-7.3           {trace}
  append-7.4           {trace}
  append-7.5           {trace}
  apply-2.2            stacktrace
  apply-2.3            stacktrace
  apply-2.4            stacktrace
  apply-2.5            stacktrace
  apply-5.1            stacktrace
  appendComp-5.1       explode
  appendComp-7.1       {trace}
  appendComp-7.2       {trace}
  appendComp-7.3       {trace}
  appendComp-7.4       {trace}
  appendComp-7.5       {trace}
  appendComp-7.6       {trace}
  appendComp-7.7       {trace}
  appendComp-7.8       {trace}
  appendComp-7.9       {trace}
  basic-46.1           explode
  compExpr-old-14.14   explode
  cmdMZ-5.7            stacktrace
  basic-1.1            {interp}
  basic-10.1           {interp}
  dict-2.3             {lsearch -exact}
  dict-11.1            {expr wide()}
  dict-11.2            {expr wide()}
  dict-11.3            {expr wide()}
  dict-11.4            {expr wide()}
  dict-11.5            {expr wide()}
  dict-11.6            {expr wide()}
  dict-11.7            {expr wide()}
  dict-14.12           stacktrace
  dict-17.13           stacktrace
  dict-21.13           {dict update}
  error-1.3            stacktrace
  error-2.3            stacktrace
  error-2.6            stacktrace
  error-4.2            stacktrace
  error-4.3            stacktrace
  error-4.4            stacktrace
  expr-14.14           explode
  expr-old-2.38        explode
  expr-old-32.41       explode
  expr-old-32.42       explode
  expr-old-32.49       explode
  expr-old-34.9        explode
  expr-old-34.10       explode
  expr-old-36.3        explode
  expr-old-36.4        explode
  expr-old-36.8        explode
  eval-2.5             stacktrace
  for-3.6              {[lsearch -regexp]}
  format-3.1           explode
  format-3.2           explode
  format-8.17          explode
  format-8.18          explode
  iocmd-12.6           stacktrace
  incr-2.30            stacktrace 
  incr-2.31            stacktrace 
  incr-old-2.4         stacktrace
  incr-old-2.5         stacktrace
  lindex-3.7           {expr wide()}
  misc-1.2             stacktrace
  namespace-old-2.5    explode
  namespace-old-2.7    explode
  parse-9.2            stacktrace
  parse-10.14          stacktrace
  set-2.1              stacktrace
  set-4.1              stacktrace
  string-13.6          explode
  string-13.8          explode
  string-14.11         explode
  string-18.7          explode
  string-18.9          explode
  string-20.4          explode
  string-20.5          explode
  var-6.3              {Cannot get character of empty string}
  var-7.12             {Cannot take substr outside string}
  var-12.1             {Cannot take substr outside string}
  while-old-4.6        stacktrace
}

# Tests after which there is non-test code which causes an error. Another
# hack which allows us to count passing tests that would otherwise be dropped
# on the floor.

array set abort_after {
  uplevel-5.2          {invalid command name "set"}
  utf-1.4              {Invalid character for UTF-8 encoding}
  env-1.3              {can't read "env(test)" no such element in array}
  event-4.2            {invalid command name "update"}
  parse-19.4           {invalid command name "cleanupTests"}
  source-7.6           {invalid command name "cleanupTests"}
  cmdAH-31.13          {invalid command name "cd"}
  ioUtil-2.8           {invalid command name "cd"}
  iocmd-12.8           {invalid command name "close"}
  basic-49.2           {can't delete "run" command doesn't exist}
  filename-11.13       {invalid command name "cd"}
}
