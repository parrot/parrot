#!perl

# Copyright (C) 2008, Parrot Foundation.

use 5.008;
use strict;
use warnings;

use WWW::Mechanize;
use Getopt::Std;
use Pod::Usage;


my $server  = 'nopaste.snit.ch';
my $url     = "http://$server:8001/paste";
my $opt     = {
    c => '#parrot',                              # channel
    n => getlogin || getpwuid($<) || 'someone',  # name
    t => undef,                                  # title
};

getopt( 'c:n:t:', $opt );

pod2usage(2)
    unless defined $opt->{t};


my $text; while(<>) { $text .= $_; }
my $mech  = WWW::Mechanize->new(
    cookie_jar => undef,
    autocheck  => 1,
);

$mech->get( $url );

$mech->submit_form(
    form_name => 'pasteForm',
    fields    => {
        (defined $opt->{c} ?
        (channel => $opt->{c}) :
        ()
        ),
        nick    => $opt->{n},
        summary => $opt->{t},
        paste   => $text,
    },
    button    => 'Paste it',
);

my @link = $mech->links;
print "Your paste can be found at ", $link[0]->url, "\n";


=head1 NAME

tools/dev/nopaste.pl - paste the contents of a file via a pastebot server

=head1 SYNOPSIS

  nopaste.pl -t "TITLE" [ -c CHANNEL ] [ -n NAME ] [ FILENAME ]

    TITLE     the title of the paste
    CHANNEL   the irc channel (defaults to #parrot)
    NAME      the username (defaults to username or 'someone')
    FILENAME  the name of the file to paste (defaults to STDIN)

=head1 DESCRIPTION

This program can be used to paste the contents of a file on a pastebot server
-- specifically, B<nopaste.snit.ch> -- for immediate linkage on an IRC channel --
by default, B<#parrot>.

=head1 AUTHOR

Originally written by particle, with subsequent contributions to functionality
by LimbicRegion, paultcochrane and cotto.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
