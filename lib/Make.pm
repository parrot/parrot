package Make;

use Exporter;

use vars qw(@ISA @EXPORT $AppVersion);
@ISA = qw(Exporter);
@EXPORT = qw(
  Executable Object Shared_Object

  Build

  Archive CC Link Link_Shared Perl Target
);

=head1 NAME

Make.pm - Main make module for Parrot

=head1 SYNOPSIS

Cross-platform make for Parrot.

=cut

#------------------------------------------------------------------------------

sub DEBUG { 1 }

#------------------------------------------------------------------------------

my %programs;
my %extensions;
my %depends;

my @C_FLAGS;
my @LD_FLAGS;

my @C_LIBS; # XXX May not be used in the final

=head2 Platform-dependent variables

Platform-dependent variables and extensions go here. For instance, the extension
for executables varies widely between Windows and UNIX. UNIX doesn't use any
extension, Windows uses B<.exe>. Differences like these are encapsulated in
the C<%extensions> hash. Programs that differ from platform-to-platform are
stored in C<%programs>. This may end up being configured from L<Configure.pl>.

=cut

BEGIN {
  if($^O =~ /Win/) {
  }
  else {
    $extensions{executable} = '';
    $extensions{object} = '.o';
    $extensions{shared_object} = '.so';

    $programs{archive} = 'ar crs';
    $programs{cc} = 'cc';
    $programs{perl} = 'perl';
    $programs{link} = 'cc';
    $programs{link_shared} = 'cc';
  }
};

#------------------------------------------------------------------------------

sub c_flags { @C_FLAGS = @_ }
sub ld_flags { @LD_FLAGS = @_ }

sub c_libs { @C_LIBS = @_ }

#------------------------------------------------------------------------------

#
# An internal asssertion used to make sure that the public functions have
# all of the parameters they're supposed to.
#

sub _assert {
  my ($func_name,$argument,%args) = @_;
  my $target = "*** make.pl: $func_name() called from line ".(caller(1))[2];
  $argument = [$argument] unless ref($argument) eq 'ARRAY';
  for(@$argument) {
    next if exists $args{$_};
    print STDERR "$target had no '$_' specified.\n";
    return undef;
  }
  1;
}

#------------------------------------------------------------------------------

=head2 Filename portability

These functions isolate the makefile from needing to know what extension a file
needs to have. For instance, object files are used to create an executable.
Ordinarily, a long list of objects would be declared in a makefile like
C<classes/perlarray$(O) classes/perlhash$(O)>.

Instead, all of these functions accept either a single input filename or an
array of filenames. So, the above makefile would look more like:

  $class_objects = Object(input => [qw(classes/perlarray classes/perlhash)]);

=cut

=over

=item Executable(input=>'parrot')

Given the name of an executable (with no extensions), returns the executable's
name along with the appropriate extension. This is not an object, merely a
function returning a string.

The input can also be an array of executables, to help

=cut

sub Executable {
  my %args = @_;
  _assert('Executable','input',%args) or return;

  if(ref($args{input}) eq 'ARRAY') {
    return map { $_.$extensions{executable} } @{$args{input}};
  }
  return $args{input} . $extensions{executable};
}

=item Object(input=>'test_main')

Given the name of an object file (with no extension), return the object's
full name along with the appropriate extension. Also operates on array of
file names.

=cut

sub Object {
  my %args = @_;
  _assert('Object','input',%args) or return;

  if(ref($args{input}) eq 'ARRAY') {
    return map { $_.$extensions{object} } @{$args{input}}
  }
  return $args{input} . $extensions{object};
}

=item Shared_Object(input=>'test_main')

Given the name of an shared object file (with no extension), return the object's
full name along with the appropriate extension.

=cut

sub Shared_Object {
  my %args = @_;
  _assert('Shared_Object','input',%args) or return;

  if(ref($args{input}) eq 'ARRAY') {
      return map { $_.$extensions{shared_object}.".$AppVersion" }
                 @{$args{input}};
  }
  return $args{input} . $extensions{shared_object} . ".$AppVersion";
}

#------------------------------------------------------------------------------

#
# Private "member" function.
# This is currently the heart of the system. Each "object" uses this function
# to determine whether the current object has had its dependencies satisfied.
#
# It simply walks the diagram of dependencies, building a list of actions that
# will be executed later on.
#

sub _satisfied {
  my $self = shift;
  my $actions = shift;
  my $satisfied = 1;

  for(@{$self->{dependsOn}}) {
    next unless defined $_;
    if(defined $_->{satisfied}) {
      $satisfied = undef unless $_->{satisfied}->($_,$actions);
      if(-e $self->{output} and -e $_->{output}) {
        print "Testing $self->{output} vs $_->{output}\n" if DEBUG;
        $satisfied = undef unless -C $self->{output} <= -C $_->{output};
      }
    }
    else {
      print -e $_ ? "$_ exists\n" :
                    "$_ doesn't exist\n" if DEBUG;
      print -e $self->{output} ? "$self->{output} exists\n" :
                                 "$self->{output} doesn't exist\n" if DEBUG;
      if(-e $_ and -e $self->{output}) {
        print -C $self->{output} < -C $_ ? "After\n" : "Before\n" if DEBUG;
      }
      $satisfied = undef
        unless -e $_ and
               -e $self->{output} and
               (-C $self->{output} < -C $_);
    }
  }
  unless($satisfied) {
    my $action = $self->{build}->($self);
    push @$actions,$action if defined $action;
  }
  return $satisfied;
}

