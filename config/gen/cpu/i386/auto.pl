#! perl -w
# Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/gen/cpu/i386/auto.pl

=head1 DESCRIPTION

Test for MMX/SSE functionality. Creates these Config entries

 TEMP_generated => 'files ...'   for inclusion in platform/mem.c
 i386_has_mmx   => 1

=cut

use strict;
sub run_cpu {
    my $verbose = shift;
    my (@files) = qw( memcpy_mmx.c );
    for my $f (@files) {
	print " $f " if $verbose;
	$f = "config/gen/cpu/i386/$f";
	cc_gen($f);
	eval( cc_build("-DPARROT_TEST"));
	if ($@) {
	    print " $@ " if $verbose;
	}
	else {
	    if (cc_run() =~ /ok/) {
		Configure::Data->set('i386_has_mmx' => '1');
		print " (MMX) " if ($verbose);
	        Configure::Data->add(',',
			"TEMP_generated" => $f
		);
	    }
	}
	cc_clean();
    }
}
1;
