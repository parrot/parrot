#! /usr/bin/perl -w
#
# Assembler.pm
#
# Support routines for the Parrot Assembler.
#
# Original code by Brian Wheeler (bdwheele@indiana.edu)
# Module conversion by Gregor N. Purdy (gregor@focusresearch.com)
#

use strict;
use Carp qw(&confess);


###############################################################################
###############################################################################

=head1 NAME

Parrot::Assembler

=cut

package Parrot::Assembler;

BEGIN {
  use Exporter;
  use vars qw(@EXPORT @ISA %options);
  @ISA = qw(Exporter);
  @EXPORT = qw(&init_assembler &process_program_lines &fixup &add_constants &output_bytecode &output_listing %options);
}

use Getopt::Long;

use Parrot::Op;
use Parrot::OpLib::core;

#use Parrot::Opcode;

use Parrot::Types;
use Parrot::Config;

use Parrot::PackFile;
use Parrot::PackFile::FixupTable;
use Parrot::PackFile::ConstTable;
#use Parrot::PackFile::Constant;
#use Parrot::String;
use Parrot::PMC qw(%pmc_types);

use Symbol;
use Carp;


###############################################################################
###############################################################################

=head1 SYNOPSIS

    #! /usr/bin/perl -w
    use strict;
    use Parrot::Assembler;
    init_assembler(@ARGV);
    process_program_lines();
    fixup();
    add_constants();
    output_bytecode() unless $options{'checksyntax'};
    output_listing() if $options{'listing'};
    exit 0;

=cut

###############################################################################
###############################################################################

=head1 DESCRIPTION

The support routines for the Parrot assembler. Eventually, this may become
a class, allowing on-the-fly assembly instead of just a few functions to
be called by the driver routine. Use would be something like:

    use Parrot::Assembler;
    use Parrot::Interpreter;
    my $asm    = new Parrot::Assembler;
    my $interp = new Parrot::Interpreter;
    my $code   = ...;
    my $pf = $asm->assemble($code);
    exit $interp->run($pf);

=cut

###############################################################################
###############################################################################

=head1 VARIABLES

=cut

###############################################################################
###############################################################################

my $pf; # The Parrot::PackFile object

%options = get_options();  # command line options


###############################################################################

=head2 %type_to_suffix

This is used to change from an argument type to the suffix that would be 
used in the name of the function that contained that argument.

=cut

my(%type_to_suffix)=('I'=>'i',  'N'=>'n',
                     'S'=>'s',  'P'=>'p',
                     'i'=>'ic', 'n'=>'nc',
                     's'=>'sc', 'D'=>'ic');


###############################################################################

=head2 @program

This holds an array ref for each line in the program. Each array ref
contains: 

=over 4

=item 1

The file name in which the source line was found.

=item 2

The line number in the file of the source line.

=item 3

The chomped source line without beginning and ending spaces.

=item 4

The chomped source line.

=back

=cut

my (@program);


###############################################################################

=head2 $output 

What is output to the bytecode file.

=head2 $listing

What is output to the listing file.

=head2 $bytecode

The program's bytecode (executable instructions).

=cut

my ($output, $listing, $bytecode) = ('', '', '');


###############################################################################

=head2 $file, $line, $pline, $sline

These variables are used to reference information from the C<@program> array.  
Please look at the comments for C<@program> for the description of each.

=cut

my ($file, $line, $pline, $sline) = ('','','','');


###############################################################################

=head2 %label

This holds each label and the PC at which it was defined.

=head2 %fixup

This holds labels that have not yet been defined, the position they are 
used in the source code, and the PC at that point. It is used for 
backpatching.

=head2 %macros

This maps a macro name to an array of program lines with the same format
as C<@program>.

=head2 %local_label

This holds local label definitions.

=head2 %local_fixup

This holds the occurrences of local labels in the source file.

=head2 $last_label

This the name of the last label seen.

=cut

my (%label, %fixup, %macros, %local_label, %local_fixup, $last_label);


###############################################################################

=head2 $pc

This is the current program counter. 

=head2 $op_pc

This is the program counter for the most recent operator.

=cut

my ($pc, $op_pc) = (0,0);


###############################################################################

=head2 %constants

This maps the name of each constant to its index in the constant table.

=head2 @constants

This holds a list of constant values in the same order that they should 
be in the constant table.

