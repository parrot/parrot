#! /usr/bin/perl -w
#
# assemble.pl - take a parrot assembly file and spit out a bytecode file
#   This is based heavily on assemble.pl by Dan Sugalski
# Brian Wheeler (bdwheele@indiana.edu)

use strict;
use Getopt::Long;
use Parrot::Opcode;
use Parrot::Types;
use Parrot::PackFile::ConstTable;
use Parrot::Config;
use Symbol;

# %options holds the command line options
my %options = get_options();
# type_to_suffix is used to change from an argument
# type to the suffix that would be used in the
# name of the function that contained that
# argument.
my(%type_to_suffix)=('I'=>'i',  'N'=>'n',
                     'S'=>'s',  'P'=>'p',
                     'i'=>'ic', 'n'=>'nc',
                     's'=>'sc', 'D'=>'ic');
# @program will hold an array ref for each line in the
# program.  Each array ref will contain
# 1.) The file name in which the source line was found
# 2.) The line number in the file of the source line
# 3.) The chomped source line without beginning and ending spaces
# 4.) The chomped source line
my (@program);

# $output will be what is output to the bytecode file.
# $listing will be what is output to the listing file.
# $bytecode is the program's bytecode (executable instructions).
my ($output, $listing, $bytecode) = ('', '', '');

# $file, $line, $pline, and $sline are used to reference
# information from the @program array.  Please look
# at the comments for @program for the description
# of each.
my ($file, $line, $pline, $sline) = ('','','','');

# %label will hold each label and the PC at which it was defined.
# %fixup will hold labels that have not yet been defined,
# where they are used in the source code, and the PC at that
# point.  It is used for backpatching.
# %macros will map a macro name to an array of program lines
# with the same format as @program.
# %local_label will hold local label definitions,
# %local_fixup will hold the occurances of local labels
# in the source file.
# $last_label is the name of the last label seen
my (%label, %fixup, %macros, %local_label, %local_fixup, $last_label);

# pc is the current program counter.  op_pc is the program counter for the
# most recent operator.
my ($pc, $op_pc) = (0,0);

# %constants is a map of constant name to index in the constant table
# @constants is an array of constant values in the same order that
# they should be in the constant table
my (%constants, @constants);

# %equate maps assembler directives to their replacements.
my %equate=('*'=>sub { return $pc },
	    '__DATE__'=>'"'.scalar(localtime).'"',
	    '__VERSION__'=>'" $Revision$ "',
	    '__LINE__' => sub { return $line },
	    '__FILE__' => sub { return "\"$file\"" });

my %opcodes = Parrot::Opcode::read_ops( -f "../opcode_table" ? "../opcode_table" : "opcode_table" );

# initialize the assembler
init_assembler(@ARGV);

# process each element in the @program array
process_program_lines();

# emit the magic cookie as the first thing in the output file
magic_cookie();

# fixup the bytecode
fixup();

# add constants to the bytecode
add_constants();

# if we are doing more than checking syntax,
# output the bytecode
if( !$options{'checksyntax'} ) {
  output_bytecode();
}

# if the user wants a listing, output it
if( $options{'listing'} ) {
  output_listing();
}

# get_options
# this function gets and verifies the options
# current options are:
#     checksyntax - do not emit bytecode, only check to see if the assembly is valid
#     help - emit a help message (usage)
#     version - emit the CVS revision of this file
#     verbose - output log messages
#     output - the file to output the bytecode
#     listing - the file to output the listing
#     include - a list of files to add to the source code
# Validation checks to make sure that if either output
# or listing is present, it has an argument (which
# is the name of the file to output to.
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
    exit;
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

# init_assembler
#   1.) adds the opcode fingerprint to the constant table
#   2.) adds the listing header
#   3.) creates the program lines array from each source file passed in
sub init_assembler {
  my @cmdln = @_;
  constantize( Parrot::Opcode::fingerprint() ); # make it constant zero.
  add_line_to_listing( "PARROT ASSEMBLY LISTING - " . scalar( localtime ) . "\n\n" );
  foreach my $file( @cmdln ) {
    push( @program, read_source( $file ) );
  }
}

