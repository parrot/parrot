#! perl
# Copyright (C) 2001-2007, Parrot Foundation.
# $Id$

use strict;
use warnings;

use lib 'lib';
use Parrot::Ops2pm;
use Parrot::Ops2pm::Auxiliary qw( Usage getoptions );

my $flagref = getoptions();

if ( $flagref->{help} or !@ARGV ) {
    Usage();
    exit;
}

my $self = Parrot::Ops2pm->new(
    {
        argv    => [@ARGV],
        nolines => $flagref->{nolines},
        renum   => $flagref->{renum},
        moddir  => "lib/Parrot/OpLib",
        module  => "core.pm",
        inc_dir => "include/parrot/oplib",
        inc_f   => "ops.h",
        script  => "tools/build/ops2pm.pl",
    }
);

$self->prepare_ops();
$self->load_op_map_files();
$self->sort_ops();
$self->prepare_real_ops();
$self->print_module();
$self->print_h();

exit 0;

################### DOCUMENTATION ####################

=head1 NAME

tools/build/ops2pm.pl - Generate Perl module from operation definitions

=head1 SYNOPSIS

 $ perl tools/build/ops2pm.pl [--help] [--no-lines] input.ops [input2.ops ...]
 $ perl tools/build/ops2pm.pl [--renum]  input.ops [input2.ops ...]

=head1 DESCRIPTION

Reads the ops files listed on the command line and outputs a
F<Parrot::OpLib::core> module containing information about the ops.
Also outputs F<include/parrot/oplib/ops.h>.  This program is called by Parrot's
F<make>.

If called with the C<--renum> flag, renumbers the file F<src/ops/ops.num>.
This is mandatory when adding or removing opcodes.

=head1 OPTIONS

=over 4

=item C<--help>

Print synopsis.

=item C<--no-lines>

Do not generate C<#line> directives in the generated C code.

=item C<--renum>

Renumber opcodes according to existing ops in ops/num and natural
order in the given ops files. See also F<tools/dev/ops_renum.mak>.

=back

Most of the functionality in this program is now held in Parrot::Ops2pm::Util
methods and a small number of Parrot::Ops2pm::Auxiliary subroutines.
See those modules' documentation for discussion of those functions.
Revisions to the functionality should be made in those packages and tested
against tests found in F<t/tools/ops2pm/>.

=head1 WARNING

Generating a C<Parrot::OpLib::core> module for a set of ops files that
you do not later turn into C code (see F<tools/build/ops2c.pl>) with the
same op content and order is a recipe for disaster. But as long as you
just run these tools in the standard build process via C<make> there
shouldn't be a problem.

=head1 TODO

The original design of the ops processing code was intended to be
a read-only representation of what was in a particular ops file. It was
not originally intended that it was a mechanism for building a bigger
virtual ops file from multiple physical ops files.

This code does half of that job (the other half is getting them to
compile together instead of separately in a F<*_ops.c> file).

You can see evidence of this by the way this code reaches in to the
internal C<OPS> hash key to do its concatenation, and the way it
twiddles each op's C<CODE> hash key after that.

If the op and oplib Perl modules are going to be used for modifying
information read from ops files in addition to reading it, they should
be changed to make the above operations explicitly supported.

Otherwise, the Parrot build and interpreter start-up logic should be
modified so that it doesn't need to concatenate separate ops files.

=head1 SEE ALSO

=over 4

=item F<tools/build/ops2c.pl>.

=item F<lib/Parrot/Ops2pm.pm>.

=item F<lib/Parrot/Ops2pm/Auxiliary.pm>.

=item F<tools/dev/ops_renum.mak>.

=back

=head1 AUTHOR

Over the years, F<tools/build/ops2pm.pl> has been worked on by the following Parrot hackers:

  bernhard
  brentdax
  chip
  chromatic
  coke
  dan
  gregor
  jkeenan
  leo
  mikescott
  particle
  paultcochrane
  petdance
  robert
  simon
  tewk

Others who provided code cited in the version control logs include:

  Andy Dougherty
  Jeff Gof
  Steve Fink

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