=cut

my (%constants, @constants);


###############################################################################

=head2 %equate

This hash maps assembler directives to their replacements.

=cut

my %equate=('*'=>sub { return $pc },
	    '__DATE__'=>'"'.scalar(localtime).'"',
	    '__VERSION__'=>'" $Revision$ "',
	    '__LINE__' => sub { return $line },
	    '__FILE__' => sub { return "\"$file\"" }
);


###############################################################################

=head2 %encodings

This maps string prefixes to the corresponding encodings.

=cut

my %encodings=('' => 0, 'N' => 0, 'U' => 3);

#my %opcodes = Parrot::Opcode::read_ops( -f "../opcode_table" ? "../opcode_table" : "opcode_table" );

my %opcodes;

foreach my $op (@$Parrot::OpLib::core::ops) {
  $opcodes{$op->full_name} = $op;
}


###############################################################################
###############################################################################

=head1 SUPPORT SUBROUTINES

=cut

###############################################################################
###############################################################################


###############################################################################

=head2 get_options

This function gets and verifies the options. The current options are:

=over 4

=item checksyntax

Do not emit bytecode, only check to see if the assembly is valid.

=item help

Emit a help message (usage).

=item version

Emit the CVS revision details of this file.

=item verbose

Output log messages.

=item output

The file to which the bytecode should be output.

=item listing

The file to which the listing should be output.

=item include

A list of files to add to the source code.

=back

If either the output or listing options are specified, they must be
accompanied by the name of the file to send the appropriate output to. 

=cut

sub get_options {
  my %options;
  GetOptions(\%options,('checksyntax',
                        'help',
                        'version',
                        'verbose',
                        'output=s',
                        'listing=s',
                        'include=s@'));
  
  my(@include)=('.');
  if($options{'include'}) {
    unshift(@include,@{$options{'include'}});
  }
  
  if($options{'version'}) {
    print $0,'Version $Id$ ',"\n";
  }
  
  if($options{'help'}) {
    print "$0 - Parrot Assembler
Options:
   --checksyntax        Check assembler syntax only, no output
   --help               This text
   --listing            Dump assembly listing to file
   --include            Directory to search for included files
   --output             File to dump bytecode into
   --verbose            Show what's going on
   --version            Show assembler version
";
    exit;
  }
  
  if(exists($options{'output'}) && $options{'output'} eq "") {
    print STDERR "You must provide a file with --output flag!\n";
    exit;
  }
  
  if(exists($options{'listing'}) && $options{'listing'} eq "") {
    print STDERR "You must provide a file with --listing flag!\n";
    exit;
  }
  return %options;
}


###############################################################################

=head2 init_assembler()

=over 4

=item 1

Adds the opcode fingerprint to the constant table.

=item 2

Adds the listing header.

=item 3

Creates the program lines array from each source file passed in.

=back

=cut


sub init_assembler {
  my @cmdln = @_;
#  constantize_string( Parrot::Opcode::fingerprint() ); # make it constant zero.
  add_line_to_listing( "PARROT ASSEMBLY LISTING - " . scalar( localtime ) . "\n\n" );
  foreach my $file( @cmdln ) {
    push( @program, read_source( $file ) );
  }

  $pf = new Parrot::PackFile;
}


###############################################################################

=head2 fixup

Checks to make sure that all labels are defined. Also outputs the label
information to the listing.

=cut

sub fixup {
  add_line_to_listing( "\nDEFINED SYMBOLS:\n" );

  foreach( sort( keys( %label ) ) ) {
    add_line_to_listing( sprintf( "\t%08x   %s\n", $label{$_}, $_ ) );
  }

  #
  # Resolve label arithmetic:
  #

  foreach my $label (keys %fixup) {
    next unless $label =~ m/^\[(.*)\]$/;

    my $exp = $1;

    $exp =~ s/([A-Za-z_][A-Za-z0-9_]*)/$label{$1}/g;

    my $result = (eval $exp) / sizeof('op');

    while (scalar(@{$fixup{$label}})) {
      my $offset = shift @{$fixup{$label}};
      my $const = constantize_integer( $result );
      substr($bytecode, $offset, sizeof('op')) = pack_arg('op', $const);
    }

    delete $fixup{$label};
  }

  #
  # Complain about undefined symbols:
  #

  return unless keys %fixup;

  print STDERR "These symbols were referenced but not defined:\n";

  add_line_to_listing( "\nUNDEFINED SYMBOLS:\n" );

  foreach( sort( keys( %fixup ) ) ) {
    print STDERR "\t$_ at pc: ";
    foreach my $pc (@{ $fixup{ $_ } } ) {
      print STDERR sprintf( "%08x ", $pc );
    }
    print STDERR "\n";
    add_line_to_listing( "\t$_\n" );
  }

  # TODO: some day, unresolved symbols won't be an error!

  error("Cannot assemble with unresolved symbols!\n", $file, $line);
}


