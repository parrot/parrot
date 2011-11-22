# Copyright (C) 2006-2010, Parrot Foundation.

=head1 NAME

Parrot::Harness::Smoke - Generate smoke reports

=head1 DESCRIPTION

This package exports on request subroutines used by the root F<t/harness>
and by language implementation F<t/harness> to generate smoke reports.

=head1 SUBROUTINES

The module currently exports three subroutines on demand.

=head2 C<collect_test_environment_data()>

    %env_data = collect_test_environment_data();

It collects environmental data via:

=over 4

=item * Analysis of the results of Parrot configuration (C<%PConfig>).

=item * Environmental variables

=item * Analysis of C<git> metadata

=item * Application of CPAN modules.  F<Mail::Util> and F<Sys::Hostname> are
used, if available.

=back

You may directly affect I<Submitter> data by setting the following environmental
variable(s):

=over 4

=item *  All systems.  C<$ENV{'SMOLDER_SUBMITTER'}>.

=item * Win32 only.  C<$ENV{'USERNAME'}> or C<$ENV{'LOGNAME'}>, plus
C<$ENV{'USERDOMAIN'}>.

=back

=head2 C<send_archive_to_smolder()>

    send_archive_to_smolder( %env_data );

At the current time, automated smoke reports are collected and displayed via
the Smolder system at L<http://smolder.parrot.org>.  Such reports require
the Perl 5 F<LWP::UserAgent> module, available from CPAN.

On network problem or for offline use you may send tar reports later
with that command:

  perl -Ilib -MParrot::Harness::Smoke \
    -e'Parrot::Harness::Smoke::send_archive_to_smolder(Parrot::Harness::Smoke::collect_test_environment_data())'

=head2 C<generate_html_smoke_report()>

This subroutine generates a type of HTML-smoke report formerly collected and
displayed on Parrot's smoke server.  It has been superseded by Smolder
reporting but is still available for other uses.

    generate_html_smoke_report (
        tests       => \@tests,
        args        => $args,
        file        => 'smoke.html',
    );

This subroutine requires CPAN modules F<Test::TAP::HTMLMatrix> and
F<Test::TAP::Model::Visual>.

=cut

package Parrot::Harness::Smoke;

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Parrot::Config qw/%PConfig/;
use Parrot::Git::Describe;
use base qw( Exporter );
our @EXPORT_OK = qw(
    generate_html_smoke_report
    collect_test_environment_data
    send_archive_to_smolder
);

# language implementations have a different project id
my %SMOLDER_CONFIG = (
    server       => 'http://smolder.parrot.org',
    username     => 'parrot-autobot',
    password     => 'qa_rocks',
    project_id   => 1,
    report_file  => ['t/archive/parrot_test_run.tar.gz'],
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
          . '/app/projects/process_add_report/'
          . $project_id;
    my $ua = LWP::UserAgent->new();
    $ua->timeout(360);
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
            revision     => $Parrot::Git::Describe::current || '',
        ]
    );

    if ($response->code == 302) {
        my ($report_id) = $response->content =~ /Reported #(\d+) added/i;
        my $report_url = "$SMOLDER_CONFIG{server}/app/projects/report_details/$report_id";
        my $project_url
            =   $SMOLDER_CONFIG{server}
              . '/app/projects/smoke_reports/'
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
    my ($branch, @mods);
    # rename sun4 to sparc
    my $arch = $PConfig{cpuarch} eq 'sun4' ? 'sparc' : $PConfig{cpuarch};
    # add the 32/64 bit suffix to the cpuarch
    if ($arch !~ /\d$/) {
      $arch .= 8 * $PConfig{opcodesize};
    }
    my $devel = $PConfig{DEVEL};
    # check for local-modifications if -d .git and query to continue
    if (-d ".git") {
        my $status = `git status`;
        @mods = grep /\S/, map { /^#\s+modified:\s+(.+)$/ and $1 } split(/\n/, $status);
        if (@mods) {
            $devel .= (" ".@mods." mods");
        }
        my $out = `git branch`;
        ($branch) = $out =~ m{\* ([-/\w]+)$}m;
    }
    my $me = $^O eq 'MSWin32' ? $ENV{'USERNAME'}
           : $ENV{'LOGNAME'} || eval { getpwuid($<) };
    my $domain = 'unknown';
    eval "use Mail::Util;";
    if (!$@) {
        $domain = Mail::Util::maildomain();
    }
    elsif ($^O eq 'MSWin32') {
        $domain = $ENV{'USERDOMAIN'};
    }
    else {
        eval { require Sys::Hostname;
        $domain = Sys::Hostname::hostname(); }
    }
    my @data = (
        'Architecture' => $arch,
        'Compiler'     => _get_compiler_version(),
        'DEVEL'        => $devel,
        'Optimize'     => ($PConfig{optimize} || 'none'),
        'Perl Version' => (sprintf('%vd', $^V) . " $PConfig{archname}"),
        'Platform'     => $PConfig{osname},
        'Version'      => $PConfig{VERSION},
        'Submitter'    => $ENV{"SMOLDER_SUBMITTER"} || "$me\@$domain"
    );
    push @data, ( 'Branch' => $branch ) if $branch;
    push @data, ( 'Configure args' => $PConfig{configure_args} )
      if $PConfig{configure_args};
    push @data, ( 'Modifications' => join(" ", @mods) ) if @mods;
    push @data, ( 'Git sha1' => $PConfig{sha1} )
      if $PConfig{sha1};
    return @data;
}

# this can be expanded to more than just GCC
sub _get_compiler_version {
    my $compiler = $PConfig{cc};
    if ($compiler =~ /gcc/ and $PConfig{gccversion}) {
        $compiler .= " $PConfig{gccversion}";
    }
    elsif ($compiler =~ /cl/ and $PConfig{msvcversion}) {
        $compiler .= " $PConfig{msvcversion}";
    }
    # catch cc or ccache
    elsif ($PConfig{gccversion}) {
        $compiler .= " (gcc $PConfig{gccversion})";
    }
    elsif ($PConfig{msvcversion}) {
        $compiler .= " (msvc $PConfig{msvcversion})";
    }
    return $compiler;
}

sub generate_html_smoke_report {
    my $argsref = shift;
    my $html_fn = $argsref->{file};

    eval {
        require Test::TAP::HTMLMatrix;
        require Test::TAP::Model::Visual;
    };
    die "You must have Test::TAP::HTMLMatrix installed.\n\n$@"
        if $@;

    my @test_env_data = collect_test_environment_data();

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
      my %hash = @test_env_data;
      my $branch = $hash{Branch} ||= 'trunk';
      my $v = Test::TAP::HTMLMatrix->new(
        $model,
        join("\n",
             "duration: $duration",
             "branch: $branch",
             "harness_args: " . (($argsref->{args}) ? $argsref->{args} : "N/A"),
             map { "$_: $hash{$_}" } keys %hash),
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
