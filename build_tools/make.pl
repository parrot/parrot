#!/usr/bin/perl -w

use strict;
use FindBin;
use lib "$FindBin::Bin/lib";
use Make::Dependency qw(Object Executable);
use Make::CC_Obj qw(CC);
use Make::Link_Obj qw(Link);
use Make::Perl_Obj qw(Perl);
use Make::Target_Obj qw(Target);
use YAML qw(Store);

=head2 NAME

make.pl - Make replacement for Parrot.

=head2 SYNOPSIS

It was hoped that Parrot could get away from platform-dependent tools like gcc
and make, and rely solely on perl, or maybe even something like miniparrot. At
the moment, it relies heavily on several different varieties of make, each with
differing syntax and various subtleties, making it hard to write portable code.

Having make in perl means that we're no longer dependent on platforms where make
exists, don't have to deal with the vagaries of various implementations of make,
and and can work almost anywhere perl and a compiler can run. It'll also help
with portability of things such as platform-specific extensions and various
pathname issues.

=cut

#------------------------------------------------------------------------------

=item Object

Take a filename without the object extension (.o or .obj, commonly), and return
the filename with the proper extension for the platform. Unlike most of the
other Make targets, this doesn't return an object but a scalar.

=cut

=item Generic Notes

Excepting C<Object> and C<Executable>, all targets take a list of parameters
such as C<output>, C<input>, and C<dependsOn>. These parameters can either be
a scalar, another target, or a list of mixed scalars and targets. Generally a
scalar is assumed to be a filename, and targets are recursively evaluated.

Each target is recursively evaluated to see if its dependencies are satisfied.
The algorithm does this by going through the filenames and targets in the
C<dependsOn> parameter. Targets are resolved to their filename(s). All of the
filenames (whether real or evaluated) are checked. If any of the files do not
exist, it's assumed that a previous dependency creates it. If any of the files
are newer than the target, the target must be rebuilt.

=cut

=item Perl

Runs perl on the files in the C<input> parameter to form the file in the
C<output> parameter.

=cut

my $foo_c = Perl(
  output => 'foo.c',
  input => 'foo.ops',
  commandLine => 'makeTest.pl foo.ops > foo.c',
  dependsOn => ['foo.ops', 'makeTest.pl'],
);

=item CC

Compiles the files in the C<input> parameter to form the file in the C<output>
parameter. Note in this case that the C<Object> target takes its C<input>
parameter and adds the appropriate platform-specific extension (For Windows,
C<.obj>, for UNIX C<.o>), generating a platform-specific file name to build.

=cut

my $foo_o = CC(
  output => Object( input => 'foo' ),
  input => 'foo.c',     # foo.o: foo.c
  dependsOn => $foo_c,
);

my $bar_o = CC(
  output => Object( input => 'bar' ),
  input => 'bar.c',     # bar.o: bar.c
  dependsOn => 'bar.c', #   cc -c bar.c
);

=item Link

Takes the files in the C<input> parameter and links them to create the file in
C<output>. Several interesting things happen here. First is the C<Executable>
target, which handles platform-specific build issues for executable files.
More specifically, it attaches C<.exe> to builds on Windows and does nothing
for the other platforms.

Also, you'll notice that C<dependsOn> is a list of target objects. Each of these
gets evaluated to generate the instructions needed to build its file in turn.
Also, since they're not filenames, each target knows what filename it will
eventually end up being.

=cut

my $foo_exe = Link(
  output => Executable( input => 'foo' ),
  input => [ Object(input=>'foo'),
             Object(input=>'bar') ], # foo: foo.o bar.o
  dependsOn => [$foo_o, $bar_o],     #   cc -o foo foo.o bar.o
);

my $depends = {};

=item Target

What the user invokes when typing 'make foo'. C<foo> is a sample target, and
when it's made, the nested dependencies are evaluated and eventually the
proper executable is built.

=cut

$depends->{foo} = Target(
  input => 'foo',
  dependsOn => $foo_exe,
);

#------------------------------------------------------------------------------

my $target = shift(@ARGV);

Satisfy($target);

exit;

#------------------------------------------------------------------------------

=item Satisfy

Satisfy dependencies by generating a list of actions and execute them in order.
This simply generates a list of actions to be taken in a linear order, with no
notes on how many of these tasks can be executed in parallel. This needs to be
added before it will be a true make() replacement.

=cut

sub Satisfy {
  my ($target) = @_;
  my $actions = [];
  $depends->{$target}->satisfied($actions);

#  print Store($depends);

  for(@$actions) {
print "running $_->{action}\n";
    system $_->{action};
  }
}

#------------------------------------------------------------------------------
