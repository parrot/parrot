# Copyright (C) 2006-2008, Parrot Foundation.
# $Id$

=head1 NAME

Parrot::Harness::Smoke - Subroutines used by harness-scripts to generate smoke reports

=head1 DESCRIPTION

This package exports on request subroutines used by the root F<t/harness>
and by language implementation F<t/harness> to generate smoke reports.

Following subroutines are supported:

    generate_html_smoke_report (
        tests       => \@tests,
        args        => $args,
        file        => 'smoke.html',
    );

    my %env_data = collect_test_environment_data();

    send_archive_to_smolder( %env_data );

=cut

package Parrot::Harness::Smoke;

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Parrot::Config qw/%PConfig/;
use base qw( Exporter );
our @EXPORT_OK = qw(
    generate_html_smoke_report
    collect_test_environment_data
    send_archive_to_smolder
);

# language implementations have a different project id
my %SMOLDER_CONFIG = (
    server       => 'http://smolder.plusthree.com',
    username     => 'parrot-autobot',
    password     => 'squ@wk',
    project_id   => 8,
    report_file  => ['parrot_test_run.tar.gz'],
);

# language implementations must pass their respective project id
sub send_archive_to_smolder {
    my %test_env_data = @_;
    eval { require LWP::UserAgent };
    if( $@ ) {
        die "\n" . ('-' x 55) . "\nCould not load LWP::UserAgent."
            . "\nPlease install it if you want to send TAP archives to Smolder.\n"
            . ('-' x 55) . "\n\n$@\n";
    }

    my $project_id   = delete $test_env_data{project_id}  || $SMOLDER_CONFIG{project_id};
    my $report_file  = delete $test_env_data{report_file} || $SMOLDER_CONFIG{report_file};
    my $url
        =   $SMOLDER_CONFIG{server}
          . '/app/developer_projects/process_add_report/'
          . $project_id;
    my $ua = LWP::UserAgent->new();
    $ua->agent( 'Parrot::Harness::Smoke' );
    $ua->env_proxy();

    # create our tags based off the test environment information
    my $tags = join(',',
        (map { $test_env_data{$_} } qw(Architecture Compiler Platform Version)),
        'Perl ' . $test_env_data{'Perl Version'});
    my $response = $ua->post(
        $url,
        Content_Type => 'form-data',
        Content      => [
            username     => $SMOLDER_CONFIG{username},
            password     => $SMOLDER_CONFIG{password},
            tags         => $tags,
            report_file  => $report_file,
        ]
    );

    if ($response->code == 302) {
        my ($report_id) = $response->content =~ /Reported #(\d+) added/i;
        my $report_url = "$SMOLDER_CONFIG{server}/app/public_projects/report_details/$report_id";
        my $project_url
            =   $SMOLDER_CONFIG{server}
              . '/app/public_projects/smoke_reports/'
              . $project_id;
        print "Test report successfully sent to Smolder at\n$report_url"
            . "\nYou can see other recent reports at\n$project_url .\n\n";
    }
    else {
        die "Could not upload report to Smolder at $SMOLDER_CONFIG{server}"
            . "\nHTTP CODE: " . $response->code . " ("
            .  $response->message . ")\n";
    }
}

sub collect_test_environment_data {
    return (
        'Architecture' => $PConfig{cpuarch},
        'Compiler'     => _get_compiler_version(),
        'DEVEL'        => $PConfig{DEVEL},
        'Optimize'     => ($PConfig{optimize} || 'none'),
        'Perl Version' => (sprintf('%vd', $^V) . " $PConfig{archname}"),
        'Platform'     => $PConfig{osname},
        'SVN Revision' => $PConfig{revision},
        'Version'      => $PConfig{VERSION},
    );
}

# this can be expanded to more than just GCC
sub _get_compiler_version {
    my $compiler = $PConfig{cc};
    if($compiler eq 'gcc') {
        $compiler .= " $PConfig{gccversion}";
    }
    return $compiler;
}

sub generate_html_smoke_report {
    my $argsref = shift;
    my $html_fn = $argsref->{file};
    my @smoke_config_vars = qw(
        osname archname cc build_dir cpuarch revision VERSION optimize DEVEL
    );

    eval {
        require Test::TAP::HTMLMatrix;
        require Test::TAP::Model::Visual;
    };
    die "You must have Test::TAP::HTMLMatrix installed.\n\n$@"
        if $@;

    {
      no warnings qw/redefine once/;
      *Test::TAP::Model::run_tests = sub {
        my $self = shift;

        $self->_init;
        $self->{meat}{start_time} = time();

        my %stats;

        foreach my $file (@_) {
            my $data;
            print STDERR "- $file\n";
            $data = $self->run_test($file);
            $stats{tests} += $data->{results}{max} || 0;
            $stats{ok}    += $data->{results}{ok}  || 0;
        }

        printf STDERR "%s OK from %s tests (%.2f%% ok)\n\n",
            $stats{ok},
            $stats{tests},
            $stats{ok} / $stats{tests} * 100;

        $self->{meat}{end_time} = time();
      };

      my $start = time();
      my $model = Test::TAP::Model::Visual->new();
      $model->run_tests( @{ $argsref->{tests} } );

      my $end = time();

      my $duration = $end - $start;

      my $v = Test::TAP::HTMLMatrix->new(
        $model,
        join("\n",
             "duration: $duration",
             "branch: unknown",
             "harness_args: " . (($argsref->{args}) ? $argsref->{args} : "N/A"),
             map { "$_: $PConfig{$_}" } sort @smoke_config_vars),
      );

      $v->has_inline_css(1); # no separate css file

      open my $HTML, '>', $html_fn;
      print {$HTML} $v->html();
      close $HTML;

      print "$html_fn has been generated.\n";
    }
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
