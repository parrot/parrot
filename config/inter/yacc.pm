# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/auto/yacc.pl - parser generator

=head1 DESCRIPTION

Determines whether C<yacc> is installed and if it's actually C<bison>.

=cut

package Configure::Step;

use strict;

use vars qw( $description @args $prompt $util );
use Parrot::Configure::Step qw( :inter capture_output check_progs );

$util           = 'yacc';
$description    = "Determining whether $util is installed";
$prompt         = "Do you have a parser generator, like bison or yacc?";
@args =          qw( yacc ask maintainer );

sub runstep {
    my %args;
    @args{@args}=@_;

    # undef means we don't have bison... default to not having bison
    Configure::Data->set(bison_version => undef);

    unless ($args{maintainer}) {
        Configure::Data->set( $util => 'echo' );
        $Configure::Step::result = 'skipped';
        return undef;
    }

    my $prog;
    # precedence of sources for the program:
    # default -> probe -> environment -> option -> ask
    $prog ||= $args{$util};
    $prog ||= $ENV{uc($util)};

    # never override the user.  If a non-existent program is specified then
    # the user is responsible for the consequences.
    if (defined $prog) {
        Configure::Data->set($util => $prog);
        $Configure::Step::result = 'yes';
        return undef;
    }

    $prog = check_progs(['bison -v -y', 'yacc', 'byacc']);

    unless ($prog) {
        # fall back to default
        $Configure::Step::result = 'no';
        return undef;
    }

    if ($args{ask}) {
        $prog = prompt($prompt, $prog ? $prog : Configure::Data->get($util));
    }

    my ($stdout, $stderr, $ret) = capture_output($prog, '--version');

    # don't override the user even if the program they provided appears to be
    # broken
    if ($ret == -1 and ! $args{ask}) {
        # fall back to default
        $Configure::Step::result = 'no';
        return undef;
    }

    # if '--version' returns a string assume that this is bison.
    # if this is bison pretending to be yacc '--version' doesn't work
    if ($stdout =~ /Bison .*? (\d+) \. (\d+) (\w)? /x) {
        Configure::Data->set(bison_version => $3 ? "$1.$2$3" : "$1.$2");
    }

    Configure::Data->set($util => $prog);
    $Configure::Step::result = 'yes';
}

1;
