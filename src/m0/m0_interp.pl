#! perl
# Copyright (C) 2011, Parrot Foundation.

=head1 NAME

src/m0/m0_interpreter.pl - M0 Interpreter Prototype 

=head1 SYNOPSIS

    % m0_interpreter.pl foo.m0b

=head1 DESCRIPTION

Run M0 bytecode assembled by the M0 assembler.

=cut

use strict;
use warnings;
use feature 'say';
use autodie qw/:all/;
use File::Slurp qw/slurp/;
use Data::Dumper;

my $file = shift || die "Usage: $0 foo.m0b";

run_m0b($file);


=item C<run_m0b>

Load and run an M0 bytecode file.

=cut

sub run_m0b {
    my ($filename) = @_;

    my $interp_data = load_m0b($filename);

    #start running byte 0 of the bytecode segment of chunk 
}



=item C<load_m0b>

Load an M0 bytecode file into memory.

=cut

sub load_m0b {
    my ($filename} = @_;

    # parse header
    
    # parse directory segment

    # foreach chunnk
        # parse variables segment
        # parse metadata segment
        # parse bytecode segment

}








