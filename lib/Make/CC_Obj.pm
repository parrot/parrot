package Make::CC_Obj;
use Make::Dependency;
use Exporter;

use vars qw(@ISA @EXPORT_OK);
@ISA=("Make::Dependency",'Exporter');
@EXPORT_OK = qw(CC);

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

  { action => "cc -c $self->{input}",
  };
}

1;
