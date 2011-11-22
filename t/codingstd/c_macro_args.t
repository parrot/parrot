#! perl
# Copyright (C) 2008-2010, Parrot Foundation.

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
my @files = @ARGV ? <@ARGV> : $DIST->get_c_language_files();

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
                     | /\*[^@] .*? \*/                     # remove C comment
                   )
                }{}gsx;

        # combine lines extended with \\n
        $buf =~ s/\\\n//g;

        while ( $buf =~ m{ ^ \s* \# \s* define \s+ ([a-zA-Z_]+)  \( ([^)]+) \)  ([^\n]*) }smgx ) {
            my ($macro,$args,$definition) = ($1, $2, $3);
            # for each of these args, verify it's wrapped in parens each time
            # it's referenced in the definition.
            if ($definition ne "") {
                foreach my $arg (split /\s*,\s*/, $args) {

                    # skip args that are code blocks
                    next if $arg eq '_code';

                    # eliminate any properly formed usage of the macro arg
                    $definition =~ s/\Q($arg)//g;
                    $definition =~ s/\Q[$arg]//g;
                    $definition =~ s/\Q<$arg>//g;

                    # eliminate concatenations
                    $definition =~ s/\Q$arg ##//g;
                    $definition =~ s/\Q## $arg//g;

                    # eliminate stringifications
                    $definition =~ s/\Q#$arg//g;

                    # eliminate args used as types
                    $definition =~ s/\Q$arg\E[ ]+\*//g;
                    $definition =~ s/((?:struct|union)\s+\{(?:[^}]+;\s+)*)\Q$arg\E/$1/g;

                    # eliminate all function argument instrumentation macros
                    next if $definition =~ m/\*@[\w ]+@\*/;

                    # eliminate args used as function names
                    # (this match is naive, but it catches the one place where
                    # this is used)
                    $definition =~ s/\Q$arg\E\([^)]*\)//g;

                    # eliminate macros that deal with flags, since they're special
                    next if $macro =~ m/(TEST|SET|CLEAR)$/;

                    # Any remaining usage must be improper
                    if ($definition =~ m/\b\Q$arg\E\b/) {
                        push (@defines, "$path: $macro has unwrapped arg: $arg\n");
                    }
                }
            }
        }
    }

    my $ndefines = scalar @defines;
    is( $ndefines, 0, 'Check for unwrapped macro arguments' )
        or diag( "$ndefines unsafe macro args found:\n@defines\nThat's $ndefines of 'em!" );
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
