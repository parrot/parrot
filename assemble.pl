#! /usr/bin/perl -w
#
# assemble.pl - take a parrot assembly file and spit out a bytecode file
#   This is based heavily on assemble.pl by Dan Sugalski
# Brian Wheeler (bdwheele@indiana.edu)

use strict;
use Getopt::Long;
use Parrot::Opcode;
use Parrot::Config;
use Symbol;

my %options;
GetOptions(\%options,('checksyntax',
		      'help',
		      'version',
		      'verbose',
		      'output=s',
		      'listing=s'));

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

# define data types
my %pack_type;
# Alas perl5.7.2 doesn't have an IV flag for pack().
if ($PConfig{ivsize} == $PConfig{longsize}) {
    %pack_type = ('i'=>'l!','n'=>'d');
}
elsif ($PConfig{ivsize} == 8) {
    %pack_type = ('i'=>'q','n'=>'d');
}
elsif ($PConfig{ivsize} == 4) {
    %pack_type = ('i'=>'l','n'=>'d');
}
else {
    die("I don't know how to pack an IV!\n");
}

my(%real_type)=('I'=>'i','i'=>'i',
                'N'=>'i','n'=>'n',
                'S'=>'i','s'=>'i',
                'D'=>'i');
my(%type_swap)=('I'=>'i',  'N'=>'n',
                'S'=>'s',  'P'=>'p',
                'i'=>'ic', 'n'=>'nc',
                's'=>'sc', 'D'=>'ic');

# compute sizes
my(%sizeof);
foreach (keys(%real_type)) {
    $sizeof{$_}=length(pack($pack_type{$real_type{$_}},0));
}


# get opcodes
my %opcodes = Parrot::Opcode::read_ops(-f "../opcode_table" ? "../opcode_table" : "opcode_table");

constantize(Parrot::Opcode::fingerprint()); # Make it constant zero.

my $listing="PARROT ASSEMBLY LISTING - ".scalar(localtime)."\n\n";


# read source/include processing
my(@program);
foreach my $file (@ARGV) {
    push(@program,read_source($file));
}


# assemble
my $pc=0; my $op_pc=0;
my ($bytecode,%label,%fixup,%constants,@constants);
my (%local_label, %local_fixup, $last_label, %macros);
my $line=0;
my %equate=('*'=>sub { return $pc },
	    '__DATE__'=>'"'.scalar(localtime).'"',
	    '__VERSION__'=>'" $Revision$ "',
	    '__LINE__' => sub { return $line });
