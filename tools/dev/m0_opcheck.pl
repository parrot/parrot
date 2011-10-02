#! perl
# Copyright (C) 2011, Parrot Foundation.

use strict;
use warnings;
use feature "say";

use File::Slurp;


# todo:
# * ensure that all op functions are defined
# * insert stubs for functions that aren't defined
# * warn about unused functions

my @m0_files = qw<
src/m0/perl5/m0_assembler.pl
src/m0/perl5/m0_interp.pl
>;



foreach my $file (@m0_files) {
    # slurp the file into memory
    my @lines = read_file($file);
    my @fixed_lines;
    my $op_gen = '';
    foreach my $line (@lines) {
        if ($line =~ /gen_opnames_from\(m0\.ops\)/) {
            push @fixed_lines, $line;
            my $template = $line;
            $template =~ s/.*template\("([^"]*)"\).*\n/$1/;
            $op_gen = 'names';
            foreach my $op (m0_ops()) {
                my $op_name = $template;
                $op_name =~ s/LC_OP/$op/;
                push @fixed_lines, "$op_name\n";
            }
        }
        elsif ($op_gen) {
            if ($line =~ /end_gen/) {
                $op_gen = '';
                push @fixed_lines, $line;
            }
        }
        else {
            push @fixed_lines, $line;
        }
    }
    write_file($file, @fixed_lines);
}


sub m0_ops {
    my @file_ops = read_file("src/m0/m0.ops");
    # remove comments from m0.ops
    my @real_ops;
    foreach (@file_ops) {
        push @real_ops, $_ unless (/^[\s]*#/);
    }

    chomp foreach @real_ops;
    @real_ops;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