# magic_cookie
# emit 0x13155a1 as the first thing in the output.
# If this is not present, parrot will NOT process
# the file.
sub magic_cookie {
  $output = pack_op( 0x13155a1 );
}

# fixup
# checks to make sure that all labels are defined.
# also outputs the label information to the listing.
sub fixup {
  add_line_to_listing( "\nDEFINED SYMBOLS:\n" );
  foreach( sort( keys( %label ) ) ) {
    add_line_to_listing( sprintf( "\t%08x   %s\n", $label{$_}, $_ ) );
  }

  if( keys( %fixup ) ) {
    print STDERR "SQUAK!  These symbols were referenced but not defined:\n";
    add_line_to_listing( "\nUNDEFINED SYMBOLS:\n" );
    foreach( sort( keys( %fixup ) ) ) {
      print STDERR "\t$_ at pc: ";
      foreach my $pc (@{ $fixup{ $_ } } ) {
        print STDERR sprintf( "%08x ", $pc );
      }
      print STDERR "\n";
      add_line_to_listing( "\t$_\n" );
    }
    exit; # some day, unresolved symbols won't be an error!
  }
  else {
    # dump empty header
    $output .= pack_op(0);
  }
}

# add_constants
# adds each constant to a ConstTable perl
# class and then adds the packed representation
# to the output.
sub add_constants {
  my $const_table = new Parrot::PackFile::ConstTable;

  add_line_to_listing( "\nSTRING CONSTANTS\n" );

  # now emit each constant
  my $counter = 0;
  for( @constants ) {
    add_line_to_listing( sprintf( "\t%04x %08x [[%s]]\n", $counter, length($_), $_ ) );
    $counter++;
    $const_table->add( new Parrot::PackFile::Constant (0, 0, 0, length( $_ ), $_ ) );
  }

  $output .= $const_table->pack;
}

