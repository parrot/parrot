#!/usr/bin/perl -w

=head2 New Assembler

The Macro layer has now been added. Macro syntax has changed slightly, to
distinguish it from the regular syntax. All items that can be expanded, such
as macro invocations, constants, and formal arguments within macros, are
prefaced by '.'.

The macro layer implements constants, macros, and local labels. Including files
will be done later on, but this handles most of the basic needs we have for
macros.

To create a macro, the syntax is slightly different.

  .macro swap (A,B,TEMP) # . marks the directive
    set .TEMP,.A         # . marks the special variable.
    set .A,.B
    set .B,TEMP
  .endm                  # And . marks the end of the macro.

Macros support labels that are local to a given macro expansion, and the syntax
looks something like this:

  .macro SpinForever (Count)
    .local $LOOP: dec .COUNT # ".local $LOOP" defines a local label.
                  branch .$LOOP # Jump to said label.
  .endm

Include this macro as many times as you like, and the branch statement should
do the right thing every time. To use a global label, just as you usually do.

Constants are new, and the syntax looks like:

  .constant PerlHash 6 # Again, . marks the directive

  new P0, .PerlHash # . marks the special variable for expansion.

Several constants are predefined in the Macro class, but are not generated
dynamically as they should be, at least not yet.

  .constant Array 0
  .constant PerlUndef 1
  ...

This should be generated from include/parrot/pmc.h, but my plans are to add a
'.include' directive so we can '.include <constants.pmc>', and let pmc2c build
the .pmc file at the same time as it builds pmc.h.

When the Assembler class is separated out, tests can use the Assembler class to
accept a simple array of instructions and generate bytecode directly from that.
This should eliminate the intermediary .pasm file and speed things up.

=head2 NEWS

Keyed access. We now support the following (tested) code:

  new P0, 6 # Index of PerlHash. Clumsy, but necessary until the macro processor
            # layer is added.
  set S0, "one"
  set_keyed P0[S0],1
  get_keyed I0,P0[S0]
  print I0
  print "\n"
  end

Local labels. Not supported yet. The macro processor layer probably will do this
for us, once it's added.

=cut

#
# XXX Feel free to move this to an appropriate file when the necessary features
# XXX have been added, and features -will- need to be added.
#

package Macro;

=head2 Macro class

=item new

Create a new Macro instance. Simply take the argument list and treat it as a
list of files to concatenate and process. Files are taken in the order that
they appear in the argument list.

=cut

sub new {
  my $class = shift;
  my $self;
  #
  # Read the files, strip leading and trailing whitespace, and put the lines
  # into an array in $self->{contents}.
  #
  for(@_) {
    open FILE,"< $_" or
      die "Couldn't open '$_' for reading: $!\n";
    while(<FILE>) {
      chomp;
      s/(^\s+|\s+$)//g;
      push @{$self->{cur_contents}},$_;
    }
    close FILE;
  }

  #
  # XXX Must be generated from the enum in include/parrot/pmc.h
  #
  bless $self,$class;
  $self->{constants}{Array} = 0;
  $self->{constants}{PerlUndef} = 1;
  $self->{constants}{PerlInt} = 2;
  $self->{constants}{PerlNum} = 3;
  $self->{constants}{PerlString} = 4;
  $self->{constants}{PerlArray} = 5;
  $self->{constants}{PerlHash} = 6;
  $self->{constants}{ParrotPointer} = 7;
  $self->{constants}{IntQueue} = 8;
  $self;
}

=item _expand_macro

Take a macro name and argument list, and expand the macro inline.
Also, if the macro has embedded labels, expand these labels to local labels,
and make certain that they're unique on a per-expansion basis. We do this with
the C<$self->{macros}{$macro_name}{gensym}> value.

=cut

