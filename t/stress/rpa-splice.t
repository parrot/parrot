#! perl
# Copyright (C) 2014-2015, Parrot Foundation.

=head1 NAME

t/stress/rpa-slice.t - Smoke the ResizablePMCArray.splice variants

=head1 SYNOPSIS

    % prove -v t/stress/rpa-slice.t

=head1 DESCRIPTION

Test ResizablePMCArray.splice heap-buffer overflows with negative count arguments
under AddressSanitizer or valgrind.

Test the wrong splice shrink fast branch, as described in GH #1174, with the
params offset=3,size=2,tresh=8 and off=0, count=1, elems1=0, tail=1, sizediff=1.

Test wrong splice grow branch. #1175

Test offset past end of array warnings and correctness. #1176

=cut

use strict;
use warnings;
use lib qw(lib ../../lib);
my $maxsize;
BEGIN { $maxsize = @ARGV ? shift : 7}
use constant MAXSIZE => $maxsize; # 3 .. 9
use Parrot::Test;

sub is_memcheck {
    return 1 if $ENV{VALGRIND};
    require Config;
    my $ccflags = $Config::Config{ccflags};
    return 1 if $ccflags =~ /-fsanitize=(address|memory)/;
    0;
}

# Test rpa GH #766 heap-buffer-overflow with asan, when negative counts were allowed.
# This only makes sense with a memory checker. TODO: Maybe enable it also with --debugging.
if (is_memcheck) {
    for my $i0 (0..2) {
        for my $i1 (0..2) {
            for my $offset (-2..2) {
                for my $count (-2..2) {
                    pir_exit_code_is( << "CODE", 0, "ResizablePMCArray.splice $i0, $i1, $offset, $count");
.sub main :main
    .local pmc p0, p1
    p0 = new ['ResizablePMCArray']
    p1 = new ['ResizablePMCArray']
    p0 = $i0
    p1 = $i1
    push_eh eh
    splice p0, p1, $offset, $count
    eh:
.end
CODE
                }
            }
        }
    }
}

# test shrink fast with count-1, which deleted one too less #1174,
# test splice grow with count=2 #1175, and
# offset past end of array #1176
for my $count (0,1,2) {                # count to splice
    for my $i1 (0 .. $count) {         # size of p1, the @splice
        for my $i0 (0 .. MAXSIZE) {    # size of p0, self
            for my $off (0 .. $i0) {   # create internal offsets in p0
              CYCLE:
                for my $offset (0..2) {# offset to splice, positive only here
                    my (@result, @splice);
                    my $code = ".sub main :main
    .local pmc p0, p1
    p0 = new ['ResizablePMCArray']
    p1 = new ['ResizablePMCArray']
";
                    # fill p0, but not over 8
                    my $max = $i0-1 > 7 ? 7 : $i0-1;
                    for my $i (0 .. $max) {
                        my $c = chr(65+$i);
                        $code .= "    push p0, '$c'\n";
                        push @result, $c;
                    }
                    if ($i1) {
                        for my $i (1 .. $i1) {
                            my $c = chr(96+$i);
                            $code .= "    push p1, '$c'\n";
                            push @splice, $c;
                        }
                    }
                    # create offsets in p0
                    $code .= "    # create offset=$off\n";
                    for my $i (1 .. $off) {
                        # Note: Can't shift from an empty array in parrot, but perl5 accepts it
                        next CYCLE unless @result;
                        $code .= "    \$I0 = shift p0\n";
                        shift @result;
                    }
                    for my $i ($max+1 .. $i0-1) { # if we are over 8, push it
                        next CYCLE unless @result;
                        $code .= "    \$I0 = shift p0\n";
                        shift @result;
                        my $c = chr(65+$i);
                        $code .= "    unshift p0, '$c'\n";
                        unshift @result, $c;
                    }
                    my $size = scalar @result; #$i0 - $off;
                    next if $offset > $size + 1; # test only off-by-one (enlarge by 1, no 2++)
                    my $splice = join("", @splice);
                    my $p0 = join("", @result);
                    if ($offset > $size) {
                        $code .= "    # warn 'splice() offset past end of array' #1176
    .include \"warnings.pasm\"
    warningson .PARROT_WARNINGS_UNDEF_FLAG\n";
                        no warnings;
                        splice @result, $offset, $count, @splice;
                    }
                    else {
                        splice @result, $offset, $count, @splice;
                    }
                    my $expected = join("", @result); #length: $size-$count+$insert;
                    $code .= "
    # rpa splice ($off,$size,8)
    # p0: $p0, p1: $splice
    splice p0, p1, $offset, $count
    # => $expected
    \$S0 = join '', p0
    say \$S0
.end
";
                    if ($offset > $size) {
                        pir_output_like( $code,
                                         qr/splice: offset past end of array\ncurrent instr.: .*\n${expected}\n/,
                                         "ResizablePMCArray.splice ($off,$size,8) $offset, $count" );
                    }
                    else {
                        pir_output_is( $code, $expected."\n",
                                       "ResizablePMCArray.splice ($off,$size,8) $offset, $count" );
                    }
                }
            }
        }
    }
}
Test::More::done_testing();

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
