# $Id$

use strict;

use Parrot::Test tests => 3;

# Test the m4-Builtin function 'eval'

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'basic expressions' );
eval(   `4')
eval(   `0')
eval(   `-4')
eval(   `-0')
eval(   ` 1 + 1 ' )
eval(   ` 42 + -43 ' )
eval(   `42 + -44' )
eval(`4*4')
eval(`4*4')
eval(    `5 * 6'         )
eval(    `-20 / 4'         )
eval(    `-20 / 4 * 8'         )
eval(    `-20 / 4 * 8 + 17'         )
asdf eval(    `-20 / 4 * 8 + 17'         ) jklm
-23 = eval(    `-20 / 4 * 8 + 17'         ) jklm
-20 / 4 * 8 + 17 = eval(    `-20 / 4 * 8 + 17'         ) jklm
CODE
4
0
-4
0
2
-1
-2
16
16
30
-5
-40
-23
asdf -23 jklm
-23 = -23 jklm
-20 / 4 * 8 + 17 = -23 jklm
OUT
}


{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'all ops besides bitwise ops' );
1   eval(   `4**5')
2   eval(   `2**10')
3   eval(   `   2   ** 10  '  )
4   eval(   `  -2   ** 10  '  )
5   eval(   `  -4 *512 / -2    '  )
6   eval(   `  2049 % 1025    '  )
7   eval(   `  2048 >> 1 '  )
8   eval(   `  256 <<2 '  )
9   eval(   `  256 == 1024 / 4'  )
10  eval(   `  256 != 1024 / 4'  )
11  eval(   `  256 <= 256'  )
12  eval(   `  256 >= 256'  )
13  eval(   `  256 > 256'  )
14  eval(   `  256 > 256'  )
15  eval(   `  256 > 257'  )
16  eval(   ` !  256 > 257'  )
17  eval(   ` !! !  256 > 257'  )
18  eval(   ` 1 && 0'  )
19  eval(   ` 1026 || 0'  )
CODE
1   1024
2   1024
3   1024
4   1024
5   1024
6   1024
7   1024
8   1024
9   1
10  0
11  1
12  1
13  0
14  0
15  0
16  1
17  1
18  0
19  1
OUT
}


{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'bitwise ops' );
1   eval(   `1 | 2')  bitwise OR
2   eval(   `1 | 3')  bitwise OR
3   eval(   `4 & 5')  bitwise AND
4   eval(   `4 ^ 5')  bitwise XOR
5   eval(   `~ 254')  bitwise negation
CODE
1   3  bitwise OR
2   3  bitwise OR
3   4  bitwise AND
4   1  bitwise XOR
5   -255  bitwise negation
OUT
}
