#!/usr/bin/perl -w

=head2 Parrot Assembler

The Parrot Assembler's job is to take .pasm (Parrot Assembly) files and assemble
them into Parrot bytecode. Plenty of references for Parrot assembly syntax
already exist, so we won't go into details there. The assembler does its job
by reading a .pasm file, extracting numeric and string constants from it, and
reassembling the bits into bytecode.

The first pass goes through and expands constants, macros, and local labels.
Syntax is described later on, in the 'Macro' section. The next pass goes through
and collects the numeric and string constants along with the definition points
and PCs of labels.

If you would like to view the text after the macro expansion pass, use the C<-E>
flag. This flag simply tells the assembler to quit after the C<Macro> class
does it thing. 

The final pass replaces label occurrences with the appropriate PC offset and
accumulates the (finally completely numeric) bytecode onto the output string.
The XS portion takes the constants and bytecode, generates a header, tacks the
constants and bytecode on, and finally prints out the string.

=head1 Macro

The Parrot assebler's macro layer has now been more-or-less defined, with one
or two additions to come. The addition of the '.' preface will hopefully make
things easier to parse, inasmuch as everything within an assembler file that
needs to be expanded or processed by the macro engine will have a period ('.')
prepended to it.

The macro layer implements constants, macros, and local labels. Including files
will be done later on, but this handles most of the basic needs we have for
macros.

To create a macro, the syntax is slightly different.

  .macro swap (A,B,TEMP) # . marks the directive
    set .TEMP,.A         # . marks the special variable.
    set .A,.B
    set .B,.TEMP
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

=head2 Keyed access

 We now support the following (tested) code:

  new P0, .PerlHash    # (See the discussion of macros above)
  set S0, "one"
  set P0[S0],1
  set I0,P0[S0]
  print I0
  print "\n"
  end

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
  $self->{constants}{Pointer} = 7;
  $self->{constants}{IntQueue} = 8;
  $self->{constants}{Sub} = 9;
  $self->{constants}{Coroutine} = 10;
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
  my $label_re = qr([a-zA-Z_][a-zA-Z0-9_]*);

  @args{@{$self->{macros}{$macro_name}{arguments}}} = @$macro_args;
  $self->{macros}{$macro_name}{gensym}++;

  for(@temp) {
    s{\.local\s+\$($label_re):}
     {local__${macro_name}__${1}__$self->{macros}{$macro_name}{gensym}:}gx;

    s{\.\$($label_re)}
     {local__${macro_name}__${1}__$self->{macros}{$macro_name}{gensym}}gx;
    s{\.($label_re)}
     {exists $self->{constants}{$1} ? $self->{constants}{$1} : ".$1"}gex;
    s{\.($label_re)}
     {exists $args{$1} ? $args{$1} : ".$1"}gex;
  }
  @temp;
}

=item preprocess

