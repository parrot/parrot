        # RT#40716: Some of these tests cause pathological harness
        # failures. skip them.  Put the skip here instead of in the test
        # file to keep all our hacks in one basket.

        # Other tests are parsable, and generally work, but require a
        # feature that hasn't been implemented, making passing them
        # impossible

array set skipped_tests {
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
  appendComp-7.1       {trace}
  appendComp-7.2       {trace}
  appendComp-7.3       {trace}
  appendComp-7.4       {trace}
  appendComp-7.5       {trace}
  appendComp-7.6       {trace}
  appendComp-7.7       {trace}
  appendComp-7.8       {trace}
  appendComp-7.9       {trace}
  basic-46.1           stacktrace
  basic-11.1           {interp}
  basic-12.1           {interp}
  basic-12.2           {interp}
  basic-13.1           {interp}
  basic-13.2           {interp}
  basic-14.1           {expand}
  basic-14.2           {expand}
  basic-15.1           {expand}
  basic-18.1           {expand}
  basic-18.3           {expand}
  basic-18.4           {expand}
  basic-18.6           {expand}
  basic-20.1           {expand}
  basic-22.1           {expand}
  basic-24.1           {interp}
  basic-24.2           {expand}
  basic-36.1           {expand, interp}
  cmdAH-2.2            {file}
  cmdAH-2.3            {file}
  cmdAH-2.4            {file}
  cmdAH-2.5            {file}
  cmdAH-2.6            {file}
  cmdAH-2.6.1          {file}
  cmdAH-2.6.2          {file}
  cmdMZ-2.10           stacktrace
  cmdMZ-3.5            stacktrace
  cmdMZ-5.7            stacktrace
  basic-1.1            {interp}
  basic-10.1           {interp}
  dict-2.3             {lsearch -exact}
  dict-3.5             {nested lists}
  dict-3.6             {nested lists}
  dict-3.7             {nested lists}
  dict-3.8             {nested lists}
  dict-3.9             {nested lists}
  dict-3.10            {nested lists}
  dict-9.3             {nested lists}
  dict-9.4             {nested lists}
  dict-9.5             {nested lists}
  dict-11.1            {expr wide()}
  dict-11.2            {expr wide()}
  dict-11.3            {expr wide()}
  dict-11.4            {expr wide()}
  dict-11.5            {expr wide()}
  dict-11.6            {expr wide()}
  dict-11.7            {expr wide()}
  dict-15.3            {nested lists}
  dict-15.5            {nested lists}
  dict-16.4            {nested lists}
  dict-14.12           stacktrace
  dict-17.13           stacktrace
  dict-21.8            {lassign}
  error-1.3            stacktrace
  error-1.8            {uplevel bug}
  error-2.3            stacktrace
  error-2.6            stacktrace
  error-4.2            stacktrace
  error-4.3            stacktrace
  error-4.4            stacktrace
  eval-2.5             stacktrace
  for-3.6              {[lsearch -regexp]}
  format-3.1           segfault
  format-3.2           segfault
  format-8.17          {Cannot get character past end of string}
  format-8.18          {Cannot get character past end of string} 
  iocmd-12.6           stacktrace
  if-5.3               stacktrace
  if-6.4               stacktrace
  if-10.6              {trace}
  incr-2.30            stacktrace 
  incr-2.31            stacktrace 
  incr-old-2.4         stacktrace
  incr-old-2.5         stacktrace
  lindex-3.7           {expr wide()}
  misc-1.2             stacktrace
  namespace-old-2.5    explode
  namespace-old-2.6    explode
  namespace-old-2.7    explode
  namespace-old-4.4    explode
  namespace-old-7.7    explode
  parse-9.2            stacktrace
  parse-10.14          stacktrace
  scan-14.1            {Inf support}
  scan-14.2            {Inf support}
  set-2.1              stacktrace
  set-4.1              stacktrace
  string 5.14          {binary}
  string-13.6          {Cannot repeat with negative arg}
  string-13.8          {Cannot repeat with negative arg}
  string-14.11         {Can only replace inside string or index after end of string}
  string-18.7          {Cannot take substr outside string}
  string-18.9          {Cannot take substr outside string}
  string-20.4          {Cannot take substr outside string}
  string-20.5          {Cannot take substr outside string}
  stringComp-5.14      {binary}
  stringComp-9.7       {binary}
  switch-4.1           stacktrace
  var-6.3              {Cannot get character of empty string}
  var-7.12             {Cannot take substr outside string}
  var-12.1             {Cannot take substr outside string}
  while-4.3            stacktrace
  while-old-4.6        stacktrace
  binary-22.3          {no ICU lib loaded}
  binary-22.4          {no ICU lib loaded}
  binary-22.5          {no ICU lib loaded}
  binary-22.11         {no ICU lib loaded}
  binary-23.3          {no ICU lib loaded}
  binary-23.4          {no ICU lib loaded}
  binary-23.11         {no ICU lib loaded}
  binary-24.2          {no ICU lib loaded}
  binary-24.3          {no ICU lib loaded}
  binary-24.4          {no ICU lib loaded}
  binary-24.6          {no ICU lib loaded}
  binary-24.10         {no ICU lib loaded}
  binary-25.2          {no ICU lib loaded}
  binary-25.3          {no ICU lib loaded}
  binary-25.4          {no ICU lib loaded}
  binary-25.6          {no ICU lib loaded}
  binary-25.10         {no ICU lib loaded}
  binary-26.2          {no ICU lib loaded}
  binary-26.3          {no ICU lib loaded}
  binary-26.4          {no ICU lib loaded}
  binary-26.5          {no ICU lib loaded}
  binary-26.6          {no ICU lib loaded}
  binary-26.7          {no ICU lib loaded}
  binary-26.10         {no ICU lib loaded}
  binary-27.2          {no ICU lib loaded}
  binary-27.3          {no ICU lib loaded}
  binary-27.4          {no ICU lib loaded}
  binary-27.5          {no ICU lib loaded}
  binary-27.6          {no ICU lib loaded}
  binary-27.9          {no ICU lib loaded}
  binary-28.2          {no ICU lib loaded}
  binary-28.3          {no ICU lib loaded}
  binary-28.4          {no ICU lib loaded}
  binary-28.5          {no ICU lib loaded}
  binary-28.6          {no ICU lib loaded}
  binary-28.9          {no ICU lib loaded}
  binary-29.2          {no ICU lib loaded}
  binary-29.3          {no ICU lib loaded}
  binary-29.4          {no ICU lib loaded}
  binary-29.5          {no ICU lib loaded}
  binary-29.6          {no ICU lib loaded}
  binary-29.9          {no ICU lib loaded}
  binary-30.2          {no ICU lib loaded}
  binary-30.3          {no ICU lib loaded}
  binary-30.4          {no ICU lib loaded}
  binary-30.5          {no ICU lib loaded}
  binary-30.6          {no ICU lib loaded}
  binary-30.9          {no ICU lib loaded}
  binary-31.2          {no ICU lib loaded}
  binary-31.3          {no ICU lib loaded}
  binary-31.4          {no ICU lib loaded}
  binary-31.5          {no ICU lib loaded}
  binary-31.6          {no ICU lib loaded}
  binary-31.7          {no ICU lib loaded}
  binary-31.8          {no ICU lib loaded}
  binary-31.9          {no ICU lib loaded}
  binary-31.10         {no ICU lib loaded}
  binary-31.11         {no ICU lib loaded}
  binary-31.13         {no ICU lib loaded}
  binary-31.14         {no ICU lib loaded}
  binary-31.15         {no ICU lib loaded}
  binary-32.2          {no ICU lib loaded}
  binary-32.3          {no ICU lib loaded}
  binary-32.4          {no ICU lib loaded}
  binary-32.5          {no ICU lib loaded}
  binary-32.6          {no ICU lib loaded}
  binary-32.7          {no ICU lib loaded}
  binary-32.8          {no ICU lib loaded}
  binary-32.9          {no ICU lib loaded}
  binary-32.10         {no ICU lib loaded}
  binary-32.11         {no ICU lib loaded}
  binary-32.13         {no ICU lib loaded}
  binary-32.14         {no ICU lib loaded}
  binary-32.15         {no ICU lib loaded}
  binary-39.1          {no ICU lib loaded}
  binary-39.2          {no ICU lib loaded}
  binary-39.3          {no ICU lib loaded}
  binary-39.4          {no ICU lib loaded}
  binary-39.5          {no ICU lib loaded}
  binary-41.5          {no ICU lib loaded}
  binary-41.6          {no ICU lib loaded}
  binary-41.7          {no ICU lib loaded}
  binary-41.8          {no ICU lib loaded}
  binary-46.5          {no ICU lib loaded}
  binary-54.2          {no ICU lib loaded}
  binary-54.3          {no ICU lib loaded}
  binary-54.4          {no ICU lib loaded}
  binary-54.5          {no ICU lib loaded}
  binary-54.6          {no ICU lib loaded}
  binary-54.9          {no ICU lib loaded}
  binary-55.2          {no ICU lib loaded}
  binary-55.3          {no ICU lib loaded}
  binary-55.4          {no ICU lib loaded}
  binary-55.5          {no ICU lib loaded}
  binary-55.6          {no ICU lib loaded}
  binary-55.9          {no ICU lib loaded}
  binary-56.2          {no ICU lib loaded}
  binary-56.3          {no ICU lib loaded}
  binary-56.4          {no ICU lib loaded}
  binary-56.5          {no ICU lib loaded}
  binary-56.6          {no ICU lib loaded}
  binary-56.9          {no ICU lib loaded}
  binary-57.2          {no ICU lib loaded}
  binary-57.3          {no ICU lib loaded}
  binary-57.4          {no ICU lib loaded}
  binary-57.5          {no ICU lib loaded}
  binary-57.6          {no ICU lib loaded}
  binary-57.9          {no ICU lib loaded}
  binary-58.2          {no ICU lib loaded}
  binary-58.3          {no ICU lib loaded}
  binary-58.4          {no ICU lib loaded}
  binary-58.5          {no ICU lib loaded}
  binary-58.6          {no ICU lib loaded}
  binary-58.7          {no ICU lib loaded}
  binary-58.8          {no ICU lib loaded}
  binary-58.9          {no ICU lib loaded}
  binary-58.10         {no ICU lib loaded}
  binary-58.11         {no ICU lib loaded}
  binary-58.13         {no ICU lib loaded}
  binary-58.14         {no ICU lib loaded}
  binary-58.15         {no ICU lib loaded}
  binary-59.2          {no ICU lib loaded}
  binary-59.3          {no ICU lib loaded}
  binary-59.4          {no ICU lib loaded}
  binary-59.5          {no ICU lib loaded}
  binary-59.6          {no ICU lib loaded}
  binary-59.7          {no ICU lib loaded}
  binary-59.8          {no ICU lib loaded}
  binary-59.9          {no ICU lib loaded}
  binary-59.10         {no ICU lib loaded}
  binary-59.11         {no ICU lib loaded}
  binary-59.13         {no ICU lib loaded}
  binary-59.14         {no ICU lib loaded}
  binary-59.15         {no ICU lib loaded}
  cmdIL-4.24           {no ICU lib loaded}
  cmdIL-4.25           {no ICU lib loaded}
  expr-8.13            {no ICU lib loaded}
  parseOld-7.12        {no ICU lib loaded}
  scan-7.6             {no ICU lib loaded}
  scan-7.7             {no ICU lib loaded}
  subst-3.2            {no ICU lib loaded}
  string-2.12          {no ICU lib loaded}
  string-2.31          {no ICU lib loaded}
  string-3.4           {no ICU lib loaded}
  string-6.19          {no ICU lib loaded}
  string-6.83          {no ICU lib loaded}
  string-6.84          {no ICU lib loaded}
  string-6.85          {no ICU lib loaded}
  string-6.88          {no ICU lib loaded}
  string-6.109         {no ICU lib loaded}
  string-8.3           {no ICU lib loaded}
  string-10.13         {no ICU lib loaded}
  string-11.33         {no ICU lib loaded}
  string-12.20         {no ICU lib loaded}
  string-15.10         {no ICU lib loaded}
  string-16.10         {no ICU lib loaded}
  string-17.6          {no ICU lib loaded}
  string-17.7          {no ICU lib loaded}
  string-18.11         {no ICU lib loaded}
  string-21.10         {no ICU lib loaded}
  string-21.11         {no ICU lib loaded}
  string-21.12         {no ICU lib loaded}
  string-21.13         {no ICU lib loaded}
  string-22.11         {no ICU lib loaded}
  stringComp-2.12      {no ICU lib loaded}
  stringComp-2.31      {no ICU lib loaded}
  stringComp-3.4       {no ICU lib loaded}
  stringComp-8.3       {no ICU lib loaded}
  stringComp-11.33     {no ICU lib loaded}
  util-4.6             {no ICU lib loaded}
  util-5.7             {no ICU lib loaded}
  util-5.18            {no ICU lib loaded}
  util-5.42            {no ICU lib loaded}
  util-5.43            {no ICU lib loaded}
  util-8.3             {no ICU lib loaded}
}

# Tests after which there is non-test code which causes an error. Another
# hack which allows us to count passing tests that would otherwise be dropped
# on the floor.

array set abort_after {
  basic-47.1           {need interp before these can work}
  cmdMZ-5.7            {invalid command name "cleanupTests"}
  cmdMZ-return-2.17    {foreach handling borked?}
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
  namespace-old-10.8   explode
}
