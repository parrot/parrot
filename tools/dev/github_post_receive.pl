#! perl
# Copyright (C) 2010, Parrot Foundation.

use strict;
use warnings;

use CGI;
use JSON::Any;
use Mail::Sendmail;
use Net::GitHub;

use DateTime::Format::ISO8601;
use DateTime::TimeZone::Local;

=head1 NAME

tools/dev/github_post_receive.pl

=head1 DESCRIPTION

a post-receive script to send commit diffs to parrot developers

=cut


my $github = Net::GitHub->new(
    owner => 'fernandobrito', repo => 'parrot'
);

my $from = 'brito@localhost';
my @send_list = ( 'b11046@pjjkp.com' );
my $auth_token = 'abc123';

my $q = CGI->new;
print $q->header;

if( $q->param('token') ne $auth_token ) {
    print $q->h1("'token' GET param is wrong");
    die();
}

if( my $p_json = $q->param('payload') ) {
    my $p = JSON::Any->new->decode( $p_json );

    my $commits =
        join '',
            map {
                my %c = %$_;
                $c{timestamp} = eval { fmt_time($c{timestamp}) } || $c{timestamp};
                my @file_changes =
                    map ' '.join(' ', @$_),
                    sort { $a->[1] cmp $b->[1] }
                    ( ( map ['A',$_], @{$c{added}   } ),
                      ( map ['D',$_], @{$c{removed} } ),
                      ( map ['M',$_], @{$c{modified}} ),
                    );
                my $file_change_count = @file_changes;
                $file_change_count = "$file_change_count ".($file_change_count > 1 ? 'files changed' : 'file changed');
                my $file_changes = join "\n", @file_changes;

                my $diff = diff_from_github_api($c{id});

                $c{message} = indent($c{message});

                <<EOF;
Author:  $c{author}{name} <$c{author}{email}>
Date:    $c{timestamp}
commit $c{id}
$c{url}

$c{message}

$file_change_count:
$file_changes

$diff
==================

EOF
    } @{$p->{commits}};

    my $head = $p->{ref};
    $head =~ s|refs/heads/||;

    my $commit_cnt = scalar @{$p->{commits}};
    $commit_cnt = "$commit_cnt ".( $commit_cnt > 1 ? 'commits' : 'commit' );

    my %mail = ( From => $from,
                 Subject => "[$p->{repository}{owner}{name}/$p->{repository}{name}($head)] $commit_cnt - GitHub",
                 Message => <<EOF,
HEAD is now $p->{after}
Home:    $p->{repository}->{url}
Browse:  $p->{repository}->{url}/tree/$head
Commits: $p->{repository}->{url}/commits/$head
==================

$commits
EOF
               );

    foreach my $to ( @send_list ) {
        sendmail( %mail, To => $to )
            or print $q->p("error sending to $to: $Mail::Sendmail::error");
    }

    print $q->p(%mail);
    print $q->p("OK. Log says:\n", $Mail::Sendmail::log);
}

sub short_commitname {
    my $c = shift;
    return substr( $c, 0, 8 );
}

sub indent {
    my $m = shift;
    chomp $m;
    $m =~ s/\n/\n    /g;
    return "    $m";
}

sub fmt_time {
    my $d = DateTime::Format::ISO8601->parse_datetime( shift );
    $d->set_time_zone(DateTime::TimeZone::Local->TimeZone() );
    return $d->strftime(q|%a %m/%d/%y, %I:%m %p %Z|);
}

sub diff_from_github_api {
    my $sha1 = shift;
    my $output = '';

    my $co_details = $github->commit->show( $sha1 );

    for my $files_changed (@{$co_details->{modified}}) {
        $output .= $files_changed->{diff} . "\n";
    }

    return $output;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