Preprocesses constants, macros, include statements, and eventually conditional
compilation. 

  .constant name {register}
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
  my $label_re = qr([a-zA-Z_][a-zA-Z0-9_]*);
  my $reg_re   = qr([INSP]\d+);
  my $num_re   = qr([-+]?\d+(\.\d+([eE][-+]?\d+)?)?);

  my @todo=@{$self->{cur_contents}};
  while(scalar(@todo)) {
    $_=shift(@todo);
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
        ($label_re) \s+
        ([INSP]\d+)/x) { # .constant {name} {register}
      $self->{constants}{$1} = $2;
    }
    elsif(/^\.constant \s+
        ($label_re) \s+
        ($num_re)/x) { # .constant {name} {number}
      $self->{constants}{$1} = $2;
    }
    elsif(/^\.constant \s+
          ($label_re)  \s+
          (\"(?:[^\\\"]*(?:\\.[^\\\"]*)*)\" |
           \'(?:[^\\\']*(?:\\.[^\\\']*)*)\'
          )/x) {                               # .constant {name} {string}
      $self->{constants}{$1} = $2;
    }
    elsif(/^\.include \s+
           "([^"]+)"
          /x) {                                # .include "{file}"
      if(-e $1) {
        open FOO,"< $1";
        my @include;
        while(<FOO>) {
          chomp;
          push(@include,$_);
        }
        unshift(@todo,@include);
        close FOO;
      }
      else {
        print STDERR "Couldn't open '$1' for inclusion at line $line: $!.\n";
      }
    }
    elsif(/^\.macro    \s+
           ($label_re) \s*
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
    elsif(/\.($label_re) \s*
           \(([^)]*)\)/x) {                    # .{name} (...
      if(defined $self->{macros}{$1}) {
        my $macro_name = $1;
        my $arguments = $2;
        $arguments =~ s{\.(\w+)}
                       {defined $self->{constants}{$1} ?
                          $self->{constants}{$1} : ".$1"}egx;
        my @arguments = split /,/,$arguments;
        s/(^\s+|\s+$)//g for @arguments;
        push @{$self->{contents}},
             $self->_expand_macro($macro_name,\@arguments);
      }
      else {
        push @{$self->{contents}},$_;
        print STDERR "Couldn't find macro '.$1' at line $line.\n";
      }
    }
    elsif(/\.($label_re)/) {                         # .{name}
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
use Parrot::Config;

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
  my $str_re = qr(\"(?:[^\\\"]*(?:\\.[^\\\"]*)*)\" |
                  \'(?:[^\\\']*(?:\\.[^\\\']*)*)\'
                 )x;

  $self->{pc}++;
  return if $line=~/^\s*$/ or $line=~/^\s*#/; # Filter out the comments and blank lines
  $line=~s/^((?:[^'"]+|$str_re)*)#.*$/$1/; # Remove trailing comments
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

  my $label_re = qr([a-zA-Z_][a-zA-Z0-9_]*);

  #
  # Collect label definition points first
  #
  for(@{$self->{contents}}) {
    while($_->[0] =~ s/^(\$?$label_re)\s*:\s*,?//) {
      my $label = $1;
      if($label=~/^\$/) {
        push @{$self->{local_labels}{$1}},$_->[1]; # Local label
      }
      else {
        $self->{global_labels}{$1} = $_->[1]; # Global label
      }
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
  local $_=substr($constant,0,1);
  $constant =~ s/\$/\\\$/g;
  $constant = $_ . eval("qq$constant") . $_;
  warn "Constant: $@ " if $@;

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

=item _to_keyed

Convert the operator to a keyed operator. Admittedly it's not much of a
transformation, but it's a way to mark the code.

=cut

sub _to_keyed {
  my $operator = shift;
  return if $operator->[0][0] =~ /^[a-zA-Z]+_keyed/;
  $operator->[0][0] =~ s/^([a-zA-Z]+)/${1}_keyed/;
}

=item _to_keyed_integer

Convert the operator to a keyed operator

=cut

sub _to_keyed_integer {
  my $operator = shift;
  return if $operator->[0][0] =~ /^[a-zA-Z]+_keyed_integer/;
  $operator->[0][0] =~ s/^([a-zA-Z]+)/${1}_keyed_integer/;
}

=item constant_table

Constant table returns a hash with the length in bytes of the constant table 
and the constant table packed.

=cut

sub constant_table {
    my $self = shift;

    # $constl = the length in bytes of the constant table 
    my ($constl, $wordsize);
    my $const = "";

    $constl = $wordsize = $PConfig{'opcode_t_size'};
    my $packtype = $PConfig{'packtype_op'};
    
    for(@{$self->{constants}}) {
        # if it's a string constant.
        if ($_->[0] eq 'S') {
            # Length of the string in bytes.
            my $slen = length($_->[1]);
            # The number of bytes to fill in the last opcode_t holding the string constant.
            my $fill = ($slen % $wordsize) ? $wordsize - $slen % $wordsize : 0;
            # Length of the whole constant.
            $constl += 6 * $wordsize + $slen + $fill;
            # Constant type, S
            $const .= pack($packtype,0x73);
            # The size of the Parrot string.
            $const .= pack($packtype, 3 * $wordsize + $slen + $fill + $wordsize);
            # Flags
            $const .= pack($packtype,0x0);
            # Encoding
            $const .= pack($packtype,0x0);
            # Type
            $const .= pack($packtype,0x0);
            # Length of string alone in bytes
            $const .= pack($packtype,$slen);
            # The string it self.
            $const .= $_->[1] . "\0" x $fill;
        }
        # if it's a float constant.
        elsif ($_->[0] eq 'N') {
            # The size of the whole constant.
            $constl += 2 * $wordsize + $PConfig{numvalsize}; 
            # Constant type, N
            $const .= pack($packtype,0x6e);
            # Sizeof the Parrot floatval.
            $const .= pack($packtype,$PConfig{numvalsize});
            # The number if self.
            $const .= pack($PConfig{'packtype_n'},$_->[1]);
        }
    }

    return ('table' => $const,
            'length' => $constl);
}
 
    
=item output_bytecode

Returns a string with the Packfile. 

First process the constants and generate the constant table to be able to make 
the packfile header, then return all.

=cut

sub output_bytecode {
    my $self = shift;
    my $wordsize;

    $wordsize = $PConfig{'opcode_t_size'};
    my $packtype = $PConfig{'packtype_op'};
    
    my %const_table = constant_table($self);

    my $byteorder = (substr($PConfig{'byteorder'},0,1) == 1) ? 0 : 1;

    my $packfile_header = {
        wordsize    => $wordsize, # unsigned char wordsize
        byteorder   => $byteorder, # unsigned char byteorder
        major       => 0x00, # unsigned char major
        minor       => 0x00, # unsigned char minor

        flags       => 0x00, # unsigned char flags
        floattype   => 0x00, # unsigned char floattype
        pad         => [
            0x19, # unsigned char pad[0]
            0x40, # unsigned char pad[1]

            0xe4, # unsigned char pad[2]
            0x73, # unsigned char pad[3]
            0x09, # unsigned char pad[4]
            0x08, # unsigned char pad[5]

            0x00, # unsigned char pad[6]
            0x00, # unsigned char pad[7]
            0x00, # unsigned char pad[8]
            0x00  # unsigned char pad[9]
        ],

        magic       => 0x0131_55a1, # opcode_t magic
        opcodetype  => 0x5045_524c, # opcode_t opcodetype
        fixup_ss    => 0x0000_0000, # opcode_t fixup_ss
        const_ss    => $const_table{'length'}, # opcode_t const_ss
        bytecode_ss => $self->{num_constants}, # opcode_t bytecode_ss
    };

    my $packfile_string = "CCCCCC".("C"x10).$packtype x5;

    return pack($packfile_string,
        $packfile_header->{wordsize},    # C
        $packfile_header->{byteorder},   # C
        $packfile_header->{major},       # C
        $packfile_header->{minor},       # C
        $packfile_header->{flags},       # C
        $packfile_header->{floattype},   # C
        @{$packfile_header->{pad}},      # "C" x 10
        $packfile_header->{magic},
        $packfile_header->{opcodetype},
        $packfile_header->{fixup_ss},
        $packfile_header->{const_ss},
        $packfile_header->{bytecode_ss}) .
        $const_table{'table'} .
        pack ($packtype,length($self->{bytecode})) .
        $self->{bytecode};
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
  my $flt_re = qr{[-+]?\d+ (?:(?:\.\d+(?:[eE][-+]?\d+)?)
                               | (?:[Ee][+-]?\d+))}x;
  my $str_re = qr(\"(?:[^\\\"]*(?:\\.[^\\\"]*)*)\" |
                  \'(?:[^\\\']*(?:\\.[^\\\']*)*)\'
                 )x;
  my $label_re = qr([a-zA-Z_][a-zA-Z0-9_]*);
  my $pc = 0;

  $self->_collect_labels(); # Collect labels in a separate pass

  for(@{$self->{contents}}) {
    #
    # Collect the operator
    #
    my $temp = $_->[0];
    my $suffixes = '';
    $temp=~s/^(\w+)\s*//;
    $_->[0] = [$1];

    while($temp ne '') {
      $temp=~s/^\s*(,\s*)?//;
      if($temp=~s/^#.*//) {
        # Skip flying comments.
      }
      elsif($temp=~s/^($reg_re)//) {
        my $reg_idx = substr($1,1);
        unless($reg_idx >= 0 and $reg_idx <= 31) {
          print STDERR "Caught out-of-bounds register $1 at line $_->[1].\n";
          last;
        }
        $suffixes .= "_".lc(substr($1,0,1));
        push @{$_->[0]}, [lc(substr($1,0,1)),$1];
      }
      #
      # XXX '[k]' should be the result of one or more chained '[k;I3]' type
      # XXX arguments. '[k;I3;N0]' gets transformed to '[k;N0]', then just '[k]'
      #
      elsif($temp=~s/^\[k\]//) {
      }
      #
      # XXX Nip off the first keyed register and replace the '[k' at the start
      # XXX of the string, so we can nip off another argument.
      #
      elsif($temp=~s/^\[k;($reg_re)/\[k/) {
        my $reg_idx = substr($1,1);
        unless($reg_idx >= 0 and $reg_idx <= 31) {
          print STDERR "Caught out-of-bounds register $1 at line $_->[1].\n";
          last;
        }
        $suffixes .= "_k";
        _to_keyed($_);
        push @{$_->[0]}, ['k',$1];
      }
      elsif($temp=~s/^\[(S\d+)\]//) { # The only key register should be Sn
        my $reg_idx = substr($1,1);
        unless($reg_idx >= 0 and $reg_idx <= 31) {
          print STDERR "Caught out-of-bounds register $1 at line $_->[1].\n";
          last;
        }
        $suffixes .= "_s";
        _to_keyed($_);
        push @{$_->[0]}, ['s',$1];
      }
      elsif($temp=~s/^\[(I\d+)\]//) { # The only key register should be Sn
        my $reg_idx = substr($1,1);
        unless($reg_idx >= 0 and $reg_idx <= 31) {
          print STDERR "Caught out-of-bounds register $1 at line $_->[1].\n";
          last;
        }
        $suffixes .= "_k";
        _to_keyed_integer($_);
        push @{$_->[0]}, ['s',$1];
      }
      elsif($temp=~s/^($flt_re)//) {
        $suffixes .= "_nc";
        push @{$_->[0]}, $self->_numeric_constant($1);
      }
      elsif($temp=~s/^\[($str_re)\]//) {
        $suffixes .= "_sc";
        _to_keyed($_);
        push @{$_->[0]}, $self->_string_constant($1);
      }
      elsif($temp=~s/^\[($bin_re)\]//) { # P3[0b11101]
        my $val = $1;$val=~s/0b//;
        $suffixes .= "_ic";
        _to_keyed_integer($_);
        push @{$_->[0]}, ['ic',(strtol($val,2))[0]];
      }
      elsif($temp=~s/^\[($hex_re)\]//) { # P7[0x1234]
        $suffixes .= "_ic";
        _to_keyed_integer($_);
        push @{$_->[0]}, ['ic',(strtol($1,16))[0]];
      }
      elsif($temp=~s/^\[($dec_re)\]//) { # P14[3]
        $suffixes .= "_ic";
        _to_keyed_integer($_);
        push @{$_->[0]}, ['ic',0+$1];
      }
      elsif($temp=~s/^\[($flt_re)\]//) {
        $suffixes .= "_nc";
	_to_keyed($_);
        push @{$_->[0]}, $self->_numeric_constant($1);
      }
      elsif($temp=~s/^($bin_re)//) {     # 0b1101
        my $val = $1;$val=~s/0b//;
        $suffixes .= "_ic";
        push @{$_->[0]}, ['ic',(strtol($val,2))[0]];
      }
      elsif($temp=~s/^($hex_re)//) {     # 0x12aF
        $suffixes .= "_ic";
        push @{$_->[0]}, ['ic',(strtol($1,16))[0]];
      }
      elsif($temp=~s/^($dec_re)//) {     # -32
        $suffixes .= "_ic";
        push @{$_->[0]}, ['ic',0+$1];
      }
      elsif($temp=~s/^($str_re)//) {     # "Hello World"
        $suffixes .= "_sc";
        push @{$_->[0]}, $self->_string_constant($1);
      }
      elsif($temp=~s/^($label_re)//) {
        unless(defined $self->{global_labels}{$1}) {
          print STDERR "Couldn't find global label '$1' at line $_->[1].\n";
          last;
        }
        $suffixes .= "_ic";
        push @{$_->[0]}, ['label',$1];
      }
      else {
        print STDERR "Couldn't parse argument '$temp' at line $_->[1].\n";
        last;
      }
    }
    $_->[0][0] .= $suffixes
      unless defined $self->{fullops}{$_->[0][0]};
    $self->{line_to_pc}{$_->[1]}=$pc;
    $pc += scalar @{$_->[0]};
  }
  $self->_adjust_labels(); # XXX It's possible that these passes could be
  $self->_generate_bytecode(); # XXX merged, but I'm not going to worry about
                               # XXX it right now.

  return output_bytecode({
    bytecode  => $self->{bytecode},
    constants => $self->{ordered_constants},
    num_constants => $self->{num_constants}
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
  exit;
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
  binmode FILE;
  print FILE $bytecode;
  close FILE;
}
else {
  binmode STDOUT;
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

  while (my $arg = shift @ARGV) {
    if($arg =~ /^-(c|-checksyntax)$/) { $args->{-c} = 1; }
    elsif($arg =~ /^-E$/)             { $args->{-E} = 1; }
    elsif($arg =~ /^-(o|-output)$/)   { $args->{-o} = shift @ARGV; }
    elsif($arg =~ /^-(h|-help)$/)     { Usage(); exit 0; }
    elsif($arg =~ /^-./)              { Fail("Invalid option '$arg'\n"); }
    else                              { push @$files,$arg; }
  }
  Fail("No files to process.\n") unless(@$files);
  Fail("File '$_' does not exist.\n") for grep { not (-e or /^-$/) } @$files;
}

sub Fail {
    print STDERR @_;
    Usage();
    exit 1;
}

sub Usage {
  print <<"  _EOF_";

usage: $0 [options] file [file...]

    -E              Preprocess input files and terminate processing
    -h,--help       Print this message
    -o,--output     Write file 
    -c,-checksyntax Check syntax only, do not generate bytecode

  _EOF_
}
