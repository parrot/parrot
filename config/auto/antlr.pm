# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/auto/antlr - Check whether antlr works

=head1 DESCRIPTION

Determines wheter antlr exists on the system.
Is so, then check whether there is support for Python output.

When antlr is not found, then something like

  export CLASSPATH=/home/myself/devel/antlr/antlr-2.7.5:/home/myself/devel/antlr/antlr-2.7.5/antlr-2.7.5.jar

might help.

=cut

package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':auto', 'capture_output';

$description = "Determining whether antlr is installed...";

@args = qw(verbose);

sub runstep {
    my ( $out, $err ) = capture_output( 'antlr', '-h' );
    my $output = join( '', $out || '', $err || '' );
    my ($python, $major, $minor, $revision) = 
        $output =~ m/(Python)\s+(\d+).(\d+)(?:.(\d+))?/;
    my $has_antlr = ($output =~ m/ANTLR Parser Generator/) ? 1 : 0;

    Configure::Data->set(has_antlr => $has_antlr);

    my $has_antlr_with_python = 0;
    if ( $has_antlr ) {
        unlink <config/auto/antlr/*.py>;
        capture_output( 'antlr', '-o', 'config/auto/antlr', 'config/auto/antlr/test_python.g' );
        $has_antlr_with_python = 1 if -e 'config/auto/antlr/test_python_l.py';
        $Configure::Step::result = $has_antlr_with_python ?
                                       'yes, with python' :
                                       'yes, no python';
    } else {
        $Configure::Step::result = ($output =~ m/NoClassDefFoundError/) ?
                                     'no, NoClassDefFoundError' :
                                     'no';
    }
    Configure::Data->set(has_antlr_with_python => $has_antlr_with_python);
}

1;
