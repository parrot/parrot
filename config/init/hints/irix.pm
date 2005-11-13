# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

my $ccflags = Parrot::Configure::Data->get('ccflags') || "";
# 1185 An enumerated type is mixed with another type.
if ($ccflags =~ /-woff /) {
  $ccflags =~ s/-woff (?:\d+,)*\d+/-woff 1185/;
} else {
  $ccflags .= ' -woff 1185';
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

my $cc   = Parrot::Configure::Data->get('cc');
my $cxx  = Parrot::Configure::Data->get('cxx');
my $ld   = Parrot::Configure::Data->get('ld');
my $link = Parrot::Configure::Data->get('link');
if ( $cc =~ /cc -64/ ) {
    $cxx  = 'CC -64';
    $ld   = 'CC -64';
    $link = 'CC -64';
    Parrot::Configure::Data->set(
        cxx  => $cxx,
        ld   => $ld,
        link => $link,
    );
}