###############################################################################

=head2 add_constants()

Adds each constant to the PackFile's ConstTable.

=cut

sub add_constants {
  my $const_table = $pf->const_table;

  add_line_to_listing( "\nCONSTANTS\n" );

  # now emit each constant
  my $counter = 0;
  for( @constants ) {
    my ($type, $value, $encoding) = @$_;

    add_line_to_listing( sprintf( "\t%04x %s [[%s]]\n", $counter, $type, $value ) );
    $counter++;

    if    ($type eq 'i') {
      $const_table->add(Parrot::PackFile::Constant->new_integer($value));
    } elsif ($type eq 'n') {
      $const_table->add(Parrot::PackFile::Constant->new_number($value));
    } elsif ($type eq 's') {
      $const_table->add(Parrot::PackFile::Constant->new_string(0, $encoding, 0, length($value), $value));
    } else { 
      die; # TODO: Be more specific
    }
  }
}


###############################################################################

=head2 output_bytecode

Writes the bytecode to the output file (or stdout if no filename was given).
Ensures the file is in binmode.

=cut

sub output_bytecode {
  $pf->byte_code($bytecode);

  my $output = $pf->pack;

  if( defined $options{'output'} and $options{'output'} ne "" ) {
    open O, ">$options{'output'}" || die $!;
    binmode O;
    print O $output;
    close O;
  }
  else {
    binmode STDOUT;
    print $output;
  }
}


###############################################################################

=head2 output_listing

Outputs the listing information to the filename given by the listing option.

=cut

sub output_listing {
  open L, ">$options{'listing'}" or die $!;
  print L $listing;
  close L;
}


###############################################################################

=head2 process_program_lines

Loops through each program line and checks for comments, labels, and assembler
directives. Next, it examines the operator and arguments to find the best
match.  Finally, it outputs its information to the listing.

=cut

