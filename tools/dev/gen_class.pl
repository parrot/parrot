#! perl
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

tools/dev/gen_class.pl - Create a template PMC file

=head1 SYNOPSIS

	% perl tools/dev/gen_class.pl Foo > src/pmc/Foo.pmc

=head1 DESCRIPTION

Use this script to generate a template PMC file with stubs for all the
methods you need to fill in. See F<docs/vtables.pod> for more
information on adding a new PMC to Parrot.

To see what a minimal PMC looks like, create a PMC template and compile
it to C.

	% perl tools/dev/gen_class.pl Foo > src/pmc/foo.pmc
	% perl tools/build/pmc2c.pl -c src/pmc/foo.pmc

=head1 SEE ALSO

F<tools/build/pmc2c.pl>, F<docs/vtables.pod>.

=cut


use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../lib";
use Parrot::Vtable;


my $vtbl = parse_vtable("$FindBin::Bin/../../vtable.tbl");

my $classname = shift
	or die "No classname given!\n";


## emit file header
print <<EOF;
/* ${classname}.pmc
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  SVN Info
 *     \$Id\$
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

## emit method bodies
for (@$vtbl) {
	my ($retval, $methname, $args) = @$_;
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

## emit file footer
print "}\n";
