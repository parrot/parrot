#! perl -w
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id: opcode-doc.t 6741 2004-10-01 21:16:56Z jrieks $

=head1 NAME

t/src/opcode-doc.t - check opcode documentation

=head1 SYNOPSIS

        % perl t/src/opcode-doc.t

=head1 DESCRIPTION

Checks whether all opcodes are documentated.

=cut

use strict;
use Test::More tests => 1;
my @docerr;

sub slurp {
    my ($filename) = @_;
    open FILE, "< $filename" or die "can't open '$filename' for reading";
    my @file = <FILE>;
    close FILE;
    return @file;
}

sub analyse {
    my ($filename, $ops) = @_;
    my %file;

    foreach my $op ( keys %$ops ) {
        my $args = $ops->{$op};
        next if $op =~ /^DELETED/;
        next if $op =~ /^isgt/;	# doced but rewritten
        next if $op =~ /^isge/;
        foreach my $arg ( keys %$args ) {
            my $e = $args->{$arg};
            my $val = $e->{status};
            next if $val == 3; # doc & impl
            $file{$e->{def}} = "no documentation for $op($arg)" if exists $e->{def};
            $file{$e->{doc}} = "no definition of $op($arg)" if exists $e->{doc};
        }
    }

    foreach my $line ( sort {$a<=>$b} keys %file ) {
            push @docerr, "$filename:$line: $file{$line}\n";
    }
}

sub check_op_doc {
    my ($filename) = @_;
    my @file = slurp( $filename );
    my %op;
    my $lineno = 0;

    foreach my $line (@file) {
        ++$lineno;
        if (my ($item) = $line =~ /^=item\s+(.+\(.*)/) {
            if ($item =~ /^([BC])\<(.*)\>\s*\((.*?)\)/) {
                print "$filename:$lineno: use B<...> instead of C<...>\n"
                    if $1 eq "C";
		my ($op, $args) = ($2, $3);
		$args =~ s!\s*/\*.*?\*/!!;  # del C comment in args
                $op{$op}{$args}{doc} = $lineno;
                $op{$op}{$args}{status} |= 1;
            }
        } elsif ($line =~ /^(inline )?\s*op\s*(\S+)\s*\((.*?)\)/) {
            $op{$2}{$3}{def} = $lineno;
            $op{$2}{$3}{status} |= 2;
        }
    }
    analyse( $filename, \%op );
}

foreach my $file ( <ops/*.ops> ) {
    check_op_doc $file;
}

ok(!@docerr, 'opcode documentation') or diag("Opcode documentation errors:\n@docerr");
