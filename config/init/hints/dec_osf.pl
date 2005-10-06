# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

# Tru64
my $ccflags = Configure::Data->get('ccflags');
if ( $ccflags !~ /-pthread/ ) {
    $ccflags .= ' -pthread';
}
if ( $ccflags !~ /-D_XOPEN_SOURCE=/ ) {
    # Request all POSIX visible (not automatic for cxx, as it is for cc)
    $ccflags .= ' -D_XOPEN_SOURCE=500';
}
Configure::Data->set(
    ccflags => $ccflags,
);

my $libs = Configure::Data->get('libs');
if ( $libs !~ /-lpthread/ ) {
    $libs .= ' -lpthread';
}
if ( $libs !~ /-laio/ ) {
    $libs .= ' -laio';
}
Configure::Data->set(
    libs => $libs,
);

for my $ldflags (qw(ld_load_flags ld_share_flags)) {
    my $f = Configure::Data->get($ldflags);
    if ($f =~ s/ -s / /) {
	Configure::Data->set($ldflags => $f);
    }
}

my $linkflags = Configure::Data->get('linkflags');
if ( $linkflags !~ /-expect_unresolved/ ) {
    $linkflags = "-expect_unresolved '*' -O4 -msym -std $linkflags";
    Configure::Data->set(linkflags => $linkflags);
}

# Required because of ICU using c++.
Configure::Data->set(
    link => "cxx",
);
