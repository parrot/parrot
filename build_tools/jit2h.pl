#! /usr/bin/perl -w 
#
# jit2h.pl
#
# $Id$
#

use strict;
use Parrot::Jit;
use Parrot::OpLib::core;
use Parrot::Op;

my $core_numops = scalar(@$Parrot::OpLib::core::ops);
my @core_opfunc = map { $_->func_name } @$Parrot::OpLib::core::ops;

my $cpuarch = shift @ARGV;

#
# XXX I did NOT had the time to read the PMC code so I don't know if this
# structure will be enough, it will not.
#

my ($i,$j,$k,$n);

my ($function, $body, $line);

my ($position, $bytecode, $type, $number, $size, $char, $move, $strflag, $asm);

my (%core_ops, %string, %lib, $arg, $tmp, $which, $argc, $argv, $syscall, $tmp_bytecode, $nargop);

my (@values);
my (@value_p);
my (@value_n);
my (@value_f);

# Don't know if this should be keep separate per plataform, but that's easy.
my %Call = (
    "printf"                => 0,
    "fflush"                => 1,
    "string_copy"           => 2,
    "string_compare"        => 3,
    "pop_generic_entry"     => 4,
    "push_generic_entry"    => 5
);

sub readjit($) {
    my $file = shift;

    my %ops;

    open (IN,$file) or die "Can't open file $file: $!";
    while ($line = <IN>) {
        next if (($line =~ m/^[#;]/) || ($line =~ m/^\s*$/));
        if (!defined($function)) {
            $line =~ m/([^\s]*)\s*{/;
            $function = $1;
            $asm = "";
            next;
        }
        if ($line =~ m/}/) {
            $body = Parrot::Jit::Assemble($asm);
            $body =~ s/\s+//g;
            $ops{$function} = $body;
            $function = undef;
            $body = undef;
        }
        $asm .= $line;
    }
    return %ops;
}

%core_ops = readjit("jit/$cpuarch/core.jit");
%string = readjit("jit/$cpuarch/string.jit");
%lib = readjit("jit/$cpuarch/lib.jit");

for ($i = 0; $i < $core_numops; $i++) {
    $body = $core_ops{$core_opfunc[$i]};
    $body = "\\x00" unless defined $body;

    my $op = $Parrot::OpLib::core::ops->[$i];

    $bytecode = "";
    $move     = 0;
    $position = 0;
    @value_p  = ();
    @value_n  = ();
    @values   = ();

    while($move != length($body)) {
        $char = substr($body,$move,1);    
        if ($char eq '\\') {
            # Copy the byte
            $bytecode .= substr($body,$move,4);
            $move += 4;
            $position += 1;
        }
        elsif ($char eq 'J') {
            # JUMP
            
            # Refer to jit.pod for an explanation.
            
            $tmp_bytecode = "";
            $tmp = substr($body,index($body,'(',$move) + 1,index($body,')',$move) - index($body,'(',$move) - 1);
    
            $body =~ s/J[a-zA-Z_]*\([^\)]*\)//;
            if ($tmp eq 'END') {
                # Jump to the next op.
                $bytecode .= 'END';
                $position += 4;
            } elsif ($tmp =~ m/INT_CONST/) {
                $tmp =~ m/[\&\*]?[a-zA-Z_]+\[(\d+)\]/;
                $n = 24;
                $number = $1; 
                $values[$n]++;
                $bytecode .= '\\x00' x 4;
                $value_p[$n][$values[$n]] = $position;
                $value_n[$n][$values[$n]] = $number;
                $position += 4;
             } else {
                die "Don't know how to jump to: $tmp\n";
             }
        }
        elsif ($char eq 'C') {
            # call a C function

            $tmp_bytecode = "";
            $tmp = substr($body,index($body,'(',$move),index($body,')',$move) + 1);
            $tmp =~ m/(\w+),([^\)]*)\)/;
            $function = $1;
            $k = $argc = $argv = $2;

            # Contorned atempt to get argc
            $k =~ s/([VA][\*][a-zA-Z_]+\[\d+\])//g;
            $argc =~ s/([VA][\&][a-zA-Z_]+\[\d+\])//g;
            $k =~ s/[^\&]//g;
            $k = length($k);
            $argc =~ s/[^\*]//g;
            $argc = length($argc) + $k;

            if (defined($Call{$function})) {
                $n = 27;
                
                $j = 1;
                for($k = 0; $k < $argc; $k++) {
                    $argv =~ s/([VA])([\&\*][a-zA-Z_]+\[\d+\])$//;
                    if ($1 eq 'V') {
                        $tmp_bytecode .= $Parrot::Jit::Push_Inmediate . $2;
                        $j += 5;
                    } else {
                        $tmp_bytecode .= $Parrot::Jit::Push . $2;
                        $j += 6;
                    }
                }
                $tmp_bytecode .= $Parrot::Jit::Call . '\\x00' x 4;
                $values[$n]++;
                $value_p[$n][$values[$n]] = $position + $j;
                $value_n[$n][$values[$n]] = $Call{$function};
                $body =~ s/C[a-zA-Z_]*\([^\)]*\)/$tmp_bytecode/;
            } else {
                die "Unknown C function: " . $body . "\n";
            }
        }
        elsif ($char eq 'F') {
            # fuction
            $tmp_bytecode = "";
            $tmp = substr($body,index($body,'(',$move),index($body,')',$move) + 1);
            $tmp =~ m/(\w+),([^\)]*)\)/;
            $function = $1;
            $k = $argc = $argv = $2;
            if (defined($string{$function})) {
                $tmp_bytecode = $string{$function};
            } elsif (defined($lib{$function})) {
                $tmp_bytecode = $lib{$function};
            } else {
                die "Unknown function: $function called from: $body\n";
            }

            # Contorned atempt to get argc
            $k =~ s/([\*][a-zA-Z_]+\[\d+\])//g;
            $argc =~ s/([\&][a-zA-Z_]+\[\d+\])//g;
            $k =~ s/[^\&]//g;
            $k = length($k);
            $argc =~ s/[^\*]//g;
            $argc = length($argc) + $k;

            for($k = 0; $k < $argc; $k++) {
                $argv =~ s/([\&\*][a-zA-Z_]+\[\d+\])//; 
                $arg = $1;
                $tmp_bytecode =~ s/[\&\*]ARG\[\d+\]/$arg/;
            }
            $body =~ s/F[a-zA-Z_]*\([^\)]*\)/$tmp_bytecode/;
        }
        elsif ($char eq 'S') {
            # system call
            $tmp = substr($body,index($body,'(',$move),index($body,')',$move) + 1);
            $tmp =~ m/(\w+),(\d+),([^\)]*)\)/;
            $syscall = $1;
            $argc = $2;
            $argv = $3;

            $tmp_bytecode = Parrot::Jit::system_call($argc,$argv,$syscall);
            
            $body =~ s/S[a-zA-Z_]*\([^\)]*\)/$tmp_bytecode/;
        }
        elsif ($char =~ m/[\&\*]/) {
            # Copy \x00 * sizeof(INTVAL) to the bytecode and add to the list
            $tmp_bytecode = undef;

            $tmp = substr($body,$move,length($body) - $move + 1);
            $tmp =~ m/([\&\*][a-zA-Z_]+)\[(\d+)\]/;
            $type = $1;
            $number = $2;
            $strflag = undef;
            if ($type eq '&INT_REG') {
                $n = 0;
            }
            elsif ($type eq '&NUM_REG') {
                $n = 1;
            }
            elsif ($type eq '&STRING_REG') {
                $n = 2;
            }
            elsif ($type eq '&PR') {
                $n = 3;
            }
            elsif ($type eq '*INT_CONST') {
                $n = 4;
            }
            elsif ($type eq '*NUM_CONST') {
                $n = 5;
            }
            elsif ($type eq '*STRING_CONST') {
                $n = 6;
                $strflag = 0;
            }
            elsif ($type eq '*STRING_CONST_bufstart') {
                $n = 6;
                $strflag = 1;
            }
            elsif ($type eq '*STRING_CONST_buflen') {
                $n = 6;
                $strflag = 2;
            }
            elsif ($type eq '*STRING_CONST_flags') {
                $n = 6;
                $strflag = 3;
            }
            elsif ($type eq '*STRING_CONST_bufused') {
                $n = 6;
                $strflag = 4;
            }
            elsif ($type eq '*STRING_CONST_strlen') {
                $n = 6;
                $strflag = 5;
            }
            elsif ($type eq '*STRING_CONST_encoding') {
                $n = 6;
                $strflag = 6;
            }
            elsif ($type eq '*STRING_CONST_type') {
                $n = 6;
                $strflag = 7;
            }
            elsif ($type eq '*STRING_CONST_language') {
                $n = 6;
                $strflag = 8;
            }
            elsif ($type eq '*PC') {
                $n = 7;
            }
            elsif ($type eq '&INT_CONST') {
                $n = 8;
            }
            elsif ($type eq '&NUM_CONST') {
                $n = 9;
            }
            elsif ($type eq '&STRING_CONST') {
                $n = 10;
                $strflag = 0;
            }
            elsif ($type eq '&STRING_CONST_bufstart') {
                $n = 10;
                $strflag = 1;
            }
            elsif ($type eq '&STRING_CONST_buflen') {
                $n = 10;
                $strflag = 2;
            }
            elsif ($type eq '&STRING_CONST_flags') {
                $n = 10;
                $strflag = 3;
            }
            elsif ($type eq '&STRING_CONST_bufused') {
                $n = 10;
                $strflag = 4;
            }
            elsif ($type eq '&STRING_CONST_strlen') {
                $n = 10;
                $strflag = 5;
            }
            elsif ($type eq '&STRING_CONST_encoding') {
                $n = 10;
                $strflag = 6;
            }
            elsif ($type eq '&STRING_CONST_type') {
                $n = 10;
                $strflag = 7;
            }
            elsif ($type eq '&STRING_CONST_language') {
                $n = 10;
                $strflag = 8;
            }
            elsif ($type eq '&PC') {
                $n = 11;
            }
            elsif ($type eq '&TEMP_INT') {
                $n = 12;
            }
            elsif ($type eq '&TEMP_NUM') {
                $n = 13;
            }
            elsif ($type eq '&TS') {
                $n = 14;
            }
            elsif ($type eq '&TEMP_CHAR') {
                $n = 15;
            }
            elsif ($type eq '*CONST_INTVAL') {
                $n = 16;
            }
            elsif ($type eq '&CONST_INTVAL') {
                $n = 20;
            }
            elsif ($type eq '&CONST_FLOAT') {
                $n = 21;
            }
            elsif ($type eq '&CONST_CHAR') {
                $n = 23;
            }
            elsif ($type eq '*JUMP_INT_CONST') {
                $n = 24;
            } 
            elsif ($type eq '&INTERPRETER') {
                $n = 28;
            } 
            elsif ($type eq '*CUR_OPCODE') {
                $n = 29;
            } 
            else {
                die "Unknown type: $type\n";
            }

            $values[$n]++;
            $bytecode .= '\\x00' x 4;
            $value_p[$n][$values[$n]] = $position;
            $value_n[$n][$values[$n]] = $number;
            $value_f[$n][$values[$n]] = $strflag;
            $move += length($type) + length($number) + 2;
            $position += 4;
        }
        else {
            die "Syntax wrong: $body\nUnknown identifier: $char at $move\n";
        }
    }
    $tmp_bytecode = "";
    while ($bytecode =~ m/END/) {
        $tmp_bytecode="";
        $tmp = substr($bytecode,index($bytecode,'E'),length($bytecode) - index($bytecode,'N'));
        $tmp    =~ s/[^x]//g;
        $tmp   =  length($tmp);
        $tmp = sprintf("%x",$tmp);
        for ($k = 1; $k <= 4; $k++) {
            if ($tmp) {
                $tmp =~ s/(.?.)$//;
                $j = $1;
                $j = "0" . $j if length($j) == 1;
             } else {
                $j = "00";
             }
             $tmp_bytecode .= "\\x" . $j; 
        }
        $bytecode =~ s/END/$tmp_bytecode/;
    }

    $tmp    =  $bytecode;
    $tmp    =~ s/[^x]//g;
    $size   =  length($tmp);

    $nargop =  $op->size;

#    print STDERR "Shipping out code for " . $op->func_name . "...\n";

    print <<END;
{ /* op $i: $core_opfunc[$i] */
  "$bytecode",
  $size,
  $nargop,
END

    for ($k = 0; $k <= 29; $k++) {
        print "  {\n";

        if (defined($values[$k])) {
            print "    ", $values[$k], ",\n";
            print "    {\n";

            for($j = 1; $j <= $values[$k]; $j++) {
                print("      {", $value_p[$k][$j], ", ", $value_n[$k][$j]);
                print(", ", $value_f[$k][$j]) if (defined($value_f[$k][$j]));
                print("},\n");
            }

            print "    }\n";
        }
        else {
            print "    0,\n";
            print "    {\n";
            if ($k == 6 or $k == 10) {
                # The two string_substitution_t values in the struct:
                print "      {0, 0, 0},\n";
            } else {
                print "      {0, 0},\n";
            }
            print "    }\n";
        }

        print "  },\n";
    }

    print "},\n";
}


