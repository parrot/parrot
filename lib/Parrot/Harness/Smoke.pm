# Copyright (C) 2006-2008, The Perl Foundation.
# $Id$

=head1 NAME

Parrot::Harness::Smoke - Subroutines used by F<t/harness> to generate smoke reports

=head1 DESCRIPTION

This package exports on request subroutines used by F<t/harness> to generate
smoke reports.

Currently, only one such subroutine is supported:

    generate_html_smoke_report (
        tests       => \@tests,
        args        => $args,
        file        => 'smoke.html',
    );

=cut

package Parrot::Harness::Smoke;

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Parrot::Config qw/%PConfig/;
use base qw( Exporter );
our @EXPORT_OK = qw(
    generate_html_smoke_report
    send_archive_to_smolder
);

my %SMOLDER_CONFIG = (
    server     => 'http://smolder.plusthree.com',
    username   => 'parrot-autobot',
    password   => 'squ@wk',
    project_id => 8,
);

sub send_archive_to_smolder {
    eval { require LWP::UserAgent };
    if( $@ ) {
        die "\n" . ('-' x 55) . "\nCould not load LWP::UserAgent."
            . "\nPlease install it if you want to send TAP archives smolder.\n"
            . ('-' x 55) . "\n\n$@\n";
    }

    # get the comments from svn
    my @lines = grep { $_ =~ /URL|Revision|LastChanged/ } `svn info`;
    push @lines, `$^X -v | grep -i 'this is perl'`;
    chomp @lines;
    my $comments = join("\n", @lines);

    my $url = "$SMOLDER_CONFIG{server}/app/developer_projects/process_add_report/$SMOLDER_CONFIG{project_id}";
    my $ua = LWP::UserAgent->new();
    my $response = $ua->post(
        $url,
        Content_Type => 'form-data',
        Content      => [
            architecture => $PConfig{cpuarch},
            platform     => $PConfig{osname},
            comments     => $comments,
            username     => $SMOLDER_CONFIG{username},
            password     => $SMOLDER_CONFIG{password},
            report_file  => ['parrot_test_run.tar.gz'],
        ]
    );

    if ($response->code != 302) {
        die "Could not upload report to Smolder at $SMOLDER_CONFIG{server}"
            . "\nHTTP CODE: " . $response->code . " ("
            .  $response->message . ")\n";
    }
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
