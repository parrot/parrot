package Make::Perl_Obj;
use Make::Dependency;
use Exporter;

use vars qw(@ISA @EXPORT_OK);
@ISA=("Make::Dependency",'Exporter');
@EXPORT_OK = qw(Perl);

sub Perl {
  my $class = 'Make::Perl_Obj';
  my %args = @_;
  unless(exists $args{input} and
         exists $args{dependsOn}) {
    my $target = "*** make.pl: Perl() called from line ".(caller(0))[2];
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
    type => 'Perl',
  }, $class;
  $self;
}

sub build {
  my ($self) = @_;
  my $return_val;

  if(defined $self->{commandLine}) {
    $return_val = {
      action => "perl $self->{commandLine}",
    };
  }
  else {
    $return_val = {
      action => "perl $self->{input} > $self->{output}",
    };
  }
  $return_val;
}

1;
