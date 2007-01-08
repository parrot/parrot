#! perl
# Copyright (C) 2006, The Perl Foundation.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Test::More tests => 2;
use Parrot::Distribution;

=head1 NAME

t/codingstd/c_indent.t - checks for rules related to indenting in C source

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/c_indent.t

    # test specific files
    % perl t/codingstd/c_indent.t src/foo.c include/parrot/bar.h

=head1 DESCRIPTION

Checks that all C language source files have the proper use of indentation,
as specified in PDD07.

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut

my $DIST = Parrot::Distribution->new;
my @files = @ARGV ? @ARGV : $DIST->get_c_language_files();

#foreach my $file ( @files ) {
#    print $file->path(), "\n";
#}
#exit;

check_indent(@files);

exit;

sub check_indent {
    my ( @pp_indent, @c_indent );
    my ( %pp_failed, %c_failed );

    foreach my $file (@_) {
        my @source;
        my $path = @ARGV ? $file : $file->path();
        open my $fh, '<', $path
            or die "Can not open '$path' for reading!\n";
        @source = <$fh>;

        my @stack;
        my $line = 0;
        my $f    = undef;
        foreach (@source) {
            $line++;
            next unless defined $_;

            ## preprocessor scan
            if (/^\s*\#(\s*)(ifndef|ifdef|if)\s+(.*)/) {
                next if (/PARROT_IN_CORE|_GUARD/);

                my $indent = "  " x (@stack);
                if ( $1 ne $indent ) {
                    push @pp_indent => "$path:$line\n"
                        . "     got: $_"
                        . "expected: #$indent$2 $3'\n";
                    $pp_failed{"$path\n"} = 1;
                }
                push @stack, "#$2 $3";
                next;
            }
            if (/^\s*\#(\s*)(else|elif)/) {

                # stay where we are, but indenting should be
                # back even with the opening brace.
                my $indent = "  " x ( @stack - 1 );
                if ( $1 ne $indent ) {
                    push @pp_indent => "$path:$line\n"
                        . "     got: $_"
                        . "expected: #$indent$2 -- it's inside of "
                        . ( join ' > ', @stack ) . "\n";
                    $pp_failed{"$path\n"} = 1;
                }
                next;
            }
            if (/^\s*\#(\s*)(endif)/) {
                my $indent = "  " x ( @stack - 1 );
                if ( $1 ne $indent ) {
                    push @pp_indent => "$path:$line\n"
                        . "     got: $_"
                        . "expected: #$indent$2 --  it's inside of "
                        . ( join ' > ', @stack ) . "\n";
                    $pp_failed{"$path\n"} = 1;
                }
                pop @stack;
                next;
            }
            next unless @stack;

            if (/^\s*\#(\s*)(.*)/) {
                my $indent = "  " x (@stack);
                if ( $1 ne $indent ) {
                    push @pp_indent => "$path:$line\n"
                        . "     got: $_"
                        . "expected: #$indent$2 -- it's inside of "
                        . ( join ' > ', @stack ) . "\n";
                    $pp_failed{"$path\n"} = 1;
                }
            }

            ## c source scan
            # for now just try to catch glaring errors.  A real parser is
            # probably overkill for this task.  For now we just check the
            # first line of a function, and assume that more likely than not
            # indenting is consistent within a func body.
            if (/^(\s*).*\{\s*$/) {

                # note the beginning of a block, and its indent depth.
                $f = length($1);
                next;
            }

            if (/^\s*([\#\}])/) {

                # skip the last line of the func or cpp directives.
                $f = undef if ( $1 eq "}" );
                next;
            }

            if ( defined($f) ) {

                # first line of a block
                if ( $f == 0 ) {

                    # first line of a top-level block (first line of a function,
                    # in other words)
                    my ($indent) = /^(\s*)/;
                    if ( length($indent) != 4 ) {
                        push @c_indent => "$path:$line\n"
                            . "apparent non-4 space indenting ("
                            . length($indent)
                            . " spaces)";
                        $c_failed{"$path\n"} = 1;;
                    }
                }
                $f = undef;
            }
        }
    }

    # get the lists of files failing the test
    my @c_failed_files = keys %c_failed;
    my @pp_failed_files = keys %pp_failed;

## L<PDD07/Code Formatting/"Preprocessor #directives must be indented two columns per nesting level, with two exceptions: neither PARROT_IN_CORE nor the outermost _GUARD #ifdefs cause the level of indenting to increase">
    ok( !scalar(@pp_indent) )
        or diag( "incorrect indenting in preprocessor directive found "
            . scalar @pp_indent
            . " occurrences in "
            . scalar @pp_failed_files
            . " files:\n@pp_indent" );

    ok( !scalar(@c_indent) )
        or
        diag( "incorrect indenting in C file found " 
            . scalar @c_indent 
            . " occurrences in "
            . scalar @c_failed_files
            . " files:\n@c_indent" );
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
