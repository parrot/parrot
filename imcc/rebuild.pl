#!perl

=head1 TITLE

rebuild.pl

=head1 SYNOPSIS

Run a command to rebuild a set of files only if the inputs have
changed, as judged by their checksums.

=head1 USAGE

  rebuild.pl [-v] <command> <input> <outputs>...

=head1 DISCUSSION

This script works by appending the line

  /* CHECKSUM: <checksum> */

to the end of all generated output files, and checking for that line
before rerunning the build script.

=head1 EXAMPLE

See parrot/config/gen/makefiles/imcc.in for an example usage.

=cut

use strict;

my $Verbose = 0;
if ($ARGV[0] eq '-v') {
    shift;
    $Verbose = 1;
}

my ($command, $input, @outputs) = @ARGV;
my $checksum;
{
    local $/;
    open(INPUT, $input) or die "open $input: $!";
    $checksum = unpack("%32C*", <INPUT>);
    close INPUT;
}

my $up_to_date = 1;
foreach my $output (@outputs) {
    if (! open(OUTPUT, $output)) {
        print "$output does not exist; remaking\n" if $Verbose;
        $up_to_date = 0;
        last;
    }
    my $checksum_line = (<OUTPUT>)[-1];
    close OUTPUT;
    if ($checksum_line !~ m!^/\* CHECKSUM: ([-\d+]+) \*/$!) {
        print "$output does not have a checksum line; remaking\n" if $Verbose;
        $up_to_date = 0;
        last;
    }
    if ($1 != $checksum) {
        print "$output was built from different version of $input; remaking\n"
          if $Verbose;
        $up_to_date = 0;
        last;
    }
    print "$output is up to date with respect to $input\n" if $Verbose;
}

exit 0 if $up_to_date;

print "$command\n";
my $status = system($command);
exit 1 if (! defined $status);
exit($status >> 8) if $status != 0;

foreach my $output (@outputs) {
    open(OUTPUT, ">>$output") or die "open $output for append: $!";
    print OUTPUT "/* CHECKSUM: $checksum */\n";
    close OUTPUT;
}

exit 0;
