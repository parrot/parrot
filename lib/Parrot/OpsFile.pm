
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
  my ($class, @files) = @_;

  my $self = bless { PREAMBLE => '' }, $class;

  $self->read_ops($_) for @files;

  $self->{FILE}=~s/, $//;

  $self->{FILE}=~s/, $//;

  return $self;
}


#
# read_ops()
#

sub read_ops
{
  my ($self, $file) = @_;

  my $ops_file = "src/" . $file;

  open OPS, $file or die "Could not open ops file '$file' ($!)!";

  die "Parrot::OpFunc::init(): No file specified!\n" unless defined $file;

  $self->{FILE} .= $file.', ';

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
  my @argdirs;
  my $seen_pod;
  my $seen_op;
  my $line;
  my $flags;
  my @labels;

  while (<OPS>) {
    $seen_pod = 1 if m|^=|;

    unless ($seen_op or m|^(inline\s+)?op\s+|) {
      if (m/^\s*VERSION\s*=\s*"(\d+\.\d+\.\d+)"\s*;\s*$/) {
        if (exists $self->{VERSION}) {
          #die "VERSION MULTIPLY DEFINED!";
        }

        $self->version($1);

        $_ = '';
      }
      elsif (m/^\s*VERSION\s*=\s*PARROT_VERSION\s*;\s*$/) {
        if (exists $self->{VERSION}) {
          #die "VERSION MULTIPLY DEFINED!";
        }

        $self->version($PConfig{VERSION});

        $_ = '';
      }

      $self->{PREAMBLE} .= $_ unless $seen_pod or $count; # Lines up to first op def.
      next;
    }

    die "No 'VERSION = ...;' line found before beginning of ops in file '$orig'!\n"
      unless defined $self->version;

    #
    # Handle start-of-op:
    #
    # We create a new Parrot::Op instance based on the type, name and args.
    # We query the Parrot::Op for the op size, etc., which we use later.
    #
    # Either of these two forms work:
    #
    #   inline op  name (args) {
    #   op         name (args) {
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
    #   kc   Key constant index
    #

    if (/^(inline\s+)?op\s+([a-zA-Z]\w*)\s*\((.*)\)\s*(\S*)?\s*{/) {
      if ($seen_op) {
        die "$ops_file [$.]: Cannot define an op within an op definition!\n";
      }

      $type       = defined($1) ? 'inline' : 'function';
      $short_name = lc $2;
      $args       = trim(lc $3);
      $flags      = $4 ? trim(lc $4) : "";
      @args       = split(/\s*,\s*/, $args);
      @argdirs    = ();
      @labels     = ();
      $body       = '';
      $seen_op    = 1;
      $line	      = $.+1;

      my @temp = ();

      foreach my $arg (@args) {
	my ($use, $type) = $arg =~
	m/^(in|out|inout|inconst|invar|label|labelconst|labelvar)
	  \s+
	  (INT|NUM|STR|PMC|KEY|INTKEY)$/ix;

        die "Unrecognized arg format '$arg' in '$_'!" unless defined($use) and defined($type);

        if ($type =~ /^INTKEY$/i) {
          $type = "ki";
        }
        else {
          $type = lc substr($type, 0, 1);
        }
        # convert e.g. "labelvar" to "invar" and remember labels
	if ($use =~ /label(\w*)/) {
	  push @labels, 1;
	  $use = "in$1";
	}
	else {
	  push @labels, 0;
	}


        if ($use eq 'in') {
          push @temp, ($type eq 'p') ? 'p' : "$type|${type}c";
          push @argdirs, 'i';
        }
	elsif ($use eq 'invar') {
	  push @temp, $type;
	  push @argdirs, 'i';
	}
        elsif ($use eq 'inconst') {
	  die "Parrot::OpsFile: Arg format 'inconst PMC' is not allowed!"
		if $type eq 'p';
          push @temp, "${type}c";
          push @argdirs, 'i';
        }
        elsif ($use eq 'inout') {
          push @temp, $type;
          push @argdirs, 'io';
        }
        else {
          push @temp, $type;
          push @argdirs, 'o';
        }
      }

      @args = @temp;

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
      $count += $self->make_op($count, $type, $short_name, $body, \@args,
		\@argdirs, $line, $orig, \@labels, $flags);

      $seen_op = 0;

      next;
    }

    #
    # Accumulate the code into the op's body:
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

# Extends a string containing an or expression "0" .. "A" .. "A|B" etc.
sub or_flag
{
    my ($flag, $value) = @_;

    if($$flag eq '0'){
	$$flag = $value;
    }
    else {
	$$flag .= "|$value";
    }
}


#
# make_op()
#

sub make_op
{
  my ($self, $code, $type, $short_name, $body, $args, $argdirs,
            $line, $file, $labels, $flags) = @_;
  my $counter = 0;
  my $absolute = 0;
  my $branch = 0;
  my $pop = 0;
  my $next = 0;
  my $restart = 0;

  foreach my $variant (expand_args(@$args)) {
      my (@fixedargs)=split(/,/,$variant);
      my $op = Parrot::Op->new($code++, $type, $short_name,
        [ 'op', @fixedargs ], [ '', @$argdirs ], [0, @$labels], $flags);
      my $op_size = $op->size;
      my $jumps = "0";

      #
      # Macro substitutions:
      #
      # We convert the following notations:
      #
      #   .ops file          Op body  Meaning       Comment
      #   -----------------  -------  ------------  ----------------------------------
      #   goto OFFSET(X)     {{+=X}}  PC' = PC + X  Used for branches
      #   goto NEXT()        {{+=S}}  PC' = PC + S  Where S is op size
      #   goto ADDRESS(X)    {{=X}}   PC' = X       Used for absolute jumps
      #   goto POP()         {{=*}}   PC' = <pop>   Pop address off control stack
      #   expr OFFSET(X)     {{^+X}}  PC + X        Relative address
      #   expr NEXT()        {{^+S}}  PC + S        Where S is op size
      #   expr ADDRESS(X)    {{^X}}   X             Absolute address
      #   OP_SIZE            {{^S}}   S             op size
      #
      #   HALT()             {{=0}}   PC' = 0       Halts run_ops loop, no resume
      #
      #   restart OFFSET(X)  {{=0,+=X}}   PC' = 0       Restarts at PC + X
      #   restart NEXT()     {{=0,+=S}}   PC' = 0       Restarts at PC + S
      #
      #   $X                 {{@X}}   Argument X    $0 is opcode, $1 is first arg
      #
      # For ease of parsing, if the argument to one of the above
      # notations in a .ops file contains parentheses, then double the
      # enclosing parentheses and add a space around the argument,
      # like so:
      #
      #    goto OFFSET(( (void*)interpreter->happy_place ))
      #
      # Later transformations turn the Op body notations into C code, based
      # on the mode of operation (function calls, switch statements, gotos
      # with labels, etc.).
      #
      # TODO: Complain about using, e.g. $3 in an op with only 2 args.
      #

      $branch   ||= $body =~ s/\bgoto\s+OFFSET\(\( (.*?) \)\)/{{+=$1}}/mg;
      $absolute ||= $body =~ s/\bgoto\s+ADDRESS\(\( (.*?) \)\)/{{=$1}}/mg;
                    $body =~ s/\bexpr\s+OFFSET\(\( (.*?) \)\)/{{^+$1}}/mg;
                    $body =~ s/\bexpr\s+ADDRESS\(\( (.*?) \)\)/{{^$1}}/mg;
                    $body =~ s/\bOP_SIZE\b/{{^$op_size}}/mg;

      $branch   ||= $body =~ s/\bgoto\s+OFFSET\((.*?)\)/{{+=$1}}/mg;
                    $body =~ s/\bgoto\s+NEXT\(\)/{{+=$op_size}}/mg;
      $absolute ||= $body =~ s/\bgoto\s+ADDRESS\((.*?)\)/{{=$1}}/mg;
      $pop      ||= $body =~ s/\bgoto\s+POP\(\)/{{=*}}/mg;
                    $body =~ s/\bexpr\s+OFFSET\((.*?)\)/{{^+$1}}/mg;
      $next     ||= $body =~ s/\bexpr\s+NEXT\(\)/{{^+$op_size}}/mg;
                    $body =~ s/\bexpr\s+ADDRESS\((.*?)\)/{{^$1}}/mg;
                    $body =~ s/\bexpr\s+POP\(\)/{{^*}}/mg;

                    $body =~ s/\bHALT\(\)/{{=0}}/mg;
      $branch ||= $short_name =~ /runinterp/;
      $next   ||= $short_name =~ /runinterp/;

      if($body =~ s/\brestart\s+OFFSET\((.*?)\)/{{=0,+=$1}}/mg) {
 	$branch = 1;
	$restart = 1;
      }
      elsif($body =~ s/\brestart\s+NEXT\(\)/{{=0,+=$op_size}}/mg) {
	$restart = 1;
	$next = 1;
      }
      elsif($short_name eq 'branch_cs' || $short_name eq 'invoke') {
	$restart = 1;
      }
      elsif ($body =~ s/\brestart\s+ADDRESS\((.*?)\)/{{=$1}}/mg) {
	  $next = 0;
	  $restart = 1;
      }

      $body =~ s/\$(\d+)/{{\@$1}}/mg;

      if ($ENV{PARROT_NO_LINE}) {
        $op->body($body);
      } else {
        $op->body(qq{#line $line "$file"\n}.$body);
      }

      # Constants here are defined in include/parrot/op.h
      or_flag(\$jumps, "PARROT_JUMP_RELATIVE")   if ($branch);
      or_flag(\$jumps, "PARROT_JUMP_ADDRESS")    if ($absolute);
      or_flag(\$jumps, "PARROT_JUMP_POP")        if ($pop);
      or_flag(\$jumps, "PARROT_JUMP_ENEXT")      if ($next);
      # I'm assuming the op branches to the value in the last argument.
      or_flag(\$jumps, "PARROT_JUMP_GNEXT")      if (($jumps) && ($fixedargs[@fixedargs - 1]) && ($fixedargs[@fixedargs - 1] eq 'i'));
      or_flag(\$jumps, "PARROT_JUMP_RESTART")     if ($restart);

      $op->jump($jumps);

      $self->push_op($op);
      $counter++;
  }

  return $counter;
}


#
# expand_args()
#
# Given an arg list, return a list of all possible arg combinations.
#

sub expand_args
{
  my(@args)=@_;

  return "" if(!scalar(@args));

  my $arg = shift(@args);
  my @var = split(/\|/,$arg);

  if(!scalar(@args)) {
    return @var;
  }
  else {
    my @list = expand_args(@args);
    my @results;

    foreach my $l (@list) {
      foreach my $v (@var) {
        push(@results,"$v,$l");
      }
    }

    return @results;
  }
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
  my($self, $trans) = @_;

  local $_=$self->{PREAMBLE};

  if($trans) {
    s/goto\s+OFFSET\((.*)\)/{{+=$1}}/mg;
    #s/goto\s+NEXT\(\)/{{+=$op_size}}/mg;	#not supported--dependent on op size
    s/goto\s+ADDRESS\((.*)\)/{{=$1}}/mg;
    s/goto\s+POP\(\)/{{=*}}/mg;
    s/HALT\(\)/{{=0}}/mg;

    # FIXME: This ought to throw errors when attempting to rewrite $n
    # argument accesses and other things that make no sense in the
    # preamble.
    $_ = Parrot::Op->rewrite_body($_, $trans);
  }

  return $_;
}


#
# version()
#

sub version
{
  my $self = shift;

  if (@_ == 1) {
    $self->{VERSION} = shift;
  }
  elsif (@_ == 3) {
    $self->{VERSION} = join('.', @_);
  }
  elsif (@_ == 0) {
    if (wantarray) {
      return split(/\./, $self->{VERSION});
    }
    else {
      return $self->{VERSION};
    }
  }
  else {
    die "Parrot::OpsFile::version(): Illegal argument count" . scalar(@_) . "!";
  }
}


#
# major_version()
#

sub major_version
{
  my $self = shift;

  $self->{VERSION} =~ m/^(\d+)\./;

  return $1;
}


#
# minor_version()
#

sub minor_version
{
  my $self = shift;

  $self->{VERSION} =~ m/^\d+\.(\d+)\./;

  return $1;
}


#
# patch_version()
#

sub patch_version
{
  my $self = shift;

  $self->{VERSION} =~ m/^\d+\.\d+\.(\d+)/;

  return $1;
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

  inline op opname (...) {
   ... body of function ...
  }

for ops that have trivial bodies (such as just a call to some other
function and a C<return> statement).

The closing brace must be on its own line.

Alternately, for opcode functions that have more internal complexity:

  op opname (...) {
    ... body of function ...
  }

There may be more than one RETURN

The functions have the magic variables C<$1> to C<$>I<N> for arguments 1
through I<N>. (Argument 0 is the opcode number) Types for each, and the size
of the return offset, are determined from the opfunc signature.


=head1 AUTHORS

=head1 LICENSE

=head1 COPYRIGHT


