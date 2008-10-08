require 'test'
plan 11

Kernel.printf("%s %d %s\n", 'ok', 1, '- .printf() on Kernel')
printf("%s %d %s\n", 'ok', 2, '- .printf()')

$testnum = 3
str = sprintf("%s %d %s", 'ok', 999, '- .sprintf()')
is str, 'ok 999 - .sprintf()', '.sprintf()'

str = Kernel.sprintf("%d little bears in the bed.", 4)
is str, '4 little bears in the bed.', '.sprintf w/ %d on Kernel'

str = Kernel.sprintf("%.3f little bears in the bed.", 4.25)
is str, '4.250 little bears in the bed.', '.sprintf w/ %f on Kernel'

str = Kernel.sprintf("%d little %s in the bed.", 9 + 1, "bears")
is str, '10 little bears in the bed.', '.sprintf multiple params on Kernel'

str = Kernel.sprintf("%x %x %x %x %x %x", 10, 11, 12, 13, 14, 15)
is str, 'a b c d e f', '.sprintf w/ %x on Kernel'

str = Kernel.sprintf("%X %X %X %X %X %X", 10, 11, 12, 13, 14, 15)
is str, 'A B C D E F', '.sprintf w/ %X on Kernel'

str = Kernel.sprintf(":%5s:", '---')
is str, ':  ---:', '.sprintf %s /w right pad on Kernel'

str = Kernel.sprintf(":%-5s:", '---')
is str, ':---  :', '.sprintf %s /w left pad on Kernel'

str = Kernel.sprintf(":%05d:", '123')
is str, ':00123:', '.sprintf w/ %s on Kernel'

