#! perl -w
################################################################################
# $Id$
################################################################################

=head1 NAME

classes/genclass.pl - Create a template PMC file

=head1 SYNOPSIS

    % perl classes/genclass.pl Foo > Foo.pmc
    
=head1 DESCRIPTION

Use this script to generate a template PMC file with stubs for all the
methods you need to fill in. See F<docs/vtables.pod> for more
information on adding a new PMC to Parrot.

To see what a minimal PMC looks like, create a PMC template and compile
it to C.
    
    cd classes
    perl genclass.pl Foo > foo.pmc
    perl pmc2c.pl foo.pmc

=head1 SEE ALSO

F<classes/pmc2c.pl>, F<docs/vtables.pod>.

=cut

################################################################################

use FindBin;
use lib "$FindBin::Bin/../lib";

use Parrot::Vtable;

my $vtbl = parse_vtable("$FindBin::Bin/../vtable.tbl");

my $classname = shift;

die "No classname given!\n" unless $classname;

my $DOLLAR = '$';

print <<EOF;
/* ${classname}.pmc
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     ${DOLLAR}Id${DOLLAR}
 *  Overview:
 *     These are the vtable functions for the $classname base class
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *     Please remove unneeded entries.
 *  References:
 */

#include "parrot/parrot.h"

pmclass $classname {

EOF

my $decls;

for (@{$vtbl}) {
    my ($retval, $methname, $args) = @{$_};
    if ($methname eq 'type' || $methname eq 'name' || $methname =~ /prop/) {
	# default.pmc handles these
	next;
    }

    print "    $retval $methname ($args) {\n";
    if($retval ne 'void') {
	print "        return ($retval)0;\n";
    }
    print "    }\n\n";
}

print "}\n";
