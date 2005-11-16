# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

my $libs = Parrot::Configure::Data->get('libs');
my $cflags = Parrot::Configure::Data->get('ccflags');
my $cc = Parrot::Configure::Data->get('cc');
my $linkflags = Parrot::Configure::Data->get('linkflags');
my $link = 'c++'; # should find g++ in most cases

if ($libs !~ /-lpthread/) {
    $libs .= ' -lpthread';
}
my $ld_share_flags = Parrot::Configure::Data->get('ld_share_flags');
if ( $ld_share_flags !~ /-fPIC/ ) {
    $ld_share_flags .= ' -fPIC';
}

if ( $cc =~ /icc/ ) {
    $link = 'icc'; # Intel C++ compiler has the same name as its C compiler
    $cflags .= ' -no-gcc'; # don't allow icc to pretend it's gcc
    $cflags .= ' -wd269'; # suppress sprintf warnings that don't apply
}
else {
    $linkflags .= ' -Wl,-E';  # --export-dynamic, s. info gcc, ld
}

if ( $cflags !~ /-D_GNU_SOURCE/ ) {
    # Request visibility of all POSIX symbols
    # _XOPEN_SOURCE=600 doesn't work with glibc 2.1.3
    # _XOPEN_SOURCE=500 gives 2 undefined warns (setenv, unsetenv) on 2.1.3
    $cflags .= ' -D_GNU_SOURCE';
}

Parrot::Configure::Data->set(
    ccflags        => $cflags,
    libs           => $libs,
    ld_share_flags => $ld_share_flags,
    ld_load_flags  => $ld_share_flags,
    i_lib_pthread  => 1,               # XXX fake a header entry
    linkflags      => $linkflags,
    link           => $link,
);

if ((split('-', $Config{archname}))[0] eq 'ia64') {
    Parrot::Configure::Data->set(
        platform_asm => 1
    );
}