sub _expand_macro {
  my ($self,$macro_name,$macro_args) = @_;
  my %args;
  my @temp = @{$self->{macros}{$macro_name}{contents}};

  @args{@{$self->{macros}{$macro_name}{arguments}}} = @$macro_args;
  $self->{macros}{$macro_name}{gensym}++;

  for(@temp) {
    s{\.local\s+\$(\w+):}
     {local__${macro_name}__${1}__$self->{macros}{$macro_name}{gensym}:}gx;

    s{\.\$(\w+)}
     {local__${macro_name}__${1}__$self->{macros}{$macro_name}{gensym}}gx;
    s{\.(\w+)}
     {exists $self->{constants}{$1} ? $self->{constants}{$1} : ".$1"}gex;
    s{\.(\w+)}
     {exists $args{$1} ? $args{$1} : ".$1"}gex;
  }
  @temp;
}

=item preprocess

Preprocesses constants, macros, include statements, and eventually conditional
compilation. 

  .constant name {signed_integer}
  .constant name {signed_float}
  .constant name {"string constant"}
  .constant name {'string constant'}

    Are removed from the array. Given the line:

    '.constant HelloWorld "Hello, World!"'

    One can expand HelloWorld via:

    'print .HelloWorld' # Note the period to indicate a thing to expand.

    Some predefined constants exist for your convenience, namely:

      .Array
      .PerlHash
      .PerlArray
      and the other PMC types.

    This should be generated from include/parrot/pmc.h, but isn't at the moment.
    A .include should be added, but currently is awaiting more time and sleep.

  .include "{file name}" # Not quite ready.

  .macro name ({arguments?})
  ...
  .endm

    Optional arguments are simply identifiers separated by commas. These
    arguments are matched to instances inside the macro named '.foo'. A
    simple example follows:

  .macro inc3 (A,BLAM)
    inc .A # Mark the argument to expand with a '.'.
    inc .A
    inc .A
    print .BLAM
  .endm

  .inc3(I0) # Expands to the obvious ('inc I0\n') x 3

=cut

sub preprocess {
  my $self = shift;
  my $line = 0;
  my $in_macro;

  for(@{$self->{cur_contents}}) {
    $line++;

    #
    # Macros aren't recursive, so shuffle them into $self->{macros}.
    #
    if($in_macro) {
      if(/^\.endm/) {
        $in_macro = undef;
      }
      else {
        push @{$self->{macros}{$in_macro}{contents}},$_;
      }
      next;
    }

    if(/^\.constant \s+
        (\w+)       \s+
        ([-+]?\d+(\.\d+([eE][-+]?\d+)?)?)/x) { # .constant {name} {number}
      $self->{constants}{$1} = $2;
    }
    elsif(/^\.constant \s+
          (\w+)        \s+
          (\"(?:[^\\\"]*(?:\\.[^\\\"]*)*)\" |
           \'(?:[^\\\']*(?:\\.[^\\\']*)*)\'
          )/x) {                               # .constant {name} {string}
      $self->{constants}{$1} = $2;
    }
    elsif(/^\.include \s+
           "([^"]+)"
          /x) {                                # .include "{file}"
#      if(-e $1) {
#        open FOO,"< $1";
#        while(<FOO>) {
#          chomp;
#        }
#        close FOO;
#      }
#      else {
#        print STDERR "Couldn't open '$1' for inclusion at line $line: $!.\n";
#      }
    }
    elsif(/^\.macro \s+
           (\w+)   \s*
           \(([^)]*)\)
         /x) {            # .{name} (...
      if($in_macro) {
        push @{$self->{contents}},$_;
        print STDERR
          "Macro '$1' defined within macro '$in_macro' at line $line.\n";
      }
      else {
        $in_macro = $1;
        my @arguments = split /,/,$2;
        s/(^\s+|\s+$)//g for @arguments;
        $self->{macros}{$in_macro}{arguments} = \@arguments;
      }
    }
#
# XXX Need a definition of how a local label in global scope should work
#
#    elsif(/^\.local\s+\$(\w+)/) {
#      s{^\.local\s+\$(\w+)}
#       {"global.$1.$self->{global}{gensym}"}gex;
#      push @{$self->{contents}},$_;
#    }
    elsif(/^\.endm/) {
      $in_macro = undef;
      push @{$self->{contents}},$_;
      print STDERR "Macro termination outside macro at line $line.\n";
    }
