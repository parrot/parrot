# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$


my $ccflags = Parrot::Configure::Data->get('ccflags');
if ( $ccflags !~ /-pthread/ ) {
    $ccflags .= ' -pthread';
}
Parrot::Configure::Data->set(
    ccflags => $ccflags,
);

my $libs = Parrot::Configure::Data->get('libs');
if ( $libs !~ /-lpthread/ ) {
    $libs .= ' -lpthread';
}
Parrot::Configure::Data->set(
    libs => $libs,
);
