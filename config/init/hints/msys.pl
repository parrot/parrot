# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

{
	my %args;
	@args{@args}=@_;

	Configure::Data->set(
		ld => '$(PERL) /bin/perlld',
		libs => '-lmsvcrt -lmoldname -lkernel32 -luser32 -lgdi32 -lwinspool -lcomdlg32 -ladvapi32 -lshell32 -lole32 -loleaut32 -lnetapi32 -luuid -lws2_32 -lmpr -lwinmm -lversion -lodbc32 ',
		ncilib_link_extra => '-def:src/libnci_test.def',
	);

}
