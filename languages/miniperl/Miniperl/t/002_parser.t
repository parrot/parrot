# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

use Test::More tests => 30;

BEGIN { use_ok( 'Parser' ); }
require_ok( 'Parser' );

my $parse = Parser->new();

#
# Unary minus
#
is_deeply($parse->parse([qw(- 5)]),
          [ ['SCALAR', '-5' ]
          ],
          'unary minus - integer');

is_deeply($parse->parse([qw(- 5.6)]),
          [ ['SCALAR', '-5.6' ]
          ],
          'unary minus - number');

is_deeply($parse->parse([qw(- $a)]),
          [ [ 'SCALAR', '-',
              [ 'SCALAR','$a' ]
            ]
          ],
          'unary minus - scalar');

is_deeply($parse->parse([qw(- @a [ 5 ])]),
          [ [ 'SCALAR', '-', 
              [ 'SCALAR', '@a',
                [ 'SCALAR', 5 ],
              ]
            ]
          ],
          'unary minus - scalar');

#
# Unary plus
#
is_deeply($parse->parse([qw(+ 5)]),
          [ ['SCALAR', '5' ]
          ],
          'unary plus - integer');

is_deeply($parse->parse([qw(+ 5.6)]),
          [ ['SCALAR', '5.6' ]
          ],
          'unary plus - number');

is_deeply($parse->parse([qw(+ $a)]),
          [ ['SCALAR', '$a' ]
          ],
          'unary plus - scalar');

is_deeply($parse->parse([qw(+ @a [ 5 ])]),
          [ [ 'SCALAR', '@a',
              [ 'SCALAR', 5 ],
            ]
          ],
          'unary plus - scalar');

#
# Print scalar/array
#
is_deeply($parse->parse([qw(print 1)]),
          [ [ 'SCALAR','print',
              ['SCALAR', '1']
            ],
          ],
          'print');

is_deeply($parse->parse([qw(print $blah)]),
          [ [ 'SCALAR','print',
              ['SCALAR', '$blah']
            ],
          ],
          'print');

is_deeply($parse->parse([qw(print @foo [ 0 ])]),
          [ [ 'SCALAR','print',
              [ 'SCALAR', '@foo',
                ['SCALAR','0']
              ]
            ],
          ],
          'print');

is_deeply($parse->parse([qw(print @foo)]),
          [ [ 'SCALAR','print',
              [ 'LIST', '@foo' ]
            ],
          ],
          'print');

#
# Scalar operators
#
is_deeply($parse->parse([qw(3 + 5)]),
          [ [ 'SCALAR','+',
              [ 'SCALAR', '3' ],
              [ 'SCALAR', '5' ],
            ],
          ],
          '3+5');

is_deeply($parse->parse([qw($a + 5)]),
          [ [ 'SCALAR','+',
              [ 'SCALAR', '$a' ],
              [ 'SCALAR', '5' ],
            ],
          ],
          '$a+5');

is_deeply($parse->parse([qw(7 - $a)]),
          [ [ 'SCALAR','-',
              [ 'SCALAR', '7' ],
              [ 'SCALAR', '$a' ],
            ],
          ],
          '7-$a');

is_deeply($parse->parse([qw(@a [ 6 ] + 5)]),
          [ [ 'SCALAR','+',
              [ 'SCALAR', '@a',
                [ 'SCALAR', 6 ],
              ],
              [ 'SCALAR', '5' ],
            ],
          ],
          '@a[6]+5');

is_deeply($parse->parse([qw(7 - @a [ 2 ])]),
          [ [ 'SCALAR','-',
              [ 'SCALAR', '7' ],
              [ 'SCALAR', '@a',
                [ 'SCALAR', '2' ],
              ],
            ],
          ],
          '7-@a[2]');

is_deeply($parse->parse([qw(@a [ 2 ] - $a)]),
          [ [ 'SCALAR','-',
              [ 'SCALAR', '@a',
                [ 'SCALAR', '2' ],
              ],
              [ 'SCALAR', '$a' ],
            ],
          ],
          '@a[2]-$a');

is_deeply($parse->parse([qw($a - @a [ 2 ])]),
          [ [ 'SCALAR','-',
              [ 'SCALAR', '$a' ],
              [ 'SCALAR', '@a',
                [ 'SCALAR', '2' ],
              ],
            ],
          ],
          '$a-@a[2]');

#
# Scalar assignment
#
is_deeply($parse->parse([qw(3 = 5)]),
          [ [ 'SCALAR','=',
              [ 'SCALAR', '3' ],
              [ 'SCALAR', '5' ],
            ],
          ],
          '3=5');

is_deeply($parse->parse([qw($a = 5)]),
          [ [ 'SCALAR','=',
              [ 'SCALAR', '$a' ],
              [ 'SCALAR', '5' ],
            ],
          ],
          '$a=5');

is_deeply($parse->parse([qw(7 = $a)]),
          [ [ 'SCALAR','=',
              [ 'SCALAR', '7' ],
              [ 'SCALAR', '$a' ],
            ],
          ],
          '7=$a');

is_deeply($parse->parse([qw(@a [ 6 ] = 5)]),
          [ [ 'SCALAR','=',
              [ 'SCALAR', '@a',
                [ 'SCALAR', 6 ],
              ],
              [ 'SCALAR', '5' ],
            ],
          ],
          '@a[6]=5');

is_deeply($parse->parse([qw(7 = @a [ 2 ])]),
          [ [ 'SCALAR','=',
              [ 'SCALAR', '7' ],
              [ 'SCALAR', '@a',
                [ 'SCALAR', '2' ],
              ],
            ],
          ],
          '7=@a[2]');

is_deeply($parse->parse([qw(@a [ 2 ] = $a)]),
          [ [ 'SCALAR','=',
              [ 'SCALAR', '@a',
                [ 'SCALAR', '2' ],
              ],
              [ 'SCALAR', '$a' ],
            ],
          ],
          '@a[2]=$a');

is_deeply($parse->parse([qw($a = @a [ 2 ])]),
          [ [ 'SCALAR','=',
              [ 'SCALAR', '$a' ],
              [ 'SCALAR', '@a',
                [ 'SCALAR', '2' ],
              ],
            ],
          ],
          '$a=@a[2]');

#
# Multiple lines
#
is_deeply($parse->parse([qw($a = 5 ; print $a)]),
          [ [ 'SCALAR', '=',
              [ 'SCALAR', '$a' ],
              [ 'SCALAR', '5' ],
            ],
            [ 'SCALAR', 'print',
              [ 'SCALAR', '$a' ],
            ],
          ],
          '$a=5;print $a');

is_deeply($parse->parse([qw($a = 5 ; print $a ; @b [ 7 ] = 5 ; print @b [ 7 ])]),
          [ [ 'SCALAR', '=',
              [ 'SCALAR', '$a' ],
              [ 'SCALAR', '5' ],
            ],
            [ 'SCALAR', 'print',
              [ 'SCALAR', '$a' ],
            ],
            [ 'SCALAR', '=',
              [ 'SCALAR', '@b',
                [ 'SCALAR', 7 ],
              ],
              [ 'SCALAR', '5' ],
            ],
            [ 'SCALAR', 'print',
              [ 'SCALAR', '@b',
                [ 'SCALAR', '7' ],
              ],
            ],
          ],
          '$a=5;print $a');
