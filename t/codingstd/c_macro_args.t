#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id $

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Test::More tests => 1;
use Parrot::Distribution;

=head1 NAME

t/codingstd/c_macro_args.t

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/c_macro_args.t

    # test specific files
    % perl t/codingstd/c_macro_args.t src/foo.t include/parrot/bar.h

=head1 DESCRIPTION

Checks that no C source file in the distribution has unsafe macro args.

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut

my $DIST = Parrot::Distribution->new();
my @files = @ARGV ? @ARGV : $DIST->get_c_language_files();

check_macro_args(@files);

sub check_macro_args {
    my @files = @_;

    my @defines;
    foreach my $file (@files) {
        my $path = @ARGV ? $file : $file->path();
        my $buf = $DIST->slurp($path);
        $buf =~ s{ (?:
                       (?: ' (?: \\\\ | \\' | [^'] )* ' )  # remove ' string
                     | (?: " (?: \\\\ | \\" | [^"] )* " )  # remove " string
                     | /\* .*? \*/                         # remove C comment
                   )
                }{}gsx;

        # combine lines extended with \\n
        $buf =~ s/\\\n//g;

        if ( $buf =~ m{ ^ \s* \#define \s+ ([a-zA-Z_]+)  \( ([^)]+) \)  ([^\n]*) }smx ) {
            my ($macro,$args,$definition) = ($1, $2, $3);
            # for each of these args, verify it's wrapped in parens each time
            # it's referenced in the definition.
            if ($definition ne "") {
                foreach my $arg (split /\s*,\s*/, $args) {
                    if ($definition =~ m/\b[^(]$arg[^)]\b/) {
                        push (@defines, "$path: $macro has unwrapped arg: $arg\n");
                    }
                }
            }
        }
    }

    ok( !scalar(@defines), 'unwrapped macro args' )
        or diag( scalar @defines . " unsafe macro args found:\n@defines" );
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
