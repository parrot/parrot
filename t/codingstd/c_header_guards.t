#! perl
# Copyright (C) 2006-2007, The Perl Foundation.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Test::More tests => 5;
use Parrot::Distribution;

=head1 NAME

t/codingstd/c_header_guards.t - checks for rules related to guards in C header files

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/c_header_guards.t

    # test specific files
    % perl t/codingstd/c_header_guards.t include/parrot/bar.h

=head1 DESCRIPTION

Checks that all C language header files have an #ifndef PARROT_WHATEVER_H_GUARD
definition, and an #endif /* PARROT_WHATEVER_H_GUARD */ at the end, as
specified in PDD07.

=head1 AUTHOR

Mark Glines <mark at glines dot org>

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut

my $DIST = Parrot::Distribution->new();
my @files;
if(@ARGV) {
    @files = @ARGV;
} else {
    my %files = map { $_->path() => 1 } $DIST->c_header_files();
    my $href = $DIST->generated_files();
    foreach my $file (keys %$href) {
        if($file =~ /\.h$/) {
            $files{$file} = 1 if -f $file;
        }
    }
    @files = sort keys %files;
}

check_header_guards(@files);

exit;

sub check_header_guards {
    my (%guardnames, %redundants, %collisions,
        %missing_guard, %missing_define, %missing_comment);

F:  foreach my $file (@_) {
        open my $fh, '<', $file
            or die "Cannot open '$file' for reading!\n";
        my @source = <$fh>;
        close $fh;
        chomp @source;

        my ($ifndef, $define, $endif);
L:          foreach my $line (@source) {
            $line =~ s/\s+/ /;
            $line =~ s/^ //;

            # skip Bison parser files
            next F if $line =~ /A Bison parser/;

            # skip the non-preprocessor lines
            next L unless substr($line,0,1) eq '#';

            # skip the "#", and any leading whitespace
            $line = substr($line, 1);
            $line =~ s/^ //;

            if($line =~ m{ifndef (PARROT_.+_GUARD)$}) {
                # allow include/parrot/platform.h to have redundant guards;
                # it contains verbatim copies of other header files (which
                # have their own guards).
                next L if(defined($ifndef) && $ifndef eq 'PARROT_PLATFORM_H_GUARD');

                # check for multiple guards in the same file
                $redundants{$file} = $1 if defined $ifndef;

                # check for the same guard-name in multiple files
                $collisions{$file} = $guardnames{$1}
                    if exists $guardnames{$1};

                $ifndef = $1;
                $guardnames{$1} = $file;
            }

            if($line =~ m{define (PARROT_.+_GUARD)$}) {
                $define = $1
                    if(defined($ifndef) && $ifndef eq $1);
            }

            if($line =~ m{endif /\* (PARROT_.+_GUARD) \*/$}) {
                $endif = $1
                    if(defined($ifndef) && $ifndef eq $1);
            }
        }

        $missing_guard{$file}   = 1 unless defined $ifndef;
        $missing_define{$file}  = 1 unless defined $define;
        $missing_comment{$file} = 1 unless defined $endif;
    }

TODO: {
    local $TODO = "Need to account for headers copied between subdirs";

    ok(!(scalar %collisions), "identical PARROT_*_GUARD macro names used in headers");
    diag("collisions: \n" . join(", \n", %collisions))
        if scalar keys %collisions;
};

    ok(!(scalar %redundants), "multiple PARROT_*_GUARD macros found in headers");
    diag("redundants: \n" . join(", \n", keys %redundants))
        if scalar keys %redundants;

    ok(!(scalar %missing_guard), "missing or misspelled PARROT_*_GUARD ifndef in headers");
    diag("missing guard: \n" . join(", \n", sort keys %missing_guard))
        if scalar keys %missing_guard;

    ok(!(scalar %missing_define), "missing or misspelled PARROT_*_GUARD define in headers");
    diag("missing define: \n" . join(", \n", sort keys %missing_define))
        if scalar keys %missing_define;

    ok(!(scalar %missing_comment), "missing or misspelled PARROT_*_GUARD comment after the endif in headers");
    diag("missing endif comment: \n" . join(", \n", sort keys %missing_comment))
        if scalar keys %missing_comment;

    return 0;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

