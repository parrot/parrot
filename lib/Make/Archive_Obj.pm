package Make::Archive_Obj;
use Exporter;

use vars qw(@ISA @EXPORT_OK);
@ISA=qw(Make::Dependency);
@EXPORT_OK = qw(Archive);

my $program = "ar";
sub program { $program = shift; }

my @flags = ();
sub flags { @flags = @_ }

my @libraries = ();
sub libraries { @libraries = @_ }

my @library_paths = ();
sub library_paths { @library_paths = @_ }

sub Archive {
  my $class = 'Make::Archive_Obj';
  my %args = @_;
  unless(exists $args{input} and
         exists $args{dependsOn}) {
    my $target = "*** make.pl: Archive() called from line ".(caller(0))[2];
    unless(exists $args{input}) {
      print STDERR "$target had no input specified.\n";
    }
    unless(exists $args{dependsOn}) {
      print STDERR "$target had no dependsOn specified.\n";
    }
  }

  $args{dependsOn} = [$args{dependsOn}]
    unless ref($args{dependsOn}) eq 'ARRAY';
  $args{input} = [$args{input}]
    unless ref($args{input}) eq 'ARRAY';
  my $self = bless {
    local_flags => $args{flags} || undef,
    local_libraries => $args{libraries} || undef,
    local_library_paths => $args{library_paths} || undef,

    dependsOn => $args{dependsOn},
    input => $args{input},
    output => $args{output},
    type => 'Archive',
  }, $class;
  $self;
}

sub build {
  my ($self) = @_;
  my $return_val = undef;
  my $flags = $self->_flags_string();
#  my $libraries = $self->_library_string();
#  my $library_paths = $self->_library_path_string();

  # XXX Only run if under UNIX

  unless($^O =~ /Win/) {
    $return_val = { action =>
      "$program crs $flags -o $self->{output} ".join ' ',@{$self->{input}},
    };
  }
  return $return_val;
}

1;
