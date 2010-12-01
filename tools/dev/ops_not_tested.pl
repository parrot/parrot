#! perl
# Copyright (C) 2006-2008, Parrot Foundation.

use strict;
use warnings;
use lib qw/ lib /;

use File::Find;

use Parrot::Config qw/ %PConfig /;
use Parrot::Op;
use Parrot::OpLib::core;

=head1 NAME

tools/dev/ops_not_tested.pl

=head1 DESCRIPTION

The problem this program addresses is described in this IRC log:

10:23 <toor> # Tests - ~1/3 of opcodes are uncovered by tests <--
             were can I see which ones are not
             tested? (yes, maybe I want to write some tests :p)

10:25 <@leo> toor: run 'make testr', then create a script that runs
             disassemble [sic] $_.pbc for all @pbcs,
             extract the opcode, sort, uniq and compare with
             lib/Parrot/OpLib/core.pm
10:26 <@leo> disassemble even
10:26 <@leo> $ make disassemble
10:28 <toor> leo: and if I make a perl5 script that does that
             automagically, is it usefull [sic] for the
             project?
10:28 <@leo> very useful
10:28 <toor> ok, looks that I've got something to start :)
10:28 <@leo> great, thanks

=cut

my @dirs = @ARGV ? @ARGV : 't/';

my $make        = $PConfig{make};
my $disassemble = "$PConfig{build_dir}$PConfig{slash}pbc_disassemble$PConfig{exe}";

# First of all we need the disassemble program
system( $make, $disassemble ) == 0
    or die "<$make $disassemble> failed: $!\n";

# Parse 'lib/Parrot/OpLib/core.pm' to find all defined opcodes
# Extract the full name from the opcode data
my $opcodes = {};
$opcodes->{ $_->full_name }++ for @$Parrot::OpLib::core::ops;

# Count the number of opcodes
my $opcount = scalar keys %$opcodes;
print "$opcount opcodes found$/";

# *Assuming* 'make testr' has been run, find all .pbc under t/
my $pbcfiles;
File::Find::find(
    {
        wanted => sub { m/\.pbc$/i
                        and $File::Find::dir !~ m/native_pbc/
                        and push @$pbcfiles => $File::Find::name },
        nochdir => 1,
    },
    @dirs,
);

check_opcodes( $_, $opcodes ) for @$pbcfiles;

# Count how many opcodes from core are not tested
my $percent = 100 * keys(%$opcodes) / $opcount;

# And now send the results to the user
#print "$_\n"
#    for keys %$opcodes;

print scalar( keys %$opcodes ) . sprintf " of %d opcodes untested! (%2.2d%%)\n", $opcount, $percent;

print $_, $/ for sort keys %$opcodes;

exit;

sub check_opcodes {
    my ( $file, $opcodes ) = @_;

    my @data = qx/$disassemble $file/
        or warn "<$disassemble $file> failed: $!$/" and return;
    for (@data) {
        s/L\w+\:\s+//;     # Remove the Lxx marks
        s/^(\w+).*/$1/;    # Extract the opcode
        chomp;
        delete $$opcodes{$_};
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