sub Build {
  my $target = shift;
  my $actions = [];
  $target = '_default' unless defined $target;

  $depends{$target}->{satisfied}->($depends{$target},$actions);

  for(@$actions) {
print "$_->{action}\n";
    system $_->{action};
  }
}

#------------------------------------------------------------------------------

sub _build_object {
  my ($func_name,%args) = @_;
  $args{dependsOn} = [$args{dependsOn}]
    unless ref($args{dependsOn}) eq 'ARRAY';
  return {
    type => $func_name,
    satisfied => \&_satisfied,
    input => $args{input} || undef,
    output => $args{output} || undef,
    dependsOn => $args{dependsOn} || undef,
  };
}

#------------------------------------------------------------------------------

sub Archive {
  my %args = @_;
  my $func_name = 'Archive';

  _assert($func_name,['input','dependsOn','output'],%args) or return;

  my $object = _build_object($func_name,%args);
  $object->{build} = sub {
    my ($self) = @_;
    my $flags = (join ' ',@C_FLAGS,@LD_FLAGS) .
                join ' ', grep { defined $_ } @{$args{flags}};
    my ($library_paths,$libraries)=('','');

    return {
      action =>
        "$programs{archive} $flags $library_paths $libraries -c $self->{input}",
    };
  };
  $object->{commandLine} = $args{commandLine}
    if exists $args{commandLine};
  return $object;
}

sub CC {
  my %args = @_;
  my $func_name = 'CC';

  _assert($func_name,['input','dependsOn','output'],%args) or return;

  my $object = _build_object($func_name,%args);
  $object->{build} = sub {
    my ($self) = @_;
    my $flags = (join ' ',@C_FLAGS) .
                join ' ', grep { defined $_ } @{$args{flags}};
    my $include_paths = join ' ', grep { defined $_ } @{$args{include_paths}};

    return {
      action =>
        "$programs{cc} $flags $include_paths -c $self->{input}",
    };
  };
  $object->{commandLine} = $args{commandLine}
    if exists $args{commandLine};
  return $object;
}

sub Link {
  my %args = @_;
  my $func_name = 'Link';

  _assert($func_name,['input','dependsOn','output'],%args) or return;

  my $object = _build_object($func_name,%args);
  $object->{build} = sub {
    my ($self) = @_;
    my $flags = (join ' ',@LD_FLAGS) .
                join ' ', grep { defined $_ } @{$args{flags}};
    my $libraries = "@C_LIBS" .
                    join ' ', grep { defined $_ } @{$args{libraries}};
    my ($library_paths) = '';

    return {
      action =>
        "$programs{link} $flags $library_paths $libraries -o $self->{output} ".
        join ' ', map { ref($_) eq 'HASH' ? $_->{output} : $_ }
                  grep { defined $_ }
                  @{$self->{input}},
    };
  };
  return $object;
}

sub Link_Shared {
  my %args = @_;
  my $func_name = 'Link_Shared';

  _assert($func_name,['input','dependsOn','output'],%args) or return;

  my $object = _build_object($func_name,%args);
  $object->{build} = sub {
    my ($self) = @_;
    my $flags = (join ' ',@C_FLAGS,@LD_FLAGS) .
                join ' ', grep { defined $_ } @{$args{flags}};
    my ($library_paths,$libraries)=('','');

    return {
      action =>
        "$programs{link_shared} $flags -shared $library_paths $libraries -o $self->{output} ".
        join ' ', map { ref($_) eq 'HASH' ? $_->{output} : $_ }
                  grep { defined $_ }
                  @{$self->{input}},
    };
  };
  return $object;
}

sub Perl {
  my %args = @_;
  my $func_name = 'Perl';

  _assert($func_name,['input','dependsOn','output'],%args) or return;

  my $object = _build_object($func_name,%args);
  $object->{build} = sub {
    my ($self) = @_;
    my $return_val;

    if(defined $self->{commandLine}) {
      $return_val = {
        action => "$programs{perl} $self->{commandLine}",
      };
    }
    else {
      $return_val = {
        action => "$programs{perl} $self->{input} > $self->{output}",
      };
    }

    return $return_val;
  };
  $object->{commandLine} = $args{commandLine}
    if exists $args{commandLine};
  return $object;
}

sub Target {
  my %args = @_;
  my $func_name = 'Target';

  _assert($func_name,['input','dependsOn'],%args) or return;

  $depends{$args{input}} = _build_object($func_name,%args);
  $depends{$args{input}}{build} = sub {
    my ($self) = @_;
    my $return_val = undef;

    if(defined $self->{action}) {
      $return_val = $self->{action}
    }

    return $return_val;
  };
  $depends{$args{input}}{action} =
    $args->{action} if exists $args{action};
  return $depends{$args{input}}; # XXX May want a better interface to this
}

#------------------------------------------------------------------------------

=back

=cut

1;
