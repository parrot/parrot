# Copyright (C) 2008-2011, Parrot Foundation.

package Parrot::SearchOps;

use strict;
use warnings;
use lib qw(lib);

use Exporter;
use Text::Wrap;

use Parrot::Configure::Utils qw(_slurp);

our @ISA       = qw(Exporter);
our @EXPORT_OK = qw(
    search_all_ops_files
    help
    usage
);

sub search_all_ops_files {
    my ($pattern, $wrap_width, $opsdir) = @_;
    $Text::Wrap::columns = $wrap_width;
    my @opsfiles = glob("$opsdir/*.ops");

    my $total_identified = 0;
    foreach my $f (@opsfiles) {
        $total_identified = _search_one_ops_file(
            $pattern, $wrap_width, $total_identified, $f,
        );
    }
    return $total_identified;
}

sub _search_one_ops_file {
    my ($pattern, $wrap_width, $total_identified, $f) = @_;
    my $fullpattern = qr/^=item\sB<(\w*$pattern\w*)>\(([^)]*)\)/;
    my @paras = split /\n{2,}/, _slurp($f);
    my %iden_paras = ();
    for (my $i=0; $i<=$#paras; $i++) {
        my $j = $i+1;
        if ( $paras[$i] =~ /$fullpattern/ and $paras[$j]) {
            $iden_paras{$i}{op} = $1;
            $iden_paras{$i}{args} = $2;
        }
    }
    if (keys %iden_paras) {
        my @keys = keys %iden_paras;
        my $seen = scalar @keys;
        $total_identified += $seen;
        _print_name(\@paras, $wrap_width, $seen);
        my @sorted_idx = sort {$a <=> $b} @keys;
        my %remain_paras = map {$_, 1} @keys;
        foreach my $idx (@sorted_idx) {
            if ($remain_paras{$idx}) {
                my $k = _handle_indices(
                    \%iden_paras,
                    $idx,
                    \%remain_paras,
                );
                print fill('', '', ($paras[$k])), "\n\n";
            }
        }
    }
    return $total_identified;
}

sub _print_name {
    my $parasref = shift;
    my $wrap_width = shift;
    my $count = shift;
    NAME: for (my $i=0; $i<=$#$parasref; $i++) {
        my $j = $i+1;
        if ($parasref->[$i] =~ /^=head1\s+NAME/ and $parasref->[$j]) {
            my $str = qq{\n};
            $str .= q{-} x $wrap_width . qq{\n};
            $str .= $parasref->[$j] .
                q<  (> .
                $count .
                q< > .
                ($count > 1 ?  q<matches> : q<match>) .
                qq<)\n>;
            $str .= q{-} x $wrap_width .  qq{\n};
            $str .= qq{\n};
            print $str;
            last NAME;
        }
    }
}

sub _handle_indices {
    my ($identified_ref, $idx, $remaining_ref) = @_;
    my $j = $idx + 1;
    my $k = $j;
    print qq{$identified_ref->{$idx}{op}($identified_ref->{$idx}{args})\n};
    delete $remaining_ref->{$idx};
    if (defined $identified_ref->{$j}{op} ) {
        $k = _handle_indices(
            $identified_ref,
            $j,
            $remaining_ref,
        );
    }
    return $k;
}

sub usage {
    print <<USAGE;
    perl tools/dev/search_ops.pl [--help] [--all] ops_pattern
USAGE
}

sub help {
    usage();
    print <<HELP;

Given a valid Perl 5 regex as an argument, the script will search inside any
*.ops file for an opcode name that matches, dumping both its arguments and its
description.  The program must be called from the top-level Parrot directory.
To dump every op, call '--all' on the command line.

Example:
> perl tools/dev/search_ops.pl load

----------------------------------------------------------------------
File: core.ops - Parrot Core Ops (2 matches)
----------------------------------------------------------------------

load_bytecode(in STR)
Load Parrot bytecode from file \$1, and (TODO) search the library path,
to locate the file.

loadlib(out PMC, in STR)
Load a dynamic link library named \$2 and store it in \$1.

----------------------------------------------------------------------
File: debug.ops (1 match)
----------------------------------------------------------------------

debug_load(inconst STR)
Load a Parrot source file for the current program.
HELP
}

1;

=head1 NAME

Parrot::SearchOps - functions used in tools/dev/search_ops.pl

=head1 SYNOPSIS

    use Parrot::SearchOps qw(
        search_all_ops_files
        usage
        help
    );

    $total_identified = search_all_ops_files(
        $pattern, $wrap_width, $opsdir
    );

    usage();

    help();

=head1 DESCRIPTION

This package provides functionality for the Perl 5 program
F<tools/dev/search_ops.pl>, designed to replace the Python program
F<tools/docs/search-ops.py>.  It exports two subroutines on demand.

=head2 C<search_all_ops_files()>

B<Purpose:>  Searches all F<.ops> files in F<src/ops/> for ops codes and their
descriptions.  Those that match the specified pattern are printed to STDOUT.

B<Arguments:>  Three scalars.

=over 4

=item * C<$pattern>

Perl 5 regular expression.  So C<concat> will be matched by both C<concat> and
C<n_concat>.

=item * $wrap_width

In F<tools/dev/search_ops.pl>, this is set to C<70> characters. Can be varied
during testing or development.

=item * $opsdir

In F<tools/dev/search_ops.pl>, this is set to F<src/ops/>.  Can be varied
during testing or development.

=back

B<Return Value:>  Number of times the pattern was matched by ops codes in all
files.

=head2 C<usage()>

B<Purpose:>  Display usage statement for F<tools/dev/search_ops.pl>.

B<Arguments:>  None.

C<Return Value:>  Implicitly returns true upon success.

=head2 C<help()>

B<Purpose:>  Display usage statement and more complete help message for F<tools/dev/search_ops.pl>.

B<Arguments:>  None.

C<Return Value:>  Implicitly returns true upon success.

=head1 AUTHOR

James E Keenan, adapting Python program written by Bernhard Schmalhofer.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
