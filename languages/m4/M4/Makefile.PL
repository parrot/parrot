# $Id$

use 5.005;
use ExtUtils::MakeMaker;

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile( 'NAME'		=> 'M4::Test',
               'VERSION_FROM'	=> 'Test.pm', # finds $VERSION
               'PREREQ_PM'      => {}, # e.g., Module::Name => 1.1
               'ABSTRACT_FROM'  => 'Test.pm', # retrieve abstract from module
               AUTHOR           => 'Bernhard Schmalhofer <Bernhard.Schmalhofer!no_spam!gmx.de>'),
             );
