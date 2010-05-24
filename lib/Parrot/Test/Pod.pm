# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 NAME

Parrot::Test::Pod - Utilities for tests which test POD

=head1 SYNOPSIS

    use Parrot::Test::Pod;

    $self = Parrot::Test::Pod->new( {
        argv => [ @ARGV ],
    } );

=head1 DESCRIPTION

This module provides utilities for tests in the Parrot test suite which test
the validity of documentation written in the POD format.

=cut

package Parrot::Test::Pod;
use strict;
use warnings;
use Carp;
use ExtUtils::Manifest qw(maniread);
use Pod::Find qw(contains_pod);
use Pod::Simple::Text;
use Storable qw(nstore retrieve);
use lib qw( lib );
use Parrot::Config;

our %second_analysis_subs = (
    oreilly_summary_malformed => sub {
        my ($files_needing_analysis, $build_dir) = @_;
        my $sto = q{.pod_examinable_oreilly_summary_malformed.sto};
        if ( -e $sto ) {
            eval { $files_needing_analysis = retrieve($sto) };
            if ($@) {
                croak "$sto exists on disk but could not retrieve from it";
            }
            else {
                return $files_needing_analysis;
            }
        }
        else {
            SECOND_FILE: foreach my $file ( keys %{ $files_needing_analysis } ) {
                my $full_file = qq|$build_dir/$file|;

                # Skip the book, because it uses extended O'Reilly-specific POD
                if ($full_file =~ m{docs/book/}) {
                    delete $files_needing_analysis->{ $file };
                    next SECOND_FILE;
                }

                # skip POD generating scripts
                if ($full_file =~ m/ops_summary\.pl/) {
                    delete $files_needing_analysis->{ $file };
                    next SECOND_FILE;
                }

                # skip file which includes malformed POD for
                # other testing purposes
                if ($full_file =~ m{
                        t/tools/dev/searchops/samples\.pm
                        | languages/pod/test\.pod
                        | examples/config/file/configcompiler
                        | t/configure/testlib/verbosefoobar
                        | t/configure/testlib/ddefectivefoobar
                        | t/configure/testlib/adefectivefoobar
                        | t/configure/testlib/cdefectivefoobar
                        | t/configure/testlib/bdefectivefoobar
                        | examples/config/file/configwithfatalstep
                        | compilers/opsc
                    }x
                ) {
                    delete $files_needing_analysis->{ $file };
                    next SECOND_FILE;
                }

                # read first line. If it contains "nqp" remove file from test.
                my $fh;
                open $fh, '<', $full_file or croak "Can't opend file $full_file $!";
                my $line = <$fh>;
                close $fh;

                if ($line =~ m/ nqp | use \s v6 /x) {
                    delete $files_needing_analysis->{ $file };
                    next SECOND_FILE;
                }
            }
        }
        nstore $files_needing_analysis, $sto;
        return $files_needing_analysis;
    },
    no_pod_todo => sub {
        my ($files_needing_analysis, $build_dir) = @_;
        my $sto = q{.pod_examinable_no_pod_todo.sto};
        if ( -e $sto ) {
            eval { $files_needing_analysis = retrieve($sto) };
            if ($@) {
                croak "$sto exists on disk but could not retrieve from it";
            }
            else {
                return $files_needing_analysis;
            }
        }
        else {
            SECOND_FILE: foreach my $file ( keys %{ $files_needing_analysis } ) {
                my $full_file = qq|$build_dir/$file|;

                if ($full_file =~ m/(?:pod_todo|fixme)\.t/) {
                    delete $files_needing_analysis->{ $file };
                    next SECOND_FILE;
                }
                if (no_pod_todo($full_file)) {
                    delete $files_needing_analysis->{ $file };
                    next SECOND_FILE;
                }
            }
        }
        nstore $files_needing_analysis, $sto;
        return $files_needing_analysis;
    },
);

=head1 METHODS

=head2 C<new()>

B<Purpose:>  Parrot::Test::Pod constructor.

B<Arguments:>  Hash reference holding, at a minimum, one elemente keyed by
C<argv>, whose value is typically a reference to C<@ARGV>.

B<Return Value:>  Parrot::Test::Pod object.

=cut

sub new {
    my $class = shift;
    my $args = shift;
    $args->{build_dir} = $PConfig{build_dir};

    croak "Cannot run test if build_dir does not yet exist"
        unless -d $args->{build_dir};
    croak "Test cannot be run unless MANIFEST exists in build dir"
        unless -f "$args->{build_dir}/MANIFEST";
    croak "Test cannot be run unless MANIFEST.generated exists in build dir"
        unless -f "$args->{build_dir}/MANIFEST.generated";

    $args->{manifest}     = maniread("$args->{build_dir}/MANIFEST");
    $args->{manifest_gen} = maniread("$args->{build_dir}/MANIFEST.generated");
    return bless $args, $class;
}

