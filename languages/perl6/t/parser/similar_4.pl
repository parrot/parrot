use strict;
# XXX: shift
# my $from = shift;
# my $to   = shift;
my($ffrom, $fto, $file);

foreach $file (@ARGS) {
   next unless -l $file;
   $ffrom = readlink $file;
   unless (defined $ffrom) {
      warn "$file: $!\n";
      next;
   }
# XXX: s///
#   if (($fto = $ffrom) =~ s/$from/$to/) {
if 1 {
      unlink $file;
      if (symlink $fto, $file) {
         print "$file: $ffrom -> $fto\n";
      } else {
         warn "Couldn't create link $file: ",
              "$ffrom -> $fto: $!\n";
      }
   }
}
