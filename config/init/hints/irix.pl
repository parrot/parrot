my $ccflags = Configure::Data->get('ccflags') || "";
# 1185 An enumerated type is mixed with another type.
if ($ccflags =~ /-woff /) {
  $ccflags =~ s/-woff (?:\d+,)*\d+/-woff 1185/;
} else {
  $ccflags .= ' -woff 1185';
}
Configure::Data->set(
    ccflags => $ccflags,
);

my $libs = Configure::Data->get('libs');
if ( $libs !~ /-lpthread/ ) {
    $libs .= ' -lpthread';
}
Configure::Data->set(
    libs => $libs,
);

my $cc   = Configure::Data->get('cc');
my $cxx  = Configure::Data->get('cxx');
my $ld   = Configure::Data->get('ld');
my $link = Configure::Data->get('link');
if ( $cc =~ /cc -64/ ) {
    $cxx  = 'CC -64';
    $ld   = 'CC -64';
    $link = 'CC -64';
    Configure::Data->set(
        cxx  => $cxx,
        ld   => $ld,
        link => $link,
    );
}