=head2 C<identify_files_for_POD_testing()>

B<Purpose:> Identifies files in the Parrot distribution which are likely to
merit examination for the validity of their POD.

The subroutine itself does a first pass at that process, and takes as one of
its arguments a reference to a subroutine which does a second such pass.

B<Arguments:>

    $need_testing_ref = $self->identify_files_for_POD_testing( {
        second_analysis => 'oreilly_summary_malformed',
    } );

B<Return Value:> A reference to a hash where each element's key is the path to
a file deemed needing examination for the validity of its POD.  The element's
value is either C<1> or C<2>, depending on whether it was seen in F<MANIFEST>
or F<MANIFEST.generated> or both.

B<Comment:> The first time this subroutine is invoked, it creates a Storable
file in the top-level Parrot directory called F<.pod_examinable.sto>.  That
file holds a hash which serves as a lookup table for files which might need
examination for validity of their POD.  When the subroutine is subsequently
invoked, that file is read so that one scan of the directory structure is
eliminated.

=cut

sub identify_files_for_POD_testing {
    my $self = shift;
    my $args = shift;
    my $files_needing_analysis = {};

    # Make not hard-coded.
    my $sto = q{.pod_examinable.sto};
    if ( -e $sto ) {
        eval { $files_needing_analysis = retrieve($sto) };
        if ($@) {
            croak "$sto exists on disk but could not retrieve from it";
        }
        elsif (exists $args->{second_analysis}) {
            # go to second-level analysis
            $files_needing_analysis =
                $second_analysis_subs{$args->{second_analysis}}(
                    $files_needing_analysis,
                    $self->{build_dir},
                );
        }
    }
    else {
        my @files;
        if ( scalar(@{ $self->{argv} }) ) {
            @files = @{ $self->{argv} };
        }
        else {
            print STDERR "\n# Finding files with POD, this may take a minute.\n";
            @files = (
                keys(%{ $self->{manifest} }),
                keys(%{ $self->{manifest_gen} })
            );
        }
        $files_needing_analysis->{$_}++ for @files;
        # https://trac.parrot.org/parrot/ticket/311
        # Certain files will be found in both MANIFEST.generated (because
        # they're generated by bison or flex) and MANIFEST (we have them in
        # repository so that normal users don't have to generate them).
        # foreach my $k (keys %$files_needing_analysis) { print STDERR
        # "$k\t$files_needing_analysis->{$k}\n" if
        # $files_needing_analysis->{$k} > 1; }

        # do FIRST_FILE
        FIRST_FILE: foreach my $file ( keys %{ $files_needing_analysis } ) {
            my $full_file = qq|$self->{build_dir}/$file|;

            # skip missing MANIFEST.generated files ( -e )
            # skip binary files # (including .pbc files) ( -B )
            # skip files that pass the -e test
            # because they resolve the .exe variant
            unless (-T $full_file) {
                delete $files_needing_analysis->{ $file };
                next FIRST_FILE;
            }

            # skip files without POD
            unless (Pod::Find::contains_pod( $full_file, 0 )) {
                delete $files_needing_analysis->{ $file };
                next FIRST_FILE;
            }
        }
        nstore $files_needing_analysis, $sto;
        # go to second-level analysis
        if (exists $args->{second_analysis}) {
            $files_needing_analysis =
                $second_analysis_subs{$args->{second_analysis}}(
                    $files_needing_analysis,
                    $self->{build_dir},
                );
        }
    }

    return [ keys %{ $files_needing_analysis } ];
}

=head2 C<oreilly_summary_malformed()>

B<Purpose:>  An instance of the "second pass" type of subroutine passed to
C<identify_files_for_POD_testing()> C<second_analysis> argument.

In this instance, we omit:

=over 4

=item *

files in F<docs/book/> that use
extended O'Reilly-specific POD;

=item *

programs that generate POD; and

=item *

files which for other testing purposes have deliberately malformed POD.

=back

B<Arguments:> Two scalar arguments:

=over 4

=item *

Reference to hash of files meriting analysis, generated in first part of
C<identify_files_for_POD_testing()>.

=item *

Path to build directory (currently, the top-level Parrot directory).

=back

B<Return Value:> Reference to hash of files meriting analysis, I<i.e.,> the
results of the first pass minus the results of the second pass.

=cut

=head1 AUTHOR

James E Keenan, refactored from earlier code

=cut

# Pulled from Test::Pod
sub no_pod_todo {
    my $file    = shift;
    my $checker = Pod::Simple::Text->new;

    my $text;
    $checker->output_string( \$text );
    $checker->parse_file($file);

    # if the text contains todo items return false
    if ( $text =~ m/TODO|FIXME|XXX/ ) {
        return 0;
    }
    else {
        return 1;
    }
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
