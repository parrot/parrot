#! perl
# $Id$

# Copyright (C) 2001-2007, The Perl Foundation.

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../lib";

use Test::More tests => 82;
use Parrot::Test;

my @tests = (
    # zero?
    [ q{ (zero?  0) }              => q{#t}             ],
    [ q{ (zero? -0) }              => q{#t}             ],
    [ q{ (zero? +0) }              => q{#t}             ],
    [ q{ (zero?  2) }              => q{#f}             ],
    [ q{ (zero? -2) }              => q{#f}             ],
    [ q{ (zero? +2) }              => q{#f}             ],
    [ q{ (zero? 0.0) }             => q{#t}             ],
    [ q{ (zero? -0.0) }            => q{#t}             ],
    [ q{ (zero? +0.0) }            => q{#t}             ],
    [ q{ (zero?  0.00000) }        => q{#t}             ],
    [ q{ (zero? -0.00000) }        => q{#t}             ],
    [ q{ (zero? +0.00000) }        => q{#t}             ],
    [ q{ (zero?  0.000001) }       => q{#f}             ],
    [ q{ (zero? -0.000001) }       => q{#f}             ],
    [ q{ (zero? +0.000001) }       => q{#f}             ],

    # positive?
    [ q{ (positive?  0) }          => q{#f}             ],
    [ q{ (positive? -0) }          => q{#f}             ],
    [ q{ (positive? +0) }          => q{#f}             ],
    [ q{ (positive?  2) }          => q{#t}             ],
    [ q{ (positive? -2) }          => q{#f}             ],
    [ q{ (positive? +2) }          => q{#t}             ],
    [ q{ (positive? 0.0) }         => q{#f}             ],
    [ q{ (positive? -0.0) }        => q{#f}             ],
    [ q{ (positive? +0.0) }        => q{#f}             ],
    [ q{ (positive?  0.00000) }    => q{#f}             ],
    [ q{ (positive? -0.00000) }    => q{#f}             ],
    [ q{ (positive? +0.00000) }    => q{#f}             ],
    [ q{ (positive?  0.000001) }   => q{#t}             ],
    [ q{ (positive? -0.000001) }   => q{#f}             ],
    [ q{ (positive? +0.000001) }   => q{#t}             ],

    # negative?
    [ q{ (negative?  0) }          => q{#f}             ],
    [ q{ (negative? -0) }          => q{#f}             ],
    [ q{ (negative? +0) }          => q{#f}             ],
    [ q{ (negative?  2) }          => q{#f}             ],
    [ q{ (negative? -2) }          => q{#t}             ],
    [ q{ (negative? +2) }          => q{#f}             ],
    [ q{ (negative? 0.0) }         => q{#f}             ],
    [ q{ (negative? -0.0) }        => q{#f}             ],
    [ q{ (negative? +0.0) }        => q{#f}             ],
    [ q{ (negative?  0.00000) }    => q{#f}             ],
    [ q{ (negative? -0.00000) }    => q{#f}             ],
    [ q{ (negative? +0.00000) }    => q{#f}             ],
    [ q{ (negative?  0.000001) }   => q{#f}             ],
    [ q{ (negative? -0.000001) }   => q{#t}             ],
    [ q{ (negative? +0.000001) }   => q{#f}             ],

    # odd?
    [ q{ (odd? 0) }                => q{#f}             ],
    [ q{ (odd? 1) }                => q{#t}             ],
    [ q{ (odd? 2) }                => q{#f}             ],
    [ q{ (odd? -3) }               => q{#t}             ],

    # even?
    [ q{ (even? 0) }               => q{#t}             ],
    [ q{ (even? 1) }               => q{#f}             ],
    [ q{ (even? 2) }               => q{#t}             ],
    [ q{ (even? -3) }              => q{#f}             ],

    # max
    [ q{ (max 1 3) }               => 3                 ],
    [ q{ (max 9 3 5) }             => 9                 ],
    [ q{ (max 3 1) }               => 3                 ],
    [ q{ (max 1 9 3) }             => 9                 ],

    # min
    [ q{ (min 1 3) }               => 1                 ],
    [ q{ (min 9 3 5) }             => 3                 ],
    [ q{ (min 3 1) }               => 1                 ],
    [ q{ (min 1 9 3) }             => 1                 ],

    # =
    [ q{ (= 0 0) }                 => '#t'              ],
    [ q{ (= 1 0) }                 => '#f'              ],
    [ q{ (= 0 1) }                 => '#f'              ],
    [ q{ (= 0 0) }                 => '#t'              ],
    [ q{ (= 1 0) }                 => '#f'              ],
    [ q{ (= 0 1) }                 => '#f'              ],

    # <
    [ q{ (< 0 1) }                 => '#t'              ],
    [ q{ (< 1 1) }                 => '#f'              ],
    [ q{ (< 0 1 2) }               => '#t'              ],
    [ q{ (< 1 1 2) }               => '#f'              ],

    # >
    [ q{ (> 1 0) }                 => '#t'              ],
    [ q{ (> 1 1) }                 => '#f'              ],
    [ q{ (> 2 1 0) }               => '#t'              ],
    [ q{ (> 2 1 1) }               => '#f'              ],

    # <=
    [ q{ (<= 0 0) }                => '#t'              ],
    [ q{ (<= 1 0) }                => '#f'              ],
    [ q{ (<= 1 2) }                => '#t'              ],
    [ q{ (<= 2 1 0) }              => '#f'              ],
    [ q{ (<= 2 1 1) }              => '#f'              ],

    # >=
    [ q{ (<= 2 3 3) }              => '#t'              ],
    [ q{ (<= 2 3 2) }              => '#f'              ],
);

foreach ( @tests ) {
    my ( $code, $expected ) = @{$_};

    language_output_is( 'Scheme', qq{ (write $code) }, $expected, $code );
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
