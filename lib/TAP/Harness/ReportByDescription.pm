package TAP::Harness::ReportByDescription;

use strict;
use base 'TAP::Harness';
use File::Path;
use File::Spec;
use IO::Handle;
our $VERSION = '0.01';

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

