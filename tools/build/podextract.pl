#! perl
# Copyright (C) 2014, Parrot Foundation.

=head1 NAME

tools/build/podextract.pl

=head1 DESCRIPTION

Simple POD Extraction

=head1 SYNOPSIS

Now:

    perl podextract.pl $source $target

Previously:

    perldoc -ud $target $source

or

    perldoc -u $source > $target

=head1 RATIONALE

C<perldoc> does many things, and is somewhat complex.

For instance, normally,

    perldoc perldoc

inspects various paths, and paths that are controlled by C<%ENV> to
find relevant documentation for "perldoc".

And because of this, it is a little security conscious, and
pre-emptively drops root to UID=nobody

But Parrot is not using this feature of C<perldoc>.
Parrot is simply using C<perldoc> as a content filter to extract
C<POD> from source files.

And as such, it only needs the alternative function

    perldoc $PATH

To work, which doesn't require C<%ENV>, and additionally, dropping
root to C<UID=nobody> makes it impossible for some parrot to invoke
C<perldoc -ud $target $source> on some systems, because it drops
privileges and can then no longer read C<$source>, and can no longer
write C<$target>.

However, some means vendor tooling that B<MUST> execute C<make install>
as root, by proxy, C<MUST> invoke C<perldoc> as root, and as
such, invokes the security problem, which is impossible to work
around.

Given a simple C<chmod> is not enough, because parent directories also
are not readable or writeable by C<UID=nobody>, and additionally,
vendor tooling causes fatal access violations when a process running
as C<UID=nobody> even attempts to do directory lookaround ( which
C<perldoc> does much of as part of C<%ENV> handling )

So this tool is simple:

It takes the very core utility in C<PerlDoc> that parrot needed to
utilize, and calls it directly.

And this avoids the misguided attempts of increasing security, which
simply does nothing useful.

=cut

use strict;
use warnings;

if ( not $ARGV[1] ) {
    die "pod_extract <src> <target>";
}
if ( not -e $ARGV[0] ) {
    die "<src> $ARGV[0] does not exist";
}
require Pod::Perldoc::ToPod;
my $parser = Pod::Perldoc::ToPod->new();
open my $output, '>', $ARGV[1] or die "Cant write to $ARGV[1] $! $?";
$parser->parse_from_file( $ARGV[0], $output );

exit 0;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

