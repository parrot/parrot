#!/usr/bin/env perl
use strict;
use warnings;

use CGI;
use JSON::Any;
use Mail::Sendmail;
use Tie::Function;

use DateTime::Format::ISO8601;
use DateTime::TimeZone::Local;

my $q = CGI->new;
print $q->header;

if( my $p = $q->param('payload') ) {
    $p = JSON::Any->new->decode( $p );
    #use Data::Dumper;
    #warn Dumper $p;

    #tie my %short, 'Tie::Function' => sub { substr( shift(), 0, 8 ) };

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

		$c{message} = indent($c{message});

		<<EOF;
commit $c{id}
$c{url}
Author:  $c{author}{name} <$c{author}{email}>
Date:    $c{timestamp}

$c{message}

$file_changes
 $file_change_count

EOF
    } @{$p->{commits}};

    my $head = $p->{ref};
    $head =~ s|refs/heads/||;

    my $commit_cnt = scalar @{$p->{commits}};
    $commit_cnt = "$commit_cnt ".( $commit_cnt > 1 ? 'commits' : 'commit' );

    my %mail = ( From    => 'github-commits@bugs.sgn.cornell.edu',
		 Subject => "[$p->{repository}{owner}{name}/$p->{repository}{name}($head)] $commit_cnt - GitHub",
		 Message => <<EOF,
HEAD is now $p->{after}
Home:    $p->{repository}->{url}
Browse:  $p->{repository}->{url}/tree/$head
Commits: $p->{repository}->{url}/commits/$head
------------------

$commits
EOF
	       );

    my @send_list = ( 'parrot-commits@lists.parrot.org' );
    foreach my $to ( @send_list ) {
	sendmail( %mail, To => $to )
	    or warn "error sending to $to: $Mail::Sendmail::error";
    }

    #print "OK. Log says:\n", $Mail::Sendmail::log;
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
