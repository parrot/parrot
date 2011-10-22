package TAP::Harness::ReportByDescription;

use strict;
use base 'TAP::Harness';
use File::Path;
use File::Spec;
use IO::Handle;
use vars qw( $VERSION );
$VERSION = '0.01';

=head1 NAME

TAP::Harness::ReportByDescription - Report TAP output by test file description rather than test file name

=head1 VERSION

0.01

=head1 SYNOPSIS

    use TAP::Harness::ReportByDescription;
    my $harness = TAP::Harness::ReportByDescription->new();
    $harness->aggregate_tests($aggregator, @tests);

=head1 DESCRIPTION

This package subclasses TAP::Harness for the purpose of enabling a user to
report the TAP output for a test file by a user-provided description rather
than by the name of the test file itself.

Why would you want to do this?  Three reasons come to mind.

=over 4

=item * One Master Summary Rather Than Summaries for Individual Subharnesses

Suppose that you had a F<make> testing target that is in essence nothing more
than a sequential run of several smaller testing targets, each of which is a
separate invocation of a test harness.

    make fulltest : test_prep \
        compilers \
        src \
        oo \
        codingstd \
        examples

Other things being equal, you would get a B<Summary> at the end of each of the
five targets or subharnesses.  Under some circumstances, you might prefer to
get a single master Summary at the end of the overall program.

=item * Multiple Runs of Same Tests in Different Environments

Suppose that you had a set of tests that you wanted to run several times, each
time in a slightly different environment.  You could write a program which
executes multiple runs, writing a summary after each run and then modifying
the environment for the next run.

    perl t/harness --gc-debug --runcore=bounds
    perl t/harness --gc-debug --runcore=fast
    perl t/harness --gc-debug --run-pbc

As the TAP output flowed by, you would see three instances of each test:

    t/pmc/arrayiterator.t ............................ ok
    # ...
    t/pmc/arrayiterator.t ............................ ok
    # ...
    t/pmc/arrayiterator.t ............................ ok

... but you would not be able to tell from the test file's report itself which
harness it was a part of.  Under certain circumstances it would be nice to be
able to differentiate among the different runs:

    bounds__t/pmc/arrayiterator.t .................... ok
    # ...
    fast__t/pmc/arrayiterator.t ...................... ok
    # ...
    pbc__t/pmc/arrayiterator.t ....................... ok

Here you're providing a B<description> of each run of each test which provides
an observer with more information.

=item * Preparation of a Test Harness Archive

The ability to provide a specific description for a different run of the same
test becomes crucial when preparing a test harness archive.  Currently, CPAN
distribution Test::Harness::Archive stores the TAP for a particular test file
in a file with the name of the test file itself.  If you do multiple runs of
the same file in different environments, a later run of a test will overwrite
the TAP file from an earlier run.  You would therefore only be able to include
the TAP from the last subharness in an archive.  That would impede you from
sharing the full results of testing via a smoke-test aggregator such as
Smolder.

=back

In short, we need (a) a way to run multiple harnesses as if they were one, (b)
run the same tests through multiple harnesses and be able to quickly identify
which harness we were running it through, and (c) store multiple versions of a
file's TAP output in a test harness archive.

Need (a) can actually be fulfilled with existing TAP::Parser::Aggregator
functionality.  Let's build on that to meet needs (b) and (c).  To do that we
need one package to subclass TAP::Harness and one to subclass
TAP::Harness::Archive.  TAP::Harness::ReportByDescription and
TAP::Harness::Archive::MultiplesHarnesses are these packages.

=head1 METHODS

=head2 C<new()>

Inherited from TAP::Harness.

=head2 C<aggregate_tests()>

Replicated, along with methods called internally from this method, from
TAP::Harness.  The only change occurs in an internal method
C<_get_parser_args()>, which now assigns the individual test's B<filename> to
one variable and a user-provided B<description> to a second variable.

    my $test_prog = $job->filename;
    my $spool_prog = $job->description;

It is the latter variable which will appear on the console and in a test
archive.  Since this occurs within an internal method, the user need make no
change in how C<aggregate_tests()> is called.

=cut

sub aggregate_tests {
    my ( $self, $aggregate, @tests ) = @_;

    my $jobs      = $self->jobs;
    my $scheduler = $self->make_scheduler(@tests);

    # #12458
    local $ENV{HARNESS_IS_VERBOSE} = 1
      if $self->formatter->verbosity > 0;

    # Formatter gets only names.
    $self->formatter->prepare( map { $_->description } $scheduler->get_all );

    if ( $self->jobs > 1 ) {
        $self->_aggregate_parallel( $aggregate, $scheduler );
    }
    else {
        $self->_aggregate_single( $aggregate, $scheduler );
    }

    return;
}

