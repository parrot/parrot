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
#      when /^\s/ : {
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
