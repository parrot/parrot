#! perl -w
#
# OpsFile.pm
#

use strict;

package Parrot::OpsFile;

use Parrot::Op;
use Parrot::Config;

BEGIN {
    use Exporter;
    use vars qw(%op_body @EXPORT @ISA);
    @ISA = qw(Exporter);
    @EXPORT = qw(%op_body);
};


#my %opcodes = Parrot::Opcode::read_ops();
#my %opcode;
#my $opcode;


#
# trim()
#
# Trim leading and trailing spaces.
#

sub trim
{
  my $value = shift;
  $value =~ s/^\s+//;
  $value =~ s/\s+$//;
  return $value;
}


#
# new()
#
# Reads in an .ops file, gathering information about the ops.
#

sub new
{
  my ($class, $file) = @_;

  my $self = bless { PREAMBLE => '' }, $class;

  $self->read_ops($file);

  return $self;
}


#
# read_ops()
#

sub read_ops
{
  my ($self, $file) = @_;

  open OPS, $file or die "Could not open ops file '$file' ($!)!";

  die "Parrot::OpFunc::init(): No file specified!\n" unless defined $file;

  $self->{FILE} = $file;

  my $orig = $file;
  open OPS, $file or die "Can't open $file, $!/$^E";
  if (! ($file =~ s/\.ops$/.c/)) {
      $file .= ".c";
  }

  #
  # Read through the file, creating and storing Parrot::Op objects:
  #

  my $count = 0;

  my ($name, $footer);
  
  my $type;
  my $body;
  my $short_name;
  my $args;
  my @args;
  my $seen_pod;
  my $seen_op;

  while (<OPS>) {
    $seen_pod = 1 if m|^=|;

    unless ($seen_op or m|^AUTO_OP\s+| or m|^MANUAL_OP\s+|) {
      $self->{PREAMBLE} .= $_ unless $seen_pod or $count; # Lines up to first op def.
      next;
    };
  
    #
    # Handle start-of-op:
    #
    # We create a new Parrot::Op instance based on the type, name and args.
    # We query the Parrot::Op for the op size, etc., which we use later.
    #
    # Either of these two forms work:
    #
    #   AUTO_OP   name (args) {
    #   MANUAL_OP name (args) {
    #
    # The args are a comma-separated list of items from this table of argument
    # types (even if no formal args are specified, there will be a single 'o'
    # entry):
    #
    #   op   The opcode
    #
    #   i    Integer register index
    #   n    Number register index
    #   p    PMC register index
    #   s    String register index
    #
    #   ic   Integer constant (in-line)
    #   nc   Number constant index
    #   pc   PMC constant index
    #   sc   String constant index
    #

    if (/^(AUTO|MANUAL)_OP\s+([a-zA-Z][a-zA-Z0-9]*)\s*\((.*)\)\s*{/) {
      if ($seen_op) {
        die "Parrot::OpsFile: Cannot define an op within an op definition!\n";
      }

      $type       = lc $1;
      $short_name = lc $2;
      $args       = trim(lc $3);
      @args       = split(/\s*,\s*/, $args);
      $body       = '';
      $seen_op    = 1;

      next;
    }

    #
    # Handle end-of-op:
    #
    # We stash the accumulated body of source code in the Parrot::Op, push the
    # Parrot::Op onto our op array, and forget the op so we can start the next
    # one.
    #

    if (/^}\s*$/) {
      $count += $self->make_op($count, $type, $short_name, $body, @args);

      $seen_op = 0;

      next;
    }
  
    #
    # Accummulate the code into the op's body:
    #

    if ($seen_op) {
      $body .= $_;
    } else {
      die "Parrot::OpsFile: Unrecognized line: '$_'!\n";
    }
  }

  if ($seen_op) {
    die "Parrot::OpsFile: File ended with incomplete op definition!\n";
  }

  close OPS or die "Could not close ops file '$file' ($!)!";

  return;
}


#
# make_op()
#

sub make_op
{
  my ($self, $code, $type, $short_name, $body, @args) = @_;
  my @fixedargs;

  while (@args) {
    my $arg = shift @args;
    if ($arg =~ /\|/) {
      my $count = 0;
      foreach my $variant (split(/\s*\|\s*/, $arg)) {
        $count += $self->make_op($code + $count, $type, $short_name, $body,
        			 @fixedargs, $variant, @args);
      }
      return $count;
    }
    else {
      push @fixedargs, $arg;
    }
  }

  my $op = Parrot::Op->new($code, $type, $short_name, 'op', @fixedargs);
  my $op_size = $op->size;

  #
    # Macro substitutions:
    #
    # We convert the following notations:
    #
    #   .ops file   Op body  Meaning       Comment
    #   ----------  -------  ------------  -----------------------------------
    #   HALT        {{=0}}   PC' = 0       Halts run_ops loop, no resume
    #   RESTART(X)  {{=0}}   PC' = 0       Restarts at PC + X
    #   RESTART(*)  {{=0}}   PC' = 0       Restarts at PC + S
    #   RETREL(X)   {{+=X}}  PC' = PC + X  Used for branches
    #   RETREL(*)   {{+=S}}  PC' = PC + S  Where S is op size; for auto ops
    #   RETABS(X)   {{=X}}   PC' = X       Used for absolute jumps
    #   $X          {{@X}}   Argument X    $0 is opcode, $1 is first arg
    #
    # Later transformations turn the Op body notations into C code, based
    # on the mode of operation (function calls, switch statements, gotos
    # with labels, etc.).
    #
    # TODO: Complain about using, e.g. $3 in an op with only 2 args.
    #

  $body =~ s/HALT/{{=0}}/mg;

  $body =~ s/RESTART\(\*\)/{{=0,+=$op_size}}/mg;
  $body =~ s/RESTART\((.*)\)/{{=0,+=$1}}/mg;

  $body =~ s/RETREL\(\*\)/{{+=$op_size}}/mg;
  $body =~ s/RETREL\((.*)\)/{{+=$1}}/mg;

  $body =~ s/RETABS\((.*)\)/{{=$1}}/mg;

  $body =~ s/\$(\d+)/{{\@$1}}/mg;

  $op->body($body);
  
  $self->push_op($op);

  return 1;
}


#
# ops()
#

sub ops
{
  my ($self) = @_;

  return @{$self->{OPS}};
}


#
# op()
#

sub op
{
  my ($self, $index) = @_;

  return $self->{OPS}[$index];
}


#
# preamble()
#

sub preamble
{
  my $self = shift;

  return $self->{PREAMBLE};
}


#
# push_op()
#

sub push_op
{
  my ($self, $op) = @_;

  push @{$self->{OPS}}, $op;
}


1;

=head1 NAME

Parrot::OpsFile

=head1 SYNOPSIS

  use Parrot::OpsFile;

=head1 DESCRIPTION

Take a file of opcode functions and create real C code for them

opcode functions are in the format:

 AUTO_OP opname {

  ... body of function ...

 }

Where the closing brace is on its own line. Alternately, for opcode
functions that manage their own return values:

MANUAL_OP opname {

   ... body of function ...

   RETURN(x);

}

There may be more than one RETURN

The functions have the magic variables Pnnn for parameters 1 through
X. (Parameter 0 is the opcode number) Types for each, and the size
of the return offset, are taken from the opcode_table file


=head1 AUTHORS

=head1 LICENSE

=head1 COPYRIGHT


