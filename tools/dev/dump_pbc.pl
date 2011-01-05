#! perl

# Copyright (C) 2008-2011, Parrot Foundation.

=head1 NAME

tools/dev/dump_pbc.pl - Weave together PBC disassembly with PIR source

=head1 SYNOPSIS

 perl tools/dev/dump_pbc.pl foo.pbc

=head1 DESCRIPTION

dump_pbc.pl uses Parrot's F<pbc_disassemble> program to disassemble the opcodes
in a PBC (Parrot ByteCode) file, then weaves the disassembly together with
the original PIR source file(s).  This makes it easier to see how the PIR
syntactic sugar is desugared into raw Parrot opcodes.

=head1 BUGS

This program has only been tested for a few simple cases.  Also, the name
might suggest a different use than its actual purpose.

While it is not a bug in F<dump_pbc.pl> per se, there is a line numbering
bug for some PBC opcode sequences that will result in the disassembled
opcodes appearing just before the source lines they represent, rather
than just after.  There does not appear to be consensus yet about where
this bug actually resides.

=cut

use strict;
use warnings;
use Cwd;
use FindBin;

my ($PARROT_ROOT, $RUNTIME_DIR);
BEGIN {
    $PARROT_ROOT = Cwd::abs_path("$FindBin::Bin/../..");
    $RUNTIME_DIR = "$PARROT_ROOT/runtime/parrot";
}

use lib "$PARROT_ROOT/lib";
use Parrot::Config '%PConfig';

my $DISASSEMBLER = "$PConfig{build_dir}$PConfig{slash}pbc_disassemble$PConfig{exe}";

go(@ARGV);

sub go {
    my $pbc = shift;

    # The following mess brought to you by Win32, where pipe open doesn't work,
    # and thus its greater security and cleaner error handling are unavailable.

    -f $pbc && -r _
        or die "PBC file '$pbc' does not exist or is not readable.\n";

    -f $DISASSEMBLER && -x _
        or die  "Can't find disassembler '$DISASSEMBLER';"
              . "did you remember to make parrot first?\n";

    my @dis = `"$DISASSEMBLER" $pbc`;
    die "No disassembly; errors: $?, $!" unless @dis;

    my $cur_file = '';
    my $cur_line = -1;
    my %cache;

    foreach (@dis) {
        if (/^(?:# )?Current Source Filename (.*)/) {
            my $found = $1;
            $found =~ s/^'//;
            $found =~ s/'$//;
            if ($cur_file ne $found) {
                $cur_file           = $found;
                $cache{$cur_file} ||= slurp_file($cur_file);
                $cur_line           = -1;

                print "\n#### $cur_file\n";
            }
        }
        elsif (my ($info, $seq, $pc, $line, $code) = /^((\d+)-(\d+) (\d+): )(.*)/) {
            my $int_line = int    $line;
            my $len_line = length $line;
            if ($cur_line != $int_line) {
                $cur_line = 0 if $cur_line == -1;
                print "\n";
                foreach my $i ($cur_line + 1 .. $int_line) {
                    my $source_code = $cache{$cur_file}[$i-1];
                    # next    unless $source_code =~ /\S/;
                    printf "# %*d:   %s", $len_line, $i, $source_code;
                    print  "\n" if $source_code =~ /^\.end/;
                }
                $cur_line  = $int_line;
            }

            print ' ' x ($len_line + 4), "$code\n";
        }
    }
}

sub slurp_file {
    my $file = shift;
    my $source;

       open $source, '<', $file
    or open $source, '<', "$PARROT_ROOT/$file"
    or open $source, '<', "$RUNTIME_DIR/$file"
    or die "Could not open source file '$file': $!";

    my @lines = <$source>;

    return \@lines;
}


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
