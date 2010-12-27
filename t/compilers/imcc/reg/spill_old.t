#!perl
# Copyright (C) 2001-2008, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Parrot::Test tests => 5;

pir_output_is( <<'CODE', <<'OUT', "bug #32996" );

.namespace ["Foo"]

.sub __biginit :main
        $S0 = "Foo"
        newclass $P0, $S0
        $P1 = new $S0
        $P1.'method1'()
        $P1.'method2'()

        $P2 = new $S0
        $P2.'method1'()
        $P2.'method2'()

        $P3 = new $S0
        $P3.'method1'()
        $P3.'method2'()

        $P4 = new $S0
        $P4.'method1'()
        $P4.'method2'()

        $P5 = new $S0
        $P5.'method1'()
        $P5.'method2'()

        $P6 = new $S0
        $P6.'method1'()
        $P6.'method2'()

        $P7 = new $S0
        $P7.'method1'()
        $P7.'method2'()

        $P8 = new $S0
        $P8.'method1'()
        $P8.'method2'()

        $P9 = new $S0
        $P9.'method1'()
        $P9.'method2'()

        $P10 = new $S0
        $P10.'method1'()
        $P10.'method2'()

        $P11 = new $S0
        $P11.'method1'()
        $P11.'method2'()

        $P12 = new $S0
        $P12.'method1'()
        $P12.'method2'()

        $P13 = new $S0
        $P13.'method1'()
        $P13.'method2'()

        $P14 = new $S0
        $P14.'method1'()
        $P14.'method2'()

        $P15 = new $S0
        $P15.'method1'()
        $P15.'method2'()

        $P1.'method1'()
        $P1.'method2'()
        $P2.'method1'()
        $P2.'method2'()
        $P3.'method1'()
        $P3.'method2'()
        $P4.'method1'()
        $P4.'method2'()
        $P5.'method1'()
        $P5.'method2'()
        $P6.'method1'()
        $P6.'method2'()
        $P7.'method1'()
        $P7.'method2'()
        $P8.'method1'()
        $P8.'method2'()
        $P9.'method1'()
        $P9.'method2'()
        $P10.'method1'()
        $P10.'method2'()
        $P11.'method1'()
        $P11.'method2'()
        $P12.'method1'()
        $P12.'method2'()
        $P13.'method1'()
        $P13.'method2'()
        $P14.'method1'()
        $P14.'method2'()
        $P15.'method1'()
        $P15.'method2'()

        end
.end

.sub method1 :method
        print "In method 1\n"
        .begin_return
        .end_return
.end

.sub method2 :method
        print "In method 2\n"
        .begin_return
        .end_return
.end
CODE
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
OUT

sub repeat {
    my ( $template, $count, %substs ) = @_;
    my ( $code, $n, $start );
    foreach ( split( /\n/, $template ) ) {
        $n     = $count;
        $start = 0;
        if (/^(.*)=(\w+)=(.*)/) {
            my ( $pre, $key, $post ) = ( $1, $2, $3 );
            if ( $key eq 'ARGS' ) {
                my @params;
                for my $i ( 0 .. $n - 1 ) {
                    ( my $new = $substs{$key} ) =~ s/\<index\>/$i/g;
                    push @params, $new;
                }
                $code .= $pre . join( ',', @params ) . "$post\n";
                next;
            }
            $start = $n / 2 if ( $key eq 'TESTS2' );
            for my $i ( $start .. $n - 1 ) {
                ( my $new = $substs{$key} ) =~ s/\<index\>/$i/g;
                $code .= "$pre$new$post\n";
            }
        }
        else {
            $code .= "$_\n";
        }
    }

    return $code;
}
my $template2 = <<'TEMPLATE';
.sub _main :main
    =LOCALS=
    =INITS=
    _sub(=ARGS=)
    =TESTS2=
    end
fail:
    print "failed\n"
    end
.end
.sub _sub
    =PARAMS=
    =TESTS=
    print "all params ok\n"
    .return()
fail:
    print "failed\n"
    end
.end
TEMPLATE

my $code = repeat(
    $template2, 18,
    LOCALS => ".local pmc a<index>\n\ta<index> = new 'Integer'",
    INITS  => 'a<index> = <index>',
    ARGS   => 'a<index>',
    PARAMS => '.param pmc a<index>',
    TESTS  => "set \$I0, a<index>\nne \$I0, <index>, fail",
    TESTS2 => "set \$I0, a<index>\nne \$I0, <index>, fail"
);

pir_output_is( $code, <<'OUT', "overflow pmcs 18 spill" );
all params ok
OUT

$code = repeat(
    $template2, 22,
    LOCALS => ".local pmc a<index>\n\ta<index> = new 'Integer'",
    INITS  => 'a<index> = <index>',
    ARGS   => 'a<index>',
    PARAMS => '.param pmc a<index>',
    TESTS  => "set \$I0, a<index>\nne \$I0, <index>, fail",
    TESTS2 => "set \$I0, a<index>\nne \$I0, <index>, fail"
);

pir_output_is( $code, <<'OUT', "overflow pmcs 22 spill" );
all params ok
OUT

$code = repeat(
    $template2, 40,
    LOCALS => ".local pmc a<index>\n\ta<index> = new 'Integer'",
    INITS  => 'a<index> = <index>',
    ARGS   => 'a<index>',
    PARAMS => '.param pmc a<index>',
    TESTS  => "set \$I0, a<index>\nne \$I0, <index>, fail",
    TESTS2 => "set \$I0, a<index>\nne \$I0, <index>, fail"
);

pir_output_is( $code, <<'OUT', "overflow pmcs 40 spill" );
all params ok
OUT

$code = repeat(
    $template2, 60,
    LOCALS => ".local pmc a<index>\n\ta<index> = new 'Integer'",
    INITS  => 'a<index> = <index>',
    ARGS   => 'a<index>',
    PARAMS => '.param pmc a<index>',
    TESTS  => "set \$I0, a<index>\nne \$I0, <index>, fail",
    TESTS2 => "set \$I0, a<index>\nne \$I0, <index>, fail"
);

pir_output_is( $code, <<'OUT', "overflow pmcs 60 spill" );
all params ok
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
