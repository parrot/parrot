#!perl

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;

our $counter = 1;

sub language_output_is {
    my ( $lang_name, $code, $out, $description ) = @_;
    $0 =~ s/\.t//;
    open my $OUT, ">", "$0_$counter.rb";
    print $OUT "$code\n";
    close $OUT;
    $counter++;
    "ok";
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
