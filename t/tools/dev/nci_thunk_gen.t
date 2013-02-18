#! perl
# Copyright (C) 2013, Parrot Foundation.

use strict;
use warnings;
use lib qw(lib);

use Test::More        tests => 2;
use Parrot::Config;

my ($cc, $cc_inc, $ccflags, $cc_warn, $cc_o_out, $cc_shared, $cc_debug, $clock_best)
  = @PConfig{qw(cc cc_inc ccflags ccwarn cc_o_out cc_shared cc_debug clock_best)};
my $cflags = "$cc_inc $ccflags $cc_debug $clock_best $cc_shared";
my $cmd = q(echo "p  v"|./parrot tools/dev/nci_thunk_gen.pir --output=test_nci.c);
system ($cmd);
ok (-f "test_nci.c", "test_nci.c created") or diag $cmd;

$cmd = qq($cc $cflags $cc_warn -I. -Isrc ${cc_o_out}test_nci.o -c test_nci.c);
system ($cmd);
ok (-f "test_nci.o", "test_nci.o created") or diag $cmd;

unlink ("test_nci.*");

__END__

=head1 NAME

t/tools/dev/nci_thunk_gen.t - test bugs in tools/dev/nci_thunk_gen.pir

=head1 SYNOPSIS

    % prove t/tools/dev/nci_thunk_gen.t

=head1 DESCRIPTION

Test basic F<nci_thunk_gen.pir> usage.
Test that the sig "p  v" compiles to valid C code [GH #904].

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
