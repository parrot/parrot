package Make::Target_Obj;
use Exporter;

use vars qw(@ISA @EXPORT_OK);
@ISA=qw(Make::Dependency);
@EXPORT_OK = qw(Target);

sub Target {
  my $class = 'Make::Target_Obj';
  my %args = @_;
  unless(exists $args{input} and
         exists $args{dependsOn}) {
    my $target = "*** make.pl: Target() called from line ".(caller(0))[2];
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
    action => $args{action} || undef,
    dependsOn => $args{dependsOn},
    input => $args{input},
    output => '', # No real 'output' here, I think.
    type => 'Target',
  }, $class;
  $self;
}

sub build {
  my ($self) = @_;
  my $return_val = undef;

  if(defined $self->{action}) {
    $return_val = $self->{action}
  }

  $return_val;
}

1;
