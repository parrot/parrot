# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

use Test::More tests => 7;

BEGIN { use_ok( 'Generator' ); }
require_ok( 'Generator' );

my $generator = Generator->new();

is_deeply(
  $generator->generate(
    [ [ 'SCALAR', '=',
        [ 'SCALAR', '$a' ],
        [ 'SCALAR', '5' ],
      ],
    ]
  ),
  [ [ '', 'new', 'P0', 'PerlInt', '# $a' ],
    [ '', 'set', 'P0', '5' ],
    [ '', 'end' ],
  ],
  '$a = 5');

is_deeply(
  $generator->generate(
    [ [ 'SCALAR', '=',
        [ 'SCALAR', '$a' ],
        [ 'SCALAR', q("foo") ],
      ],
    ]
  ),
  [ [ '', 'new', 'P0', 'PerlInt', '# $a' ],
    [ '', 'set', 'P0', q("foo") ],
    [ '', 'end' ],
  ],
  '$a = "foo"');

is_deeply(
  $generator->generate(
    [ [ 'SCALAR', '=',
        [ 'SCALAR', '$a' ],
        [ 'SCALAR', '+',
          [ 'SCALAR', '5' ],
          [ 'SCALAR', '3' ],
        ],
      ],
    ]
  ),
  [ [ '', 'new', 'P0', 'PerlInt', '# $a' ],
    [ '', 'new', 'P1', 'PerlInt', '# $__TEMP0000' ],
    [ '', 'add', 'P1', '5', '3' ],
    [ '', 'clone', 'P0', 'P1' ],
    [ '', 'end' ],
  ],
  '$a = "foo"');

is_deeply(
  $generator->generate(
    [ [ 'SCALAR', '=',
        [ 'SCALAR', '$a' ],
        [ 'SCALAR', '+',
          [ 'SCALAR', '$b' ],
          [ 'SCALAR', '5' ],
        ],
      ],
    ]
  ),
  [ [ '', 'new', 'P0', 'PerlInt', '# $a' ],
    [ '', 'new', 'P1', 'PerlInt', '# $__TEMP0000' ],
    [ '', 'new', 'P2', 'PerlInt', '# $b' ],
    [ '', 'add', 'P1', 'P2', '5' ],
    [ '', 'clone', 'P0', 'P1' ],
    [ '', 'end' ],
  ],
  '$a = $b + 5');

is_deeply(
  $generator->generate(
    [ [ 'SCALAR', '=',
        [ 'SCALAR', '$a' ],
        [ 'SCALAR', '+',
          [ 'SCALAR', '-',
            [ 'SCALAR', '$b' ],
            [ 'SCALAR', '7' ],
          ],
          [ 'SCALAR', '5' ],
        ],
      ],
    ]
  ),
  [ [ '', 'new', 'P0', 'PerlInt', '# $a' ],
    [ '', 'new', 'P1', 'PerlInt', '# $__TEMP0000' ],
    [ '', 'new', 'P2', 'PerlInt', '# $__TEMP0001' ],
    [ '', 'new', 'P3', 'PerlInt', '# $b' ],
    [ '', 'sub', 'P2', 'P3', '7' ],
    [ '', 'add', 'P1', 'P2', '5' ],
    [ '', 'clone', 'P0', 'P1' ],
    [ '', 'end' ],
  ],
  '$a = $b - 7 + 5');
