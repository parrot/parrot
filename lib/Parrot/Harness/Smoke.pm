# Copyright (C) 2006-2007, The Perl Foundation.
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
use lib qw( . lib ../lib ../../lib );
use Parrot::Config qw/%PConfig/;
use base qw( Exporter );
our @EXPORT_OK = qw(
    generate_html_smoke_report
);

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

      open HTML, '>', $html_fn;
      print HTML $v->html();
      close HTML;

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

