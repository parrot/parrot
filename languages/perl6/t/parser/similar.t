#!/usr/bin/perl -w

######################################################################
# From "...And Now for Something Completely Similar" by Damian Conway
# http://www.samag.com/documents/s=4075/sam1013019189971/sam0203h.htm
# Modifications are marked with XXX.
######################################################################

use strict;

use FindBin;
use lib $FindBin::Bin;

use P6CTest tests => 6;

check_parse {
    name => "something similar",
    pgm_data => *DATA,
};

__DATA__
=====================================================
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

=====================================================
# XXX: system
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
# XXX: missing () around args
      action "gunzip'ing $file.$1",
             "gunzip $file.$1";
      $file _= ".tar" if $1 eq 'tgz';
   }

   my ($to, $enbundle, $relfile) =
             bundling_for($file, $original);

# XXX: missing () around args
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

=====================================================
my %translate = (
       "\r" => "\n",
   chr(128) => q{A},
   chr(129) => q{A},
   chr(130) => q{C},
   chr(131) => q{E},
   chr(132) => q{N},
   chr(133) => q{O},
   chr(176) => q{[inf]},
   chr(177) => q{[+-]},
   chr(178) => q{<=},
   chr(179) => q{>=},
   chr(180) => q{[JPY]},
   chr(249) => q{},
   chr(250) => q{},
   chr(251) => q{},
   chr(252) => q{},
   chr(253) => q{},
   chr(254) => q{},
   chr(255) => q{},
);

while (<>) {
# XXX: s///
#    s{(.)}
#     { defined %translate{$1}
#            ?? %translate{$1}
#            :: $1
#     }ges;
    print;
}

=====================================================
use strict;
# XXX: shift
# my $from = shift;
# my $to   = shift;
my($ffrom, $fto, $file);

foreach $file (@ARGS) {
   next unless -l $file;
# XXX: readlink
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

=====================================================
my $section_type = 'text';

sub start($type, $intro) {
   unless ($section_type eq $type) {
      print $intro;
      $section_type = $type;
   }
}

loop: while(<>) {
   given ($_) {
# XXX: semicolon
#      when /^\s*$/ : { print; }
      when /^\s*$/ { print; }
# XXX: s///
#      when s/^[*]{3}\s+// : {
	when "foo" {
         start('list', "\n=over\n");
         print "\n=item $_\n";
      }

      start('text', "\n=back\n\n")
         if $section_type eq 'list';

# XXX: s///
#      when s/^([*]{1,2})\s+// : {
	when "bar" {
         start('text', "\n");
         print "=head", length($1), " $_\n";
      }
# XXX: semicolon
      when /^\s/  {
         start('formatted', "\n");
         print;
      }
# XXX: else
#      else {
       default {
         start('text', "\n");
         print;
      }
   }
   print;
}

=====================================================
my $section_type = 'text';

sub start {
   my ($type, $intro) = @_;
   unless ($section_type eq $type) {
      print $intro;
      $section_type = $type;
   }
}

loop: while(<>) {
   print and next loop if /^\s*$/;

   if (s/^[*]{3}\s+//) {
      start('list', "\n=over\n");
      print "\n=item $_\n";
      next loop;
   }

   start('text', "\n=back\n\n")
      if $section_type eq 'list';

   if (s/^([*]{1,2})\s+//) {
      start('text', "\n");
      print "=head", length($1), " $_\n";
      next loop;
   }
   elsif (/^\s/) {
      start('formatted', "\n");
   }
   else {
      start('text', "\n");
   }
   print;
}
