use warnings;

# XXX: shift
#$code = shift
#   or die "usage: $0 code [file ...]\n";
# XXX: eval
#$process =
#   eval "sub { my \$_ = shift; $code }";
die if $!;

# XXX: glob
#@ARGS = map { glob } @ARGS;

while (<>) {
  if (/^From /) {
    $process($msg) if $msg;
    $msg = '';
  }
  $msg _= $_;
}
$process($msg) if $msg;