sub _aggregate_parallel {
    my ( $self, $aggregate, $scheduler ) = @_;

    my $jobs = $self->jobs;
    my $mux  = $self->_construct( $self->multiplexer_class );

    RESULT: {

        # Keep multiplexer topped up
        FILL:
        while ( $mux->parsers < $jobs ) {
            my $job = $scheduler->get_job;

            # If we hit a spinner stop filling and start running.
            last FILL if !defined $job || $job->is_spinner;

            my ( $parser, $session ) = $self->make_parser($job);
            $mux->add( $parser, [ $session, $job ] );
        }

        if ( my ( $parser, $stash, $result ) = $mux->next ) {
            my ( $session, $job ) = @$stash;
            if ( defined $result ) {
                $session->result($result);
                $self->_bailout($result) if $result->is_bailout;
            }
            else {

                # End of parser. Automatically removed from the mux.
                $self->finish_parser( $parser, $session );
                $self->_after_test( $aggregate, $job, $parser );
                $job->finish;
            }
            redo RESULT;
        }
    }

    return;
}

sub _aggregate_single {
    my ( $self, $aggregate, $scheduler ) = @_;

    JOB:
    while ( my $job = $scheduler->get_job ) {
        next JOB if $job->is_spinner;

        my ( $parser, $session ) = $self->make_parser($job);

        while ( defined( my $result = $parser->next ) ) {
            $session->result($result);
            if ( $result->is_bailout ) {

                # Keep reading until input is exhausted in the hope
                # of allowing any pending diagnostics to show up.
                1 while $parser->next;
                $self->_bailout($result);
            }
        }

        $self->finish_parser( $parser, $session );
        $self->_after_test( $aggregate, $job, $parser );
        $job->finish;
    }

    return;
}

sub make_parser {
    my ( $self, $job ) = @_;

    my $args = $self->_get_parser_args($job);
    $self->_make_callback( 'parser_args', $args, $job->as_array_ref );
    my $parser = $self->_construct( $self->parser_class, $args );

    $self->_make_callback( 'made_parser', $parser, $job->as_array_ref );
    my $session = $self->formatter->open_test( $job->description, $parser );

    return ( $parser, $session );
}

sub _get_parser_args {
    my ( $self, $job ) = @_;
    my $test_prog = $job->filename;
    my $spool_prog = $job->description;
    my %args      = ();

    $args{sources} = $self->sources if $self->sources;

    my @switches;
    @switches = $self->lib if $self->lib;
    push @switches => $self->switches if $self->switches;
    $args{switches}    = \@switches;
    $args{spool}       = $self->_open_spool($spool_prog);
    $args{merge}       = $self->merge;
    $args{ignore_exit} = $self->ignore_exit;
    $args{version}     = $self->version if $self->version;

    if ( my $exec = $self->exec ) {
        $args{exec}
          = ref $exec eq 'CODE'
          ? $exec->( $self, $test_prog )
          : [ @$exec, $test_prog ];
        if ( not defined $args{exec} ) {
            $args{source} = $test_prog;
        }
        elsif ( ( ref( $args{exec} ) || "" ) ne "ARRAY" ) {
            $args{source} = delete $args{exec};
        }
    }
    else {
        $args{source} = $test_prog;
    }

    if ( defined( my $test_args = $self->test_args ) ) {

        if ( ref($test_args) eq 'HASH' ) {

            # different args for each test
            if ( exists( $test_args->{ $job->description } ) ) {
                $test_args = $test_args->{ $job->description };
            }
            else {
                $self->_croak( "TAP::Harness Can't find test_args for "
                      . $job->description );
            }
        }

        $args{test_args} = $test_args;
    }
    return \%args;
}

sub _open_spool {
    my $self = shift;
    my $test = shift;

    if ( my $spool_dir = $ENV{PERL_TEST_HARNESS_DUMP_TAP} ) {

        my $spool = File::Spec->catfile( $spool_dir, $test );

        # Make the directory
        my ( $vol, $dir, undef ) = File::Spec->splitpath($spool);
        my $path = File::Spec->catpath( $vol, $dir, '' );
        eval { mkpath($path) };
        $self->_croak($@) if $@;

        my $spool_handle = IO::Handle->new;
        open( $spool_handle, ">$spool" )
          or $self->_croak(" Can't write $spool ( $! ) ");

        return $spool_handle;
    }

    return;
}

1;

=head1 EXAMPLE

See C<TAP::Harness::Archive::MultipleHarnesses::runtests()>.

=head1 AUTHOR

99% of the code in this module comes from TAP::Harness, written by Andy
Armstrong and generations of Perl QA hackers.  Documentation and the one small
code tweak needed were written by James E Keenan.

=head1 LICENSE

This is free software and is released under the same terms as Perl itself.

=cut

# vim:ts=4:sw=4:et:sta