# output_bytecode
# writes the bytecode to the output file
# (or stdout if no filename was given).
# Ensures the file is in binmode.
sub output_bytecode {
  $output .= $bytecode;
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

# output_listing
# outputs the listing information to the filename
# given by the listing option.
sub output_listing {
  open L, ">$options{'listing'}" or die $!;
  print L $listing;
  close L;
}

# process_program_lines
# loops through each program line and checks for
# comments, labels, and assembler directives.
# Then, it examines the operator and arguments
# to find the best match.  Finally, it outputs
# its information to the listing.
sub process_program_lines {
  while( my $lineinfo = shift( @program ) ) {
    ($file, $line, $pline, $sline) = @$lineinfo;
    my $code = $pline;
    next if( is_comment($code) );
    $code = handle_label($code) if( has_label( $code ) );
    next if( !defined( $code ) || $code eq "" );
    if( has_asm_directive( $code ) ) {
      # handle_asm_directive will shift @program as needed
      # for macro processing.
      next if( handle_asm_directive($code, @program) );
    }
    $code = replace_constants( $code );
    $code =~ s/,/ /g;
    $code =~ s/#.*$//; # strip end of line comments
    my( $opcode, @args ) = split( /\s+/, $code );
    if( exists( $macros{$opcode} ) ) {
      # found a macro, expand it and append its lines to the front of
      # the program lines array.  
      my @expanded_lines = expand_macro( $opcode, @args );
      unshift( @program, @expanded_lines );
      $lineinfo->[2] = '';
      unshift( @program, $lineinfo );
      next;
    }
    $opcode = handle_operator( $opcode, @args );
    @args = handle_arguments( $opcode, @args );
    # add line to listing
    my $odata;
    # XXX FIXME This can't be right!
    foreach (unpack('l*', substr($bytecode, $op_pc) ) ) {
      $odata .= sprintf( "%08x ", $_ );
    }
    add_line_to_listing( sprintf( "%4d %08x %-44s %s\n", $line, $op_pc, $odata, $sline ) );
    add_line_to_listing( "\n" );
  }  
}

# is_comment
# returns whether or not the entire line is a comment.
# This is true if the line starts with a # character
sub is_comment {
  return $_[0] =~ /^\#/ || $_[0] eq "";
}

# has_label
# returns whether or not the line begins with a label.
# This is true if the line begins with a word
# followed by a colon.
sub has_label {
  return $_[0] =~ /^\S+:\s*(?:.+)?/;
}

# replace_constants
# this function strips out string constants and replaces
# them with the string [ N ] where N is the index into
# the constants table where the string is located.
sub replace_constants {
  my $code = shift;
  $code =~ s/\"([^\\\"]*(?:\\.[^\\\"]*)*)\"/constantize($1)/eg;
  return $code;
}

# has_asm_directive
# returns true if there is a macro or equ directive
sub has_asm_directive {
  return $_[0] =~ /^[_a-zA-Z]\w*\s+macro\s+.+$/i ||
         $_[0] =~ /^[_a-zA-Z]\w*\s+equ\s+.+$/i;
}

# handle_asm_directive
# processes macros and equ directives.  equ directives
# get stored in an equ hash.  Macros store all program
# lines in an array.  NOTE: This function modifies @program.
sub handle_asm_directive {
  my $line = shift;
  if( $line =~ /^([_a-zA-Z]\w*)\s+equ\s+(.+)$/i ) {
    my( $name, $data ) = ($1, $2);
    $equate{$name} = $data;
    return 0;
  }
  elsif( $line =~ /^([_a-zA-Z]\w*)\s+macro\s+(.+)$/i ) {
    # a macro definition
    my ($name, $args) = ($1, $2);
    my $cur_macro = $name;
    $macros{$name} = [ [split( /,\s*/, $args)], [] ];
    while( 1 ) {
      if( !scalar( @program ) ) {
        error( "The end of the macro was never seen" );
      }
      my $l = shift( @program );
      ($file, $line, $pline, $sline) = @$l;
      if( $pline =~ /^endm$/i ) {
        last;
      }
      elsif( $pline =~ /^\S+\s+macro/ ) {
        error( "Cannot define a macro inside of another macro" );
      }
      else {
        push( @{$macros{$cur_macro}[1]}, $l );
        add_line_to_listing( sprintf( "%4d %08x %-44s %s\n", $line, $op_pc, '', $sline ) );
      }
    }
    return 1;
  }
}

# handle_label
# this function handles a label definition by storing the PC
# where the label was found and backpatching all previous instances
# of that label with the correct offset.  This function
# handles both local labels and global labels.
sub handle_label {
  my ($label, $code) = $pline =~ /^(\S+):\s*(.+)?/;
  # if the label starts with a dollar sign, then it is a local label.
  if( $label =~ /^\$/ ) {
    # a local label
    if( exists( $local_label{ $label } ) ) {
      error( "local label '$label' already defined in $last_label!", $file, $line );      
    }
    if( exists( $local_fixup{ $label } ) ) {
      # backpatch everything with this PC.
      while(scalar(@{$local_fixup{$label}})) {
        my $op_pc=shift(@{$local_fixup{$label}});
        my $offset=shift(@{$local_fixup{$label}});
        substr($bytecode,$offset,sizeof('i'))=pack_arg('i', ($pc-$op_pc)/sizeof('i'));
      }
      delete($local_fixup{$label});  
    }
    $local_label{$label} = $pc;
  }
  else {
    # a global label
    if( exists( $label{ $label } ) ) {
      error( "'$label' already defined!", $file, $line );
    }
    if( exists( $fixup{$label} ) ) {
      # backpatch everything with this PC.
      while( scalar( @{ $fixup{ $label } } ) ) {
        my $op_pc = shift( @{ $fixup{ $label } } );
        my $offset = shift( @{ $fixup{ $label } } );
        substr($bytecode,$offset,sizeof('i'))=pack_arg('i', ($pc-$op_pc)/sizeof('i'));
      }
      delete($fixup{$label});  
    }

    # clear out any local labels
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

# expand_macro
# expands the macro into the @program array
# also replaces the macro arguments with the
# ones given to the macro.  NOTE: modifies @program.
sub expand_macro {
  my ($opcode, @args) = shift;
  my (@margs) = @{ $macros{$opcode}[0] };
  my (@macro);
  # we have to make sure to copy the macro, to avoid mangling the
  # original macro definition.
  foreach (@{ $macros{ $opcode }[1] } ) {
    push( @macro, [@$_] );
  }
  if( scalar(@margs) != scalar(@args) ) {
    error( "Wrong number of arguments to macro '$opcode'", $file, $line );
  }
  #fixup parameters.
  while( my $marg = shift( @margs ) ) {
    my $param = shift( @args );
    foreach( @macro ) {
      $_->[2] =~ s/([\s,])$marg\b/$1$param/g;
      $_->[3] =~ s/([\s,])$marg\b/$1$param/g;
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

# find_correct_opcode
# given an opcode like sin with arguments
# i n i, it will look through the opcode hash
# for a function that takes the correct number
# and types of arguments and is of the form
# sin(_x)* where x is one of i, n, s, p, ic, nc, or sc.
# It will prefer an exact argument match, but if one
# cannot be found, it will try to use ic for nc.
# It will stop on the first exact match, but will
# continue for non-exact matches to make sure the
# operator is unambiguous.
sub find_correct_opcode {
  my ($opcode,@args) = @_;
  my ($found_op, $ambiguous) = (0,0);
  my $match_level_2;
  my ($old_op) = $opcode;
  my @tests;

  $opcode=lc($opcode);
  if (!exists $opcodes{$opcode}) {
    # try to determine _real_ opcode.
    my @arg_t=();
    foreach (@args) {
      if(exists($equate{$_})) {
        # substitute the equate value
        if(ref($equate{$_})) {
          $_=&{$equate{$_}};
        } else {
          $_=$equate{$_};
        }
        $_ = replace_constants( $_ );
      }
      if(m/^([INPS])\d+$/) {
        # a register.
        push @arg_t,lc($1);
      } else {
        # a constant of some sort
        if(m/^\[(\d+)\]$/) {
          # string
          push @arg_t,'sc';
        } elsif(m/^((-?\d+)|(0b[01]+)|(0x[0-9a-f]+))$/i) {
          # integer
          push @arg_t,'ic';
        } elsif(m/^[\$A-Za-z_][\w]*$/i) {
          # label
          push @arg_t,'ic';
        } else {
          # numeric
          push @arg_t,'nc';
        }
      }
    }  
    # grep for operators that match the OP_ic_nc format where ic and nc
    # can be any of (i n s p ic nc sc).
    foreach my $op ( grep ( $_ =~ /^$opcode(?:_(?:(?:[ins]c?)|p))+$/, keys(%opcodes) ) ) {
      # remember what you have examined.
      push( @tests, $op );
      # make sure the argcount is the same
      next unless @args == $opcodes{$op}{ARGS};
      # assume a match
      my ($match) = 1;
      foreach my $idx ( 0 .. $#{ $opcodes{$op}{TYPES} } ) {
        # check each arg type.  assume ic can be used for nc, but prefer
        # ic match to ic.
        if( $type_to_suffix{ $opcodes{$op}{TYPES}[$idx] } ne $arg_t[$idx] ) {
          # if they are not the same check ic/nc
          if( $type_to_suffix{ $opcodes{$op}{TYPES}[$idx] } eq "nc" &&
              $arg_t[$idx] eq "ic" ) {
            # got ic/nc level 2 match
            $match = 2;
          }
          else {
            # no match...next operator attempt...
            $match = 0;
            last;
          }
        }
      }
      if( $match == 1 ) {
        # exact match...remember what you found and exit the loop
        $ambiguous = 0;
        $opcode = $op;
        $found_op = 1;
        last;
      }
      if( $match == 2 ) {
        # level two match...if there has been another level two match, it
        # is ambiguous and no operator can be chosen (unless there is an exact match).
        $ambiguous = 1 if $match_level_2;
        $match_level_2 = $op if !$ambiguous;
        $opcode = $op;
        $found_op = 1;
      }
    }
    if ($ambiguous) {
      error( "Ambiguous operator $old_op matches $opcode and $match_level_2\n", $file, $line );
    }
    
    if ($found_op) {
      log_message("substituting $opcode for $old_op" . (scalar(@tests) ? (" ( tried " . join(', ', @tests) . ")") : ''),$file,$line);
    }
    else {
      error("No opcode $opcode ( tried " . join(', ', @tests) . ") in <$pline>",$file,$line);
    }
  }
  return $opcode;
}

# handle_operator
# this function finds the correct opcode for the operator
# and packs the opcode into the output.
sub handle_operator {
  my ($opcode,@args) = @_;
  $opcode = lc($opcode);
  if( !exists $opcodes{$opcode} ) {
    $opcode = find_correct_opcode( $opcode, @args );
  }
  if( @args != $opcodes{$opcode}{ARGS} ) {
    error( "Wrong arg count--got " . scalar(@args) . " needed " . $opcodes{$opcode}{ARGS} . " in <$_>", $file, $line );
  }
  $bytecode .= pack_op( $opcodes{ $opcode }{ CODE } );
  $op_pc = $pc;
  $pc += sizeof( 'op' );
  return $opcode;
}

# handle_arguments
# packs the argument into the bytecode.
sub handle_arguments {
  my ($opcode, @args) = @_;
  foreach (0..$#args) {
    my($rtype)= $opcodes{$opcode}{TYPES}[$_];
    if($rtype eq "I" || $rtype eq "N" || $rtype eq "P" || $rtype eq "S") {
      # its a register argument
      $args[$_] =~ s/^[INPS](\d+)$/$1/i;
      error("Register $1 out of range (should be 0-31) in '$opcode'",$file,$line) if $1 < 0 or $1 > 31;
    }
    elsif($rtype eq "D") {
      # a destination
      if( $args[$_] =~ /^\$/ ) {
        # a local label
        if( !exists($local_label{$args[$_]}) ) {
          # we have not seen it yet...put it on the fixup list
          push(@{$local_fixup{$args[$_]}},$op_pc,$pc);
          $args[$_] = 0xffffffff;
        }
        else {                    
          $args[$_] = ($local_label{$args[$_]}-$op_pc)/sizeof('i');
        }
      }
      else {
        if( !exists($label{$args[$_]}) ) {
          # we have not seen it yet...put it on the fixup list
          push( @{ $fixup{ $args[$_] } }, $op_pc, $pc);
          $args[$_] = 0xffffffff;
        }
        else {                    
          $args[$_] = ($label{$args[$_]}-$op_pc) / sizeof('i');
        }
      }
    }
    elsif($rtype eq 's') {
      $args[$_] =~ s/[\[\]]//g;
    }
    else {
      $args[$_] = oct($args[$_]) if($args[$_]=~/^0[xb]?[0-9a-f]*$/);
    }
    $pc += sizeof($rtype);
    $bytecode .= pack_arg($rtype, $args[$_]);
  }
  return @args;
}

# add_line_to_listing
# adds a line to the listing string.
sub add_line_to_listing {
  $listing .= $_[0];
}

# error
# outputs and error message and exits.
sub error {
    my($message,$file,$line)=@_;
    print STDERR "Error ($file:$line): $message\n";
    exit 1;
}

# log_message
# outputs a message to the log( STDERR ).
sub log_message {
    my($message,$file,$line)=@_;
    if($options{'verbose'}) {
	print STDERR "INFO ($file:$line): $message\n";
    }
}

# constantize
# replaces some escape sequences in a string then adds the string
# to the constant array and hash, remembering the index into the array
# where the constant string is stored.  The hash is so duplicate strings
# do not get duplicated in the constants table.
sub constantize {
    my $s = shift;
    # handle \ characters in the constant
    my %escape = ('a'=>"\a",'n'=>"\n",'r'=>"\r",'t'=>"\t",'\\'=>'\\',);
    $s=~s/\\([anrt\\])/$escape{$1}/g;
    if(!exists($constants{$s})) {
	push(@constants,$s);
	$constants{$s}=$#constants;
    }
    return "[".$constants{$s}."]";
}

# read source
# reads in a file putting the informatino gathered into the @program
# array.  It also processes INCLUDE directives opening the included
# file and recursively processing it.
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
    foreach my $path (@include) {
	open($handle,"$path/$file") && do {
	    $found=1;
	    last;
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
