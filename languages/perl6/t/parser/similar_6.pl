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