sub process_program_lines {
  my $gensym = 0;
  while( my $lineinfo = shift( @program ) ) {
    ($file, $line, $pline, $sline) = @$lineinfo;

    my $code = $pline;

    next if( is_comment($code) );

    $code = handle_pragma($code) if( has_pragma( $code ) );

    next if( !defined( $code ) || $code eq "" );
    $pline = $code;

    $code = handle_label($code) if( has_label( $code ) );

    next if( !defined( $code ) || $code eq "" );

    if( has_asm_directive( $code ) ) {
      # handle_asm_directive will shift @program as needed
      # for macro processing.
      next if( handle_asm_directive($code, @program) );
    }

    $code = replace_string_constants($code);
    while ($code =~ s/\[([^\] \t]*)\s+/[$1/) { };  # Erase all space within label arithmetic
    $code =~ s/,/ /g;
    $code =~ s/#.*$//; # strip end of line comments
           
    my ($opcode, @args) = split( /\s+/, $code );

    if( exists( $macros{$opcode} ) ) {
      # found a macro, expand it and append its lines to the front of
      # the program lines array.  

      my @expanded_lines = expand_macro( $opcode, $gensym++, @args );
      unshift( @program, @expanded_lines );
      $lineinfo->[2] = '';
      unshift( @program, $lineinfo );
      next;
    }

    $opcode = handle_operator($code, $opcode, @args);
    @args   = handle_arguments($code, $opcode, @args);

    # add line to listing

    my $odata;
           
    foreach ( unpack_ops( substr($bytecode, $op_pc) ) ) {
      $odata .= sprintf( "%08x ", $_ );
    }

    add_line_to_listing( sprintf( "%4d %08x %-44s %s\n", $line, $op_pc, $odata, $sline ) );
    add_line_to_listing( "\n" );
  }  
}


###############################################################################

=head2 is_comment

Determines whether the entire line is a comment. It returns true if the
first character is a '#' or the line is empty; otherwise it returns false.

=cut

sub is_comment {
  return $_[0] =~ /^\#/ || $_[0] eq "";
}


###############################################################################

=head2 has_pragma

Determines whether or not the line begins with a pragma. Returns true if the 
line begins with a . followed by a word; otherwise returns false.

=cut

sub has_pragma {
  return $_[0] =~ /^\./;
}


###############################################################################

=head2 has_label

Determines whether or not the line begins with a label. Returns true if the 
line begins with a word followed by a colon; otherwise returns false.

=cut

sub has_label {
  return $_[0] =~ /^\S+:\s*(?:.+)?/;
}


###############################################################################

=head2 replace_string_constants

This function strips out string constants and replaces them with the
string [sc N] (for string constants), where N is the index in the 
constants table at which the constant is located.

=cut

sub replace_string_constants {
  my $code = shift;

  $code =~ s{([NU])?"(((\\")|[^"])*)"}{constantize_string($2, $1)}egx;
  $code =~ s{([NU])?'(((\\')|[^'])*)'}{constantize_string($2, $1)}egx;

  return $code;
}


###############################################################################

=head2 has_asm_directive

Returns true if there is a C<macro> or C<equ> directive.

=cut

sub has_asm_directive {
  return $_[0] =~ /^[_a-zA-Z]\w*\s+macro(?:\s+.+)?$/i ||
         $_[0] =~ /^[_a-zA-Z]\w*\s+equ\s+.+$/i;
}


###############################################################################

=head2 handle_asm_directive

Processes macros and C<equ> directives. C<equ> directives get stored in 
an C<equ> hash. Macros store all program lines in an array.

NOTE: This function modifies C<@program>.

=cut

sub handle_asm_directive {
  my $line = shift;
  if( $line =~ /^([_a-zA-Z]\w*)\s+equ\s+(.+)$/i ) {
    my( $name, $data ) = ($1, $2);
    $equate{$name} = $data;
    return 1;
  }
  elsif( $line =~ /^([_a-zA-Z]\w*)\s+macro(?:\s+(.+))?$/i ) {
    # a macro definition
    my ($name, $args) = ($1, $2);
    my $cur_macro = $name;
    if(defined $args) {
      $macros{$name} = [ [split( /,\s*/, $args)], [] ];
    }
    else {
      $macros{$name} = [ [], [] ];
    }
    while( 1 ) {
      if( !scalar( @program ) ) {
        error( "The end of the macro '$name' was never seen", $file, $line);
      }
      my $l = shift( @program );
      ($file, $line, $pline, $sline) = @$l;
      if( $pline =~ /^endm$/i ) {
        last;
      }
      elsif( $pline =~ /^\S+\s+macro/ ) {
        error( "Cannot define a macro inside of another macro", $file, $line );
      }
      else {
        push( @{$macros{$cur_macro}[1]}, $l );
        add_line_to_listing( sprintf( "%4d %08x %-44s %s\n", $line, $op_pc, '', $sline ) );
      }
    }
    return 1;
  }
}


###############################################################################

=head2 handle_label

This function handles a label definition by storing the PC where the label was
found and backpatching all previous instances of that label with the correct
offset.  This function handles both local labels and global labels.

=cut

sub handle_pragma {
  my ($pragma, $code) = $pline =~ /^.(\S+)\s*(.+)?/;
  if($pragma eq 'sub') {
    $code =~ s/^(\S+)/$1\:/;
  } else {
    $code = '';
  }
  return $code;
}

###############################################################################

=head2 handle_label

This function handles a label definition by storing the PC where the label was
found and backpatching all previous instances of that label with the correct
offset.  This function handles both local labels and global labels.

=cut

sub handle_label {
  my ($label, $code) = $pline =~ /^(\S+):\s*(.+)?/;

  #
  # Handle code-less lines with both labels and comments.
  #

  $code = '' if defined $code and $code =~ m/^#/;

  #
  # Local labels (begin with '$'):
  #

  if ($label =~ /^\$/) {
    if( exists( $local_label{ $label } ) ) {
      error( "local label '$label' already defined in $last_label!", $file, $line );      
    }

    if( exists( $local_fixup{ $label } ) ) {
      # backpatch everything with this PC.
      while(scalar(@{$local_fixup{$label}})) {
        my $op_pc=shift(@{$local_fixup{$label}});
        my $offset=shift(@{$local_fixup{$label}});
        my $const = constantize_integer( ($pc - $op_pc) / sizeof('op') );
        substr($bytecode,$offset,sizeof('op')) = pack_arg('op', $const);
      }
      delete($local_fixup{$label});
    }

    $local_label{$label} = $pc;
  }

  #
  # Global labels:
  #

  else {
    if( exists( $label{ $label } ) ) {
      error( "'$label' already defined!", $file, $line );
    }

    if( exists( $fixup{$label} ) ) {
      # backpatch everything with this PC.
      while( scalar( @{ $fixup{ $label } } ) ) {
        my $op_pc = shift( @{ $fixup{ $label } } );
        my $offset = shift( @{ $fixup{ $label } } );
        my $const = constantize_integer( ($pc - $op_pc) / sizeof('op') );
        substr($bytecode,$offset,sizeof('op')) = pack_arg('op', $const);
      }

      delete($fixup{$label});  
    }

    #
    # Clear out any local labels
    #

    %local_label = ();

    if( keys( %local_fixup ) ) {
      # oops, some local labels are unresolved
      error( "These local labels were undefined in $last_label: " .
             join( ",", sort( keys( %local_fixup ) ) ), $file, $line );
    }

    $label{ $label } = $pc; # store it
    $last_label = $label;
  }

  return $code;
}


###############################################################################

=head2 expand_macro

Expands the macro into the C<@program> array. It also replaces the macro 
arguments with the ones given to the macro.  NOTE: modifies C<@program>.

=cut

sub expand_macro {
  my ($opcode, $gensym, @args) = @_;

  my $local_prefix = sprintf("LOCAL_%d_",$gensym);
  my (@margs) = @{ $macros{$opcode}[0] };
  my (@macro);

  # we have to make sure to copy the macro, to avoid mangling the
  # original macro definition.

  foreach (@{ $macros{ $opcode }[1] } ) {
    push( @macro, [@$_] );
  }
  for(@macro) {
    $_->[2]=~/\$/ and do {
      $_->[2]=~s/\$/\$$local_prefix/;
    };
  }

  my $nargs = scalar(@args);
  my $eargs = scalar(@margs);

  error( "Wrong number ($nargs) of arguments to macro '$opcode' (expected $eargs)", $file, $line )
    if $eargs != $nargs;

  #fixup parameters.

  while( my $marg = shift( @margs ) ) {
    my $param = shift( @args );
    foreach( @macro ) {
      $_->[2] =~ s|([^A-Za-z0-9_])$marg\b|$1$param|g;
      $_->[3] =~ s|([^A-Za-z0-9_])$marg\b|$1$param|g;
    }
  }

  # fixup file, line number, listing
  foreach( @macro ) {
    $_->[0] = $file;
    $_->[1] = $line;
    $_->[3] = "> " . $_->[3];
  }
  return @macro;
}


###############################################################################

=head2 find_correct_opcode

Given an opcode like sin with arguments i n i, it will look through the opcode
hash for a function that takes the correct number and types of arguments and
is of the form sin(_x)* where x is one of i, n, s, p, ic, nc, or sc. It will
prefer an exact argument match, but if one cannot be found, it will try to use
ic for nc. It will stop on the first exact match, but will continue for
non-exact matches to make sure the operator is unambiguous.

=cut

sub find_correct_opcode {
  my ($opcode,@args) = @_;
  my ($found_op, $ambiguous) = (0,0);
  my $match_level_2;
  my ($old_op) = $opcode;
  my @tests;

  $opcode=lc($opcode);

  #
  # Return immediately if the opcode is found:
  #

  return $opcode if exists $opcodes{$opcode};

  #
  # Otherwise, scan the arguments to determine their types:
  # 

  my @arg_t=();

  foreach (@args) {
    #
    # Make any replacements due to 'equates':
    #
    # NOTE: We don't process the equate expansions recursively.
    #

    if (exists $equate{$_}) { # substitute the equate value
      if(ref($equate{$_})) {
        $_=&{$equate{$_}};
      } else {
        $_=$equate{$_};
      }
      $_ = replace_string_constants($_);
    }

    #
    # Determine the type of each argument:
    #

    if      (m/^([INPS])\d+$/) {                       # a register.
      push @arg_t,lc($1);
    } elsif (m/^\[([a-z]+):(\d+)\s*\]$/) {             # string constant
      push @arg_t, $1;
    } elsif (m/^[-+]?\d+\.\d+([eE][+-]?\d+)?$/i) {     # number
      push @arg_t, 'nc';
    } elsif(m/^((-?\d+)|(0b[01]+)|(0x[0-9a-f]+))$/i) { # integer
      push @arg_t,'ic';
    } elsif(m/^\[.*\]$/) {                                      # label arithmetic
      push @arg_t,'ic';
    } elsif(m/^\$?[A-Za-z_][\w]*$/i) { # label
      push @arg_t,'ic';
    } else {
      error("Unrecognized argument '$_'!", $file, $line);
    }
  }  

  #
  # grep for operators that match the OP_ic_nc format where ic and nc
  # can be any of (i n s p ic nc sc).
  #

  my @grep_ops = grep($_ =~ /^$opcode(?:_(?:(?:[ins]c?)|p))+$/, keys(%opcodes));

  foreach my $op (@grep_ops) {
    push( @tests, $op );                      # remember what you have examined.
    next unless @args == scalar($opcodes{$op}->arg_types - 1); # make sure the argcount is the same
    my ($match) = 1;                          # assume a match

    #
    # check each arg type.  assume ic can be used for nc, but prefer
    # ic match to ic.
    #

    foreach my $idx ( 0 .. $opcodes{$op}->size - 2 ) {
      if( $opcodes{$op}->arg_type($idx + 1) ne $arg_t[$idx] ) {
        # if they are not the same check ic/nc
        if ( $opcodes{$op}->arg_type($idx + 1) eq "nc" &&
            $arg_t[$idx] eq "ic" ) {
          # got ic/nc level 2 match
          $match = 2;
        } else {
          # no match...next operator attempt...
          $match = 0;
          last;
        }
      }
    }

    #
    # Handle the exact matches:
    #
    # Remember what you found and exit the loop
    #

    if ($match == 1) {
      $ambiguous = 0;
      $opcode    = $op;
      $found_op  = 1;
      last;
    }

    #
    # Handle the level two matchs:
    #
    # If there has been another level two match, it is ambiguous and no
    # operator can be chosen (unless there is an exact match).
    #

    if ($match == 2) {
      $ambiguous = 1 if $match_level_2;
      $match_level_2 = $op if !$ambiguous;
      $opcode = $op;
      $found_op = 1;
    }
  }

  error("Ambiguous operator $old_op matches $opcode and $match_level_2\n",
    $file, $line )
    if $ambiguous;
    
  error("No opcode $opcode ( tried " . join(', ', @tests) . ") in <$pline>",
    $file, $line)
    unless $found_op;

  log_message("substituting $opcode for $old_op"
    . (scalar(@tests) ? (" ( tried " . join(', ', @tests) . ")") : ''),
    $file, $line);

  return $opcode;
}


###############################################################################

=head2 handle_operator

This function finds the correct opcode for the operator and packs the opcode
into the output.

=cut

sub handle_operator {
  my ($code, $opcode, @args) = @_;

  $opcode = lc $opcode;

  if (!exists $opcodes{$opcode}) {
    $opcode = find_correct_opcode($opcode, @args);
  }

  if (@args != scalar($opcodes{$opcode}->arg_types) - 1) {
    error("Wrong arg count for op '$opcode'--got " . scalar(@args) . " needed "
      . scalar($opcodes{$opcode}->arg_types - 1) . " in <$code>", $file, $line );
  }

  $bytecode .= pack_op($opcodes{$opcode}->code);
  $op_pc     = $pc;
  $pc       += sizeof('op');

  return $opcode;
}


###############################################################################

=head2 handle_arguments

Packs the argument into the bytecode.

=cut

my %rtype_map = (
  "i" => "I",
  "n" => "N",
  "p" => "P",
  "s" => "S",

  "ic" => "i",
  "nc" => "n",
  "pc" => "p",
  "sc" => "s",
);

sub handle_arguments {
  my ($code, $opcode, @args) = @_;

  foreach (0..$#args) {
    my $rtype = $rtype_map{$opcodes{$opcode}->arg_type($_ + 1)};

    #
    # Make any replacements due to 'equates':
    #
    # NOTE: We don't process the equate expansions recursively.
    #

    if (exists $equate{$args[$_]}) { # substitute the equate value
      if(ref($equate{$args[$_]})) {
        $args[$_] = &{$equate{$args[$_]}};
      } else {
        $args[$_] = $equate{$args[$_]};
      }
      $args[$_] = replace_constants($args[$_]);
    }

    #
    # Register arguments:
    #

    if($rtype eq "I" || $rtype eq "N" || $rtype eq "P" || $rtype eq "S") {
      # its a register argument

      $args[$_] =~ s/^[INPS](\d+)$/$1/i
        or error("Expected m/[INPS]\\d+/, but got '$args[$_]'!", $file, $line);

      error("Register $1 out of range (should be 0-31) in '$opcode'",$file,$line) if $1 < 0 or $1 > 31;
    }

    #
    # String arguments:
    #

    elsif ($rtype eq 's') {
      $args[$_] =~ s/[\[]sc:(.*)[\]]/$1/;
    }
    elsif($rtype eq 'n') {
      $args[$_] = constantize_number( $args[$_] );
    }
    #
    # Integer arguments:
    #

    elsif ($rtype eq 'i') {
      #
      # Label arithmetic:
      #

      if ($args[$_] =~ m/^\[(.*)\]$/) {
        my $mult = sizeof('op');
        $args[$_] =~ s/(\d+)/$mult * $1/eg;                  # Hard-coded opcode_t offsets ---> byte offsets
        $args[$_] =~ s/[\@]/$op_pc/;                         # Map '@' to $op_pc

        push @{$fixup{$args[$_]}}, $pc;
        $args[$_] = 0xffffffff;
      }

      #
      # Local labels:
      #

      elsif ($args[$_] =~ /^\$/) {
        if( !exists($local_label{$args[$_]}) ) {
          # we have not seen it yet...put it on the fixup list
          push(@{$local_fixup{$args[$_]}},$op_pc,$pc);
          $args[$_] = 0xffffffff;
        }
        else {
          $args[$_] = constantize_integer( ($local_label{$args[$_]}-$op_pc)/sizeof('op') );
        }
      }

      #
      # Regular labels:
      #

      elsif ($args[$_] =~ m/^[A-Za-z_][A-Za-z0-9_]+$/) {
        if ($opcode =~ m/^new_p_ic/) {
            my $type = $pmc_types{lc $args[$_]};
            defined $type
                or error("Unknown PMC type '$args[$_]'!", $file, $line);
            $args[$_] = constantize_integer($type);
        }
        elsif( !exists($label{$args[$_]}) ) {
          # we have not seen it yet...put it on the fixup list
          push( @{ $fixup{ $args[$_] } }, $op_pc, $pc);
          $args[$_] = 0xffffffff;
        }
        else {                    
          $args[$_] = constantize_integer( ($label{$args[$_]}-$op_pc)/sizeof('op') );
        }
      }

      #
      # Handle conversions of hexadecimal and octal:
      #

      else {
        $args[$_] = constantize_integer( $args[$_] );
      }

    }

    #
    # Unknown argument types:
    #

    else {
      error("Unrecognized argument type '$rtype'!\n", $file, $line);
    }

    #
    # Continue:
    #
    # NOTE: Too bad $rtype wouldn't be visible in a continue block...
    #
    $pc       += sizeof($rtype);
    $bytecode .= pack_arg($rtype, $args[$_]);
  }

  return @args;
}


###############################################################################

=head2 add_line_to_listing

Adds a line to the listing string.

=cut

sub add_line_to_listing {
  $listing .= $_[0];
}


###############################################################################

=head2 from_binary

Convert a string of the form 0b[01]+ to a decimal number.

=cut

sub from_binary {
  my ($pow, $final) = (0,0);
  $final += $_ * 2 ** $pow++ for split //, reverse substr( shift, 2 );
  return $final;
}


###############################################################################

=head2 error

Outputs an error message and exits.

=cut

sub error {
    my ($message, $file, $line) = @_;

    $message="Something went wrong" unless defined $message;

    if(defined $file and defined $line) {
        warn "Error ($file:$line) $message\n";
    }
    else {
	warn "Error: $message\n"
    }

    exit 1;
}


###############################################################################

=head2 log_message

Outputs a message to the log( STDERR ).

=cut

sub log_message {
    my($message,$file,$line)=@_;
    if($options{'verbose'}) {
	print STDERR "INFO ($file:$line): $message\n";
    }
}


###############################################################################

=head2 constantize_number

Adds a floating-point constant to the constant array and hash, remembering the
index in the array at which it is stored. By using a hash, we ensure that
duplicate numbers do not get duplicate entries in the constant table.

=cut

sub constantize_number {
    my $n = shift;
    if(!exists($constants{$n}{n})) {
	push(@constants, ['n', $n]);
	$constants{$n}{n} = $#constants;
    }
    return $constants{$n}{n};
}

###############################################################################

=head2 constantize_integer

Verifies that its argument is an integer, converting from binary or 
hexadecimal if necessary, and returns its value. Calling it with
a non-integer argument, or with an integer greater or smaller than
Parrot can handle produces a fatal error.

=cut

sub constantize_integer {
    my $i = shift;

    if ($i =~ /^[+-]?0b[01]+$/i) {
      $i = from_binary( $i );
    }
    elsif ($i =~ /^[+-]?0x?[0-9a-f]*$/i) {
      $i = oct($i);
    }
    elsif ($i =~ m/^[+-]?\d+$/) {
      # Good ones
    }

    confess "constantize_integer(): Called with non-numeric argument '$i'!"
      unless $i =~ m/^[+-]?\d+$/;

# XXX parrot cannot currently handle integers over 2 ** 31
    if( $i > (2 ** 31) || $i < -(2**31) ) {
      error( "Cannot have integer $i because it is greater than 2 ** 31.\n", $file, $line );
    }
    return $i;
}

###############################################################################

=head2 constantize_string

Replaces some escape sequences in a string and then adds the string to the 
constant array and hash, remembering the index in the array at which the 
constant string is stored. The hash ensures that duplicate strings do 
not get duplicated in the constants table.

=cut

my %escape = (
    'a'  => "\a",
    'n'  => "\n",
    'r'  => "\r",
    't'  => "\t",
    '\\' => '\\'
);

sub constantize_string {
    my $s = shift;
    my $p = shift || "";
    my $e = $encodings{$p};

    confess if !defined $s;
    confess if !defined $e;

    $s=~s/\\(0\d*)/chr(oct($1))/eg;
    $s=~s/\\x([0-9a-fA-F]{1,2})/chr(hex($1))/ge;
    $s=~s/\\([anrt\\])/$escape{$1}/ge;

    if(!exists($constants{$s}{s}{$e})) {
	push(@constants, ['s', $s, $e]);
	$constants{$s}{s}{$e}=$#constants;
    }

    return "[sc:".$constants{$s}{s}{$e}."]";
}


###############################################################################

=head2 read_source

Reads in a file, putting the information gathered into the C<@program> array. 
It also processes INCLUDE directives by opening the included file and 
recursively processing it.

=cut

sub read_source {
    my($file,$ofile,$oline)=@_;
    my($line)=1;
    my(@lines);
    my($handle)=gensym;
    my($found);
    my (@include) = ('.');
    if( $options{'include'} ) {
      unshift( @include, @{$options{'include'}} );
    }

if($file eq '-') {
    $handle = *{STDIN};
    $found=1;
}
else {
    if(open($handle, "<$file")) {
        $found=1;
    }
    else {
        foreach my $path (@include) {
            open($handle,"$path/$file") && do {
	        $found=1;
	        last;
	    }
        }
    }
}
    error("Cannot open $file for input!",$ofile,$oline) if(!$found);
    while(<$handle>) {
	chomp;
	my($sline)=$_;
	s/^\s*//;
	s/\s*$//;

	push(@lines,[$file,$line,$_,$sline]);
	if(m/^INCLUDE\s+['"](.+)["']/i) {
	    my $newfile=$1;
	    # this is an include directive.
	    $lines[-1][2]="";
	    # include the file
	    push(@lines,[$file,$line,'',"#<<<< Start of $newfile >>>>"]);
	    push(@lines,read_source($newfile,$file,$line));
	    push(@lines,[$file,$line,'',"#<<<< End of $newfile >>>>"]);
	}
	$line++;
    }
    close($handle);
    return @lines;
}

###############################################################################

1;


