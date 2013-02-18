#! perl
# Copyright (C) 2008-2012, Parrot Foundation.

use warnings;
use strict;
use lib qw(lib ../lib ../../lib);
use Parrot::BuildUtil;
use Parrot::Config;
use Cwd;

my $pwd = cwd();
my $build_dir = $PConfig{'build_dir'};
if ($build_dir and ($pwd ne $build_dir)) {
    chdir $build_dir;
}
if ($ARGV[0] eq '-l' or $ARGV[0] eq '--list') {
    shift;
    Parrot::BuildUtil::add_list_to_generated(@ARGV);
}
else {
    Parrot::BuildUtil::add_to_generated(@ARGV);
}
if ($pwd ne $build_dir) {
    chdir $pwd;
}
exit 0;

#################### DOCUMENTATION ####################

=head1 NAME

tools/build/addgenerated.pl - Helper for build-time MANIFEST.generated

=head1 SYNOPSIS

    % perl tools/build/addgenerated.pl file [section] dir
    % perl tools/build/addgenerated.pl file1 file2 ...
    % perl tools/build/addgenerated.pl -l [section] file1 file2 ...

=head1 DESCRIPTION

This script is a simple front-end for C<Parrot::BuildUtil::add_to_generated>

Default section: [main]

Default dir: ""

=over

=back

=head2 Options

=over 4

=item C<-l> or C<--list>

There's no dir argument, but a list of filenames instead

=item C<--help>

Print synopsis.

=back

=head1 SEE ALSO

=over 4

=item C<Parrot::BuildUtil>

=back

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