#
# XXX Need a definition of how a local label in global scope should work
#
#    elsif(/\.\$(\w+)/) {
#      s{\.\$(\w+)}
#       {global.$1.$self->{global}{gensym}}gx;
#      push @{$self->{contents}},$_;
#    }
    elsif(/\.(\w+) \s*
           \(([^)]*)\)/x) {                    # .{name} (...
      if(defined $self->{macros}{$1}) {
        my @arguments = split /,/,$2;
        s/(^\s+|\s+$)//g for @arguments;
        push @{$self->{contents}},
             $self->_expand_macro($1,\@arguments);
      }
      else {
        push @{$self->{contents}},$_;
        print STDERR "Couldn't find macro '.$1' at line $line.\n";
      }
    }
    elsif(/\.(\w+)/) {                         # .{name}
      if(defined $self->{constants}{$1}) {
        push @{$self->{contents}},$_;
        $self->{contents}[-1] =~ s/\.(\w+)/$self->{constants}{$1}/g;
      }
      else {
        push @{$self->{contents}},$_;
        #
        # XXX If this should be reenabled, how do we best determine what
        # XXX a valid constant is?
        #
#        print STDERR "Couldn't find constant '.$1' at line $line\n";
      }
    }
    else {
      push @{$self->{contents}},$_;
    }
  }
}

=item contents

Access the C<$self->{contents}> internal array, where the post-processed data
is stored.

=cut

sub contents {
  my $self = shift;
  return $self->{contents};
}

1;

package Assembler;

use POSIX; # Needed for strtol()

use FindBin;
use lib "$FindBin::Bin/lib";
use Parrot::Types; # For pack_op()
use Parrot::OpLib::core;

use lib "$FindBin::Bin/lib/Parrot/blib/lib";
use lib "$FindBin::Bin/lib/Parrot/blib/arch/auto/Parrot/PakFile2";
use Parrot::PakFile2;

=head2 Assembler class

=item new

Create a new Assembler instance.

  To compile a list of files: 
    $compiler = Assembler->new(-files=>[qw(foo.pasm bar.pasm)]);

  To compile an array of instructions:
    $compiler = Assembler->new(-contents=>['set S0,"foo"','print S0','end']);

=cut

sub new {
  my $class = shift;
  my %args = @_;
  my $self = {
    contents          => [ ],
    num_constants     => 0,
    ordered_constants => [ ],
  };
  if(exists $args{-files}) {
    $self->{files} = $args{-files};
  }
  elsif(exists $args{-contents}) {
    for(@{$args{-contents}}) {
      _annotate_contents($self,$_);
    }
  }
  bless _init($self),$class;
}

=item _annotate_contents

Process the array C<$self->{contents}>, and make the appropriate annotations
in the array. For instance, it slightly munges global and local labels to make
sure the statements fall where they should. Also, annotates the array into an
AoA of [$statement,$lineno]. A later pass changes $lineno to $pc, once the
arguments have been appropriately analyzed.

=cut

sub _annotate_contents {
  my ($self,$line) = @_;

  $self->{pc}++;
  return if $line=~/^\s*$/ or $line=~/^\s*#/; # Filter out the comments and blank lines
  $line=~s/#[^'"]+$//;               # Remove trailing comments
  $line=~s/(^\s+|\s+$)//g;           # Remove leading and trailing whitespace
  #
  # Accumulate lines that only have labels until an instruction is found.
  # XXX This could fail if a label occurs at the end of a file.
  #
  if(@{$self->{contents}} and
     $self->{contents}[-1][0] =~ /:$/) {
    $self->{contents}[-1][0] .= $line;
  }
  else {
    push @{$self->{contents}},[$line,$self->{pc}];
  }
}

=item _init

Process files of assembly code, should they have been passed in. Also,
regardless of the input to C<new()>, take the arrays of operators and load
them into a form appropriate to parsing.

=cut

