package Make::CC_Obj;
use Make::Dependency;
use Exporter;

use vars qw(@ISA @EXPORT_OK);
@ISA=("Make::Dependency",'Exporter');
@EXPORT_OK = qw(CC);

my $program = $^O=~/Win/ ? 'cl' : 'cc';
sub program { $program = shift }

my @flags = ();
sub flags { @flags = @_ }

my @libraries = ();
sub libraries { @libraries = @_ }

my @library_paths = ();
sub library_paths { @library_paths = @_ }

sub CC {
  my $class = 'Make::CC_Obj';
  my %args = @_;
  unless(exists $args{input} and
         exists $args{dependsOn}) {
    my $target = "*** make.pl: CC() called from line ".(caller(0))[2];
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
    type => 'CC',
  }, $class;
  $self;
}

sub build {
  my ($self) = @_;
  my $flags = $self->_flags_string();
  my $libraries = $self->_library_string();
  my $library_paths = $self->_library_path_string();

  { action => "$program $flags $library_paths $libraries -c $self->{input}",
  };
}

1;
