sub action { print "@_[0]\n"; system @_[1] }

foreach my $file ( @ARGS ) {
   my $original = $file;

# XXX: s///
#   if ($file =~ s/[.](uu)$//) {
if 1 {
      action "unuu'ing $file.$1",
             "uudecode $file.$1";
   }

# XXX: s///
#   if ($file =~ s/[.](t?gz)$//) {
if 2 {
      action "gunzip'ing $file.$1",
             "gunzip $file.$1";
      $file _= ".tar" if $1 eq 'tgz';
   }

   my ($to, $enbundle, $relfile) =
             bundling_for($file, $original);

   action "untar'ing $file $to",
          "$enbundle tar -xpf $relfile";
}

sub bundling_for {
   my ($file, $dir) = @_;
   chomp(my @files =
         ($FILELIST = open("tar t <$file|"))
          && <$FILELIST>);
   return ("(no contents)", "", $file)
      if !@files;
   return ("to @files[0]",  "", $file)
      if @files == 1 ||
         @files[0] =~ m{/$} &&
            !grep {$_ !~ /^\Q@files[0]/}
# XXX [1..]
#                  @files[1..];
                  @files[1..10000];
   $dir _= ".CONTENTS";
   return ("to $dir",
           "mkdir $dir; cd $dir;",
           "../$file");
}
