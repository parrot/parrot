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
