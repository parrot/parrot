package Make::Lint_Obj;
use Make::Dependency;
use Exporter;

use vars qw(@ISA @EXPORT_OK);
@ISA=("Make::Dependency",'Exporter');
@EXPORT_OK = qw(Lint);

my $program = 'lclint';
sub program { $program = shift }

my @flags = ();
sub flags { @flags = @_ }

sub Lint {
  my $class = 'Make::Lint_Obj';
  my %args = @_;
  unless(exists $args{input} and
         exists $args{dependsOn}) {
    my $target = "*** make.pl: Lint() called from line ".(caller(0))[2];
    unless(exists $args{input}) {
      print STDERR "$target had no input specified.\n";
    }
    unless(exists $args{dependsOn}) {
      print STDERR "$target had no dependsOn specified.\n";
    }
  }

  $args{dependsOn} = [$args{dependsOn}]
    unless ref($args{dependsOn}) eq 'ARRAY';
  my $self = bless {
    dependsOn => $args{dependsOn},
    input => $args{input},
    output => $args{output},
    commandLine => $args{commandLine} || undef,
    type => 'Lint',
  }, $class;
  $self;
}

sub build {
  my ($self) = @_;
  my $return_val;
  my $flags = $self->_flags_string();
  my $libraries = $self->_library_string();
  my $library_paths = $self->_library_path_string();

  if(defined $self->{commandLine}) {
    $return_val = {
      action => "$program $flags $self->{commandLine}",
    };
  }
  else {
    $return_val = {
      action => "$program $flags $self->{input}", # XXX May not work well.
    };
  }
  $return_val;
}

1;