sub _init {
  my $self = shift;

  for(@$Parrot::OpLib::core::ops) {
    my $argtype = join '_',@{$_->{ARGS}}[1..$#{$_->{ARGS}}];
    $self->{fullops}->{$_->{NAME}.($argtype &&"_$argtype") } = $_->{CODE};
  }

  if(defined $self->{files}) {
    for my $file (@{$self->{files}}) {
      open FILE,"< $file" or
        die "Couldn't read from '$file': $!";
      while(<FILE>) {
        _annotate_contents($self,$_);
      }
      close FILE;
    }
  }
  $self;
}

=item _collect_labels

Collect labels, remove their definition, and save the appropriate line numbers.
Local labels aren't given special treatment yet.

=cut

sub _collect_labels {
  my $self = shift;

  my $label_re = qr([a-zA-Z0-9_]+);

  #
  # Collect label definition points first
  #
  for(@{$self->{contents}}) {
    #
    # If there's a local label, collect it
    #
    if($_->[0]=~s/^(\$$label_re)\s*:\s*,?//) {
      push @{$self->{local_labels}{$1}},$_->[1];
    }
    #
    # Same for a global label
    #
    elsif($_->[0]=~s/^($label_re)\s*:\s*,?//) {
      $self->{global_labels}{$1} = $_->[1];
    }
  }
}

=item _generate_bytecode

Start out by walking the C<$self->{contents}> array. On the first pass, make
sure that the operation requested exists. If it doesn't, yell on STDERR.
If it does, replace the text version of the operator with its numeric index,
and pack it into C<$self->{bytecode}>.

The inner loop walks through the arguments nested within the C<$op> arrayref,
determining what type the argument is (C<$_->[0]>), and packing in the
appropriate code. Note that labels are precalculated, and constants have been
packed into the appropriate areas.

=cut

sub _generate_bytecode {
  my $self = shift;

  for my $op (@{$self->{contents}}) {
    if(defined $self->{fullops}{$op->[0][0]}) {
      $op->[0][0] = $self->{fullops}{$op->[0][0]};

      $self->{bytecode} .= pack_op($op->[0][0]);

      for(@{$op->[0]}) {
        next unless ref($_) eq 'ARRAY'; # XXX Probably should loop smarter than this
        if ($_->[0] =~ /^[ispn]$/) {      # Register
          $_->[1] =~ /(\d+)/;
          $self->{bytecode} .= pack_op($1);
        }
        elsif ($_->[0] =~ /^([spn])c$/) { # String/num/PMC constant
          $self->{bytecode} .= pack_op($_->[1]);
        }
        elsif ($_->[0] eq "ic") {          # Integer constant
          $self->{bytecode} .= pack_op($_->[1]);
        }
        #
        # Not sure if this is actually used...
        #
        elsif ($_->[0] eq "r") {
          my %r_types = ("I" => 0, "N"=>1, "S"=>2, "P"=>3);
          $_->[1]=~/([PSNI])(\d+)/i;
          $self->{bytecode} .= pack_op($r_types{uc $1} >> 6 + $2);
        }
      }
    }
    else {
      print STDERR "Couldn't find operator '$op->[0][0]' on line $op->[1].\n";
    }
  }
}

=item adjust_labels

This works primarily on C<$self->{global_labels}>, computing offsets and getting
things ready for the final shift. Since the values of C<$self->{global_labels}>
correspond to line numbers, we replace the line numbers with program counter
indices.

The next pass walks the C<$self->{contents}> array, replacing the label names
with the difference between the current PC and the label PC. Label names are
preserved in the previous pass, which makes this possible.

=cut

sub _adjust_labels {
  my $self = shift;

  for(keys %{$self->{global_labels}}) { # XXX This probably can be moved
    $self->{global_labels}{$_} =        # XXX elsewhere.
      $self->{line_to_pc}{$self->{global_labels}{$_}};
  }

  for my $line (@{$self->{contents}}) {
    my $cur_pc = $self->{line_to_pc}{$line->[1]};
    for(@{$line->[0]}) {
      next unless ref($_) eq 'ARRAY'; # XXX Probably should loop smarter than this
      next unless $_->[0] eq 'label';
      $_->[0] = 'ic'; # Now is an integer constant.
      $_->[1] = $self->{global_labels}{$_->[1]} - $cur_pc;
    }
  }
}

=item _string_constant

Unescape special characters in the constant and add them to not one but two
data structures. C<$self->{constants}{s}> is for fast lookup when time comes
to substitute constants for their indices, and C<$self->{ordered_constants}>
keeps track of numeric and string constants in order of occurrence, so they
can be packed directly into the binary format.

=cut

sub _string_constant {
  my ($self,$constant) = @_;
  $constant=~s/\\n/\n/;
  $constant=~s/\\t/\t/;
  $constant=~s/\\\\/\\/;

  my $value = substr($constant,1,length($constant)-2);
  unless(defined $self->{constants}{s}{$value}) {
    $self->{constants}{s}{$value} = $self->{num_constants}++;
    push @{$self->{ordered_constants}},['S',$value];
  }
  return ['sc',$self->{constants}{s}{$value}];
}

=item _numeric_constant

Take the numeric constant and place it into both C<$self->{constants}{n}> and
C<$self->{ordered_constants}>. The first hash lets us do fast lookup when time
comes to replace a constant with its value. The second array maintains the
various string and numeric constants in order of first occurrence, and is ready
to pack into the bytecode.

=cut

sub _numeric_constant {
  my ($self,$constant) = @_;

  unless(defined $self->{constants}{n}{$constant}) {
    $self->{constants}{n}{$constant} = $self->{num_constants}++;
    push @{$self->{ordered_constants}},['N',$constant];
  }
  return ['nc',$self->{constants}{n}{$constant}];
}

=item to_bytecode

Take the content array ref and turn it into a ragged AoAoA of operations with
attached processed arguments. This is the core of the assembler.

  The transformation looks roughly like this:

  [ [ 'if I0,BLAH', 3],
    [ 'set P1[S5],P0["foo"]', 5],
    [ 'BLAH: end', 6],
  ]

  into:

  [ [ [ 'if_i_ic',
        ['i','I0'],
        ['label','BLAH'], # Leave the name here so we can resolve backward refs.
      ],
      3, # Line number
    ],
    [ [ 'set_p_s_p_sc',
        ['p','P1'],
        ['s','S5'],
        ['p','P0'],
        ['sc',0],    # String constant number 0
      ]
      5,
    ],
    [ [ 'end',
      ],
      6,
  ]

The first pass collects labels, so we can resolve forward label references
(That is, labels used before they're defined). References to labels aren't yet
expanded.

The second pass takes the arguments in each line (C<$_->[0]>) and breaks them
into their components. It does this by passing each line through a loop of REs
to break lines into each argument type. The individual REs break down the
arguments into an array ref C<[$type,$argument]>. Constants are collected and
replaced with indices, and the number of arguments is counted and added to the
internal PC tracking.

The third pass takes labels and replaces them with the PC offset to the actual
instruction, and generates bytecode. It returns the bytecode, and we're done.

=cut

sub to_bytecode {
  my $self = shift;

  my $reg_re = qr([INPS]\d+);
  my $bin_re = qr([-+]?0[bB][01]+);
  my $dec_re = qr([-+]?\d+);
  my $hex_re = qr([-+]?0[xX][0-9a-fA-F]+);
  my $flt_re = qr([-+]?\d+\.\d+([eE][-+]?\d+)?);
  my $str_re = qr(\"(?:[^\\\"]*(?:\\.[^\\\"]*)*)\" |
                  \'(?:[^\\\']*(?:\\.[^\\\']*)*)\'
                 )x;
  my $label_re = qr([a-zA-Z][a-zA-Z0-9_]*);
  my $pc = 0;

  $self->_collect_labels(); # Collect labels in a separate pass

  for(@{$self->{contents}}) {
    #
    # Collect the operator
    #
    my $temp = $_->[0];
    $temp=~s/^(\w+)\s*//;
    $_->[0] = [$1];

    while($temp ne '') {
      $temp=~s/^\s*(,\s*)?//;
      if($temp=~s/^#.*//) {
        # Skip flying comments.
      }
      elsif($temp=~s/^($reg_re)//) {
        $_->[0][0] .= "_".lc(substr($1,0,1));
        push @{$_->[0]}, [lc(substr($1,0,1)),$1];
      }
      elsif($temp=~s/^\[($reg_re)\]//) {
        $_->[0][0] .= "_".lc(substr($1,0,1));
        push @{$_->[0]}, [lc(substr($1,0,1)),$1];
      }
      elsif($temp=~s/^($flt_re)//) {
        $_->[0][0] .= "_nc";
        push @{$_->[0]}, $self->_numeric_constant($1);
      }
      elsif($temp=~s/^\[($str_re)\]//) {
        $_->[0][0] .= "_sc";
        push @{$_->[0]}, $self->_string_constant($1);
      }
      elsif($temp=~s/^($bin_re)//) {
        my $val = $1;$val=~s/0b//;
        $_->[0][0] .= "_ic";
        push @{$_->[0]}, ['ic',(strtol($val,2))[0]];
      }
      elsif($temp=~s/^($hex_re)//) {
        $_->[0][0] .= "_ic";
        push @{$_->[0]}, ['ic',(strtol($1,16))[0]];
      }
      elsif($temp=~s/^($dec_re)//) {
        $_->[0][0] .= "_ic";
        push @{$_->[0]}, ['ic',0+$1];
      }
      elsif($temp=~s/^($str_re)//) {
        $_->[0][0] .= "_sc";
        push @{$_->[0]}, $self->_string_constant($1);
      }
      elsif($temp=~s/^($label_re)//) {
        unless(defined $self->{global_labels}{$1}) {
          print STDERR "Couldn't find global label '$1' at line $_->[1].\n";
          last;
        }
        $_->[0][0] .= "_ic";
        push @{$_->[0]}, ['label',$1];
      }
      else {
        print STDERR "Couldn't parse argument '$temp' at line $_->[1].\n";
        last;
      }
    }
    $self->{line_to_pc}{$_->[1]}=$pc;
    $pc += scalar @{$_->[0]};
  }
  $self->_adjust_labels(); # XXX It's possible that these passes could be
  $self->_generate_bytecode(); # XXX merged, but I'm not going to worry about
                               # XXX it right now.

  return Parrot::PakFile2::output_bytecode({
    bytecode  => $self->{bytecode},
    constants => $self->{ordered_constants}
  });
}

package main;

use strict;

my %args;
my @files;

process_args(\%args,\@files);

my $macro = Macro->new(@files);

#
# Run the files through the preprocessor, and if -E flag encountered,
# stop right there.
#
$macro->preprocess();
if(exists $args{-E}) {
  print join "\n",@{$macro->contents()};
}

#
# Compile the files, and handle the output.
#
my $compiler = Assembler->new('-contents' => $macro->contents());
my $bytecode = $compiler->to_bytecode();

exit if exists $args{-c};
if(exists $args{-o}) {
  open FILE,">$args{-o}"
    or die "Could not write to '$args{-o}': $!";
  print FILE $bytecode;
  close FILE;
}
else {
  print $bytecode;
}

exit;

#------------------------------------------------------------------------------

=item process_args

Process the argument list and return the list of arguments and files to process.
Only legal and sane arguments and files should get past this point.

=cut

sub process_args {
  my ($args,$files) = @_;

  for (my $count = 0; $count < @ARGV; $count++) {
    my $arg = $ARGV[$count];

    if($arg =~ /^-(c|-checksyntax)$/) { $args->{-c} = 1; }
    elsif($arg =~ /^-E$/)             { $args->{-E} = 1; }
    elsif($arg =~ /^-(o|-output)$/)   { $args->{-o} = $ARGV[++$count]; }
    elsif($arg =~ /^-(h|-help)$/)     { Usage(); }
    else {
      push @$files,$arg;
    }
  }
  unless(@$files) {
    print STDERR "No files to process.\n";
    Usage();
  }
  for(@$files) {
    next if -e $_;
    print STDERR "File '$_' does not exist.\n";
    Usage();
  }
}

sub Usage {
  print <<"  _EOF_";
usage: $0 [options] file [file...]

    -h,--help       Print this message
    -o,--output     Write file 
    -c,-checksyntax Check syntax only, do not generate bytecode
  _EOF_
}
