package Make::Link_Shared_Obj;
use Exporter;

use vars qw(@ISA @EXPORT_OK);
@ISA=qw(Make::Dependency);
@EXPORT_OK = qw(Link_Shared);

my $program = "cc";
sub program { $program = shift }

my @flags = ();
sub flags { @flags = @_ }

my @libraries = ();
sub libraries { @libraries = @_ }

my @library_paths = ();
sub library_paths { @library_paths = @_ }

sub Link_Shared {
  my $class = 'Make::Link_Shared_Obj';
  my %args = @_;
  unless(exists $args{input} and
         exists $args{dependsOn}) {
    my $target = "*** make.pl: Link_Shared() called from line ".(caller(0))[2];
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
    dependsOn => $args{dependsOn},
    input => $args{input},
    output => $args{output},
    type => 'Link_Shared',
  }, $class;
  $self;
}

sub build {
  my ($self) = @_;
  my $flags = $self->_flags_string();
  my $libraries = $self->_library_string();
  my $library_paths = $self->_library_path_string();

  { action =>
      "$program @flags -shared -o $self->{output} " .
        join ' ',@{$self->{input}},
  };
}

1;