my($code,$in_macro,$cur_macro);
while(my $l=shift(@program)) {
    my($file,$line,$pline,$sline)=@$l;
    if($in_macro) {
	if($pline=~m/^endm$/i) {
	    # end of the macro
	    $in_macro=0;
	} else {
	    push(@{$macros{$cur_macro}[1]},$l);
	}
	$pline="";
    }
    if($pline=~m/^\#/ || $pline eq "") {
	# its a comment, do nothing
	$code=undef;
    } else {
	my($label);
	if($pline=~m/^(\S+):\s*(.+)?/) {
	    ($label,$code)=($1,$2);
	    if(defined($label) && $label ne "") {
		if($label=~m/^\$/) {
		    # a local label
		    if(exists($local_label{$label})) {
			error("local label '$label' already defined in $last_label!",$file,$line);
		    }
		    if(exists($local_fixup{$label})) {
			# backpatch everything with this PC.
			while(scalar(@{$local_fixup{$label}})) {
			    my $op_pc=shift(@{$local_fixup{$label}});
			    my $offset=shift(@{$local_fixup{$label}});
			    substr($bytecode,$offset,$sizeof{'i'})=pack($pack_type{'i'},($pc-$op_pc)/$sizeof{'i'});
			}
			delete($local_fixup{$label});  
		    }
		    $local_label{$label}=$pc;
		} else {
		    # a global label
		    if(exists($label{$label})) {
			error("'$label' already defined!",$file,$line);
		    }
		    if(exists($fixup{$label})) {
			# backpatch everything with this PC.
			while(scalar(@{$fixup{$label}})) {
			    my $op_pc=shift(@{$fixup{$label}});
			    my $offset=shift(@{$fixup{$label}});
			    substr($bytecode,$offset,$sizeof{'i'})=pack($pack_type{'i'},($pc-$op_pc)/$sizeof{'i'});
			}
			delete($fixup{$label});  
		    }
		    
		    # clear out any local labels
		    %local_label = ();
		    if(keys(%local_fixup)) {
			# oops, some local labels are unresolved
			error("These local labels were undefined in $last_label: ".
			      join(",",sort(keys(%local_fixup))),$file,$line);
		    }
		    $label{$label}=$pc; # store it.
		    $last_label=$label;
		}
	    } 
	} else {
	    # here's where we can catch assembler directives!
	    if($pline=~m/^([_a-zA-Z]\w*)\s+equ\s+(.+)$/i) {
		my($name,$data)=($1,$2);
		$equate{$name}=$data;
	    } elsif($pline=~m/^([_a-zA-Z]\w*)\s+macro\s+(.+)$/i) {
		# a macro definition
		my($name,$args)=($1,$2);
		$cur_macro=$name;
		$macros{$name}=[[split(/,\s*/,$args)],[]];
		$in_macro=1;
	    } else {
		$code=$pline;
	    }
	}
    }
    if(!defined($code)) {
	$listing.=sprintf("%4d %08x %-44s %s\n", $line, $op_pc, '',$sline)
	    if($options{'listing'});
	next;
    }

    1 while $code=~s/\"([^\\\"]*(?:\\.[^\\\"]*)*)\"/constantize($1)/eg;
    $code=~s/,/ /g;
    my($opcode,@args)=split(/\s+/,$code);    
    if(exists($macros{$opcode})) {
	# found a macro
	my(@margs)=@{$macros{$opcode}[0]};
	my(@macro);
	# we have to make sure to copy the macro, to avoid mangling the
	# original macro definition.
	foreach (@{$macros{$opcode}[1]}) {
	    push(@macro,[@$_]);
	}
	if(scalar(@margs) != scalar(@args)) {
	    error("Wrong number of arguments to macro '$opcode'",$file,$line);
	}
	# fixup parameters.
	while(my $marg=shift(@margs)) {
	    my $param=shift(@args);
	    foreach (@macro) {
		$_->[2]=~s/([\s,])$marg\b/$1$param/g;
		$_->[3]=~s/([\s,])$marg\b/$1$param/g;
	    }
	}

	# fixup file, line number, listing
	foreach (@macro) {
	    $_->[0]=$file;
	    $_->[1]=$line;
	    $_->[3]="> ".$_->[3];
	}
	unshift(@program,@macro);

	# make it come out correctly on the listing.
	$l->[2]='';
	unshift(@program,$l);
	next;
    }
    
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
		s/\"([^\\\"]*(?:\\.[^\\\"]*)*)\"/constantize($1)/eg;
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
	
	my ($found_op, $ambiguous) = (0,0);
        my $match_level_2;
        my ($old_op) = $opcode;
	my @tests;

        # grep for operators that match the OP_ic_nc format where ic and nc can be any
        # of (i n s ic nc sc p).
        foreach my $op ( grep ( $_ =~ /^${opcode}(?:_(?:(?:[ins]c?)|p))+$/, keys(%opcodes) ) ) {
          # remember what you have examined.
          push( @tests, $op );
          # make sure the argcount is the same
          next unless @args == $opcodes{$op}{ARGS};
          # assume a match
          my ($match) = 1;
          foreach my $idx ( 0 .. $#{ $opcodes{$op}{TYPES} } ) {
            # check each arg type.  assume ic can be used for nc, but prefer
            # ic match to ic.
            if( $type_swap{ $opcodes{$op}{TYPES}[$idx] } ne $arg_t[$idx] ) {
              # if they are not the same check ic/nc
              if( $type_swap{ $opcodes{$op}{TYPES}[$idx] } eq "nc" &&
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
          error("Ambiguous operator $old_op matches $opcode and $match_level_2\n",$file,$line);
        }
    
        if ($found_op) {
	    log_message("substituting $opcode for $old_op" . (scalar(@tests) ? (" ( tried " . join(', ', @tests) . ")") : ''),$file,$line);
	} else {
	    error("No opcode $opcode ( tried " . join(', ', @tests) . ") in <$pline>",$file,$line);
	}
    }
    if (@args != $opcodes{$opcode}{ARGS}) {
      error("Wrong arg count--got ".scalar(@args)." needed ".$opcodes{$opcode}{ARGS}." in <$_>" ,$file,$line);
    }
    $bytecode .= pack $pack_type{'i'}, $opcodes{$opcode}{CODE};
    $op_pc=$pc;
    $pc+=$sizeof{'i'};
    
    foreach (0..$#args) {
	my($rtype)=$opcodes{$opcode}{TYPES}[$_];
	my($type)=$real_type{$opcodes{$opcode}{TYPES}[$_]};
	if($rtype eq "I" || $rtype eq "N" || $rtype eq "P" || $rtype eq "S") {
	    # its a register argument
	    $args[$_]=~s/^[INPS](\d+)$/$1/i;
	    $pc+=$sizeof{$rtype}
	} elsif($rtype eq "D") {
	    # a destination
	    if($args[$_]=~/^\$/) {
		# a local label
		if(!exists($local_label{$args[$_]})) {
		    # we have not seen it yet...put it on the fixup list
		    push(@{$local_fixup{$args[$_]}},$op_pc,$pc);
		    $args[$_]=0xffffffff;
		} else {                    
		    $args[$_]=($local_label{$args[$_]}-$op_pc)/$sizeof{'i'};
		}
	    } else {
		if(!exists($label{$args[$_]})) {
		    # we have not seen it yet...put it on the fixup list
		    push(@{$fixup{$args[$_]}},$op_pc,$pc);
		    $args[$_]=0xffffffff;
		} else {                    
		    $args[$_]=($label{$args[$_]}-$op_pc)/$sizeof{'i'};
		}
	    }
	    $pc+=$sizeof{$rtype};
	} elsif($rtype eq 's') {
	    $args[$_]=~s/[\[\]]//g;
	    $pc+=$sizeof{$rtype};           
	} else {
	    $args[$_]=oct($args[$_]) if($args[$_]=~/^0/);
	    $pc+=$sizeof{$rtype};           
	}
	$bytecode .= pack $pack_type{$type}, $args[$_];
    }
    if($options{'listing'}) {
	# add line to listing.
	my $odata;
	foreach (unpack('l*',substr($bytecode,$op_pc))) {
	    $odata.=sprintf("%08x ",$_);
	}
	$listing.=sprintf("%4d %08x %-44s %s\n", $line, $op_pc, $odata,$sline);
    }
}
$listing.="\n" if($options{'listing'});

my $output;

# build file in memory

# MAGIC COOKIE
$output=pack($pack_type{i},0x13155a1);


# FIXUP (also, dump listing symbols)
if($options{'listing'}) {
    $listing.="\nDEFINED SYMBOLS:\n";
    foreach (sort(keys(%label))) {
	$listing.=sprintf("\t%08x   %s\n",$label{$_},$_);
    }
}

if(keys(%fixup)) {
    print STDERR "SQUAWK!  These symbols were referenced but not defined:\n";
    foreach (sort(keys(%fixup))) {
        print STDERR "\t$_ at pc: ";
        foreach my $pc (@{$fixup{$_}}) {
            print STDERR sprintf("%08x ",$pc);
        }
        print STDERR "\n";
    }
    $listing.="\nUNDEFINED SYMBOLS:\n";
    foreach (sort(keys(%fixup))) {
	$listing.="\t$_\n";
    }
    exit;  # some day, unresolved symbols won't be an error!
} else {
    # dump empty header
    $output.=pack($pack_type{i},0);
}

# CONSTANTS
if(@constants) {
    my($const);
    # Then spit out how many constants there are, so we can allocate
    $const .= pack($pack_type{i}, scalar @constants);

    if($options{'listing'}) {
	$listing.="\nSTRING CONSTANTS\n";
    }
    # Now emit each constant
    my $counter=0;
    for (@constants) {
        $const .= pack($pack_type{i},0) x 3; # Flags, encoding, type
        $const .= pack($pack_type{i},length($_)); # Strlen followed by that many bytes.
        $const .= $_;
        my $pad=(length($_) % $sizeof{i});
        if($pad) {
            $const .= "\0" x ($sizeof{i}-(length($_) % $sizeof{i})); # Padding;
	}
	$listing.=sprintf("\t%04x %08x [[%s]]\n",$counter,length($_),$_) 
	    if($options{'listing'});
	$counter++;
    }

    $output.=pack($pack_type{i},length($const));
    $output.=$const;
} else {
    # no constants, dump empty header.
    $output.=pack($pack_type{i},0);
}

## BYTECODE
$output.=$bytecode;

if(!$options{'checksyntax'}) {
    if(defined $options{'output'} and $options{'output'} ne "") {
	open O,">$options{'output'}" || die $!;
	binmode O;
	print O $output;
	close O;
    } else {
	binmode STDOUT;
	print $output;
    }
}


if($options{'listing'}) {
    open L,">$options{'listing'}" || die $!;
    print L $listing;
    close L;
}

###############################
# Helper Subroutines
###############################

sub error {
    my($message,$file,$Line)=@_;
    print STDERR "Error ($file:$line): $message\n";
    exit;
}

sub log_message {
    my($message,$file,$line)=@_;
    if($options{'verbose'}) {
	print STDERR "INFO ($file:$line): $message\n";
    }
}


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

sub read_source {
    my($file,$ofile,$oline)=@_;
    my($line)=1;
    my(@lines);
    my($handle)=gensym;
    open($handle,$file) || error("Cannot open $file for input!",$ofile,$oline);
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
