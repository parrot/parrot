#
# Parrot::Jit::alphaGeneric;
# 
# $Id$
#

package Parrot::Jit::alphaGeneric;

use IO::File;

use constant DEBUG   => 0;

use constant TMP_OBJ => "t.o";
use constant TMP_AS  => "t.s";

use constant DUMMY_INSTR => 'nop';

use constant OBJDUMP => "objdump -w -d";
use constant AS      => "as";

my $Argument = '[\&\*][a-zA-Z_]+\[\d+\]';
my $Pointer_Argument = '\&[a-zA-Z_]+\[\d+\]';
my $Literal_Argument = '\*[a-zA-Z_]+\[\d+\]';
my $DUMMY_INTERPRETER_REG = '0($6)';
my $DUMMY_NUM_CONSTANT = '0($7)';


sub init() {
   my $start = sprintf <<END;
   lda \$30,-16(\$30)
   stq \$26,0(\$30)
   stq \$15,8(\$30)
   mov \$30,\$15
   mov \$16,\$6
   mov \$17,\$7
   mov \$18,\$8
END

    $start = Parrot::Jit->Assemble($start);
    return $start; 
}

sub system_call($$$) {
    my ($class,$arg_c,$arg_v,$sys_n) = @_;

    my ($t,$sc,$k,$j,$n);

    for($k = 0; $k < $arg_c; $k++) {
        $n = $k +16;
        $arg_v =~ s/([VA])([\&\*][a-zA-Z_]+\[\d+\])\s*//; 
        $t = $1;
        $j = $2;
        if ($j =~ m/CPU_REG\[(\d+)\]/) {
            $sc .= 'mov $' . $n . ",\$" . $1 . "\n" if (($k + 16) != $1);
            next;
        }
        if (($j =~ m/INTERPRETER/) || ($j =~ m/CUR_OPCODE/) || ($j =~ m/CONST/)) {
            $sc .= 'ldah $' . $n . ",1(\$27)\n";
        }
        if ($t eq 'V') {
            $sc .= 'lda $';
        } elsif ($t eq 'A') { 
            $sc .= 'ldq $';
        }
        $sc .= $n . "," . $j . "\n";
    }

    $sys_n = $Parrot::Jit::syscall_number{$sys_n};

    $sc .= 'lda $0,' . $sys_n . "\n";
    $sc .= "callsys\n";

    return $sc;
}

sub call($$) {
    my ($class,$argc,$argv) = @_;

    my ($k,$assembly,$j,$l);

    $Parrot::Jit::Call_move = 0;
    for($k = 0; $k < $argc; $k++) {
        $n = $k + 16;
        $argv =~ s/([VA])([\&\*][a-zA-Z_]+\[\d+\])//;
        $j = $1;
        $l = $2;
        if (($l =~ m/INTERPRETER/) || ($l =~ m/CUR_OPCODE/) || ($l =~ m/CONST/)) {
            $assembly .= 'ldah $' . $n . ",1(\$27)\n";
            $Parrot::Jit::Call_move += 4;
        }
        if ($j eq 'V') {
            $assembly .= 'lda $';
        } else {
            $assembly .= 'ldq $';
        }
        $assembly .= $n . ',' . $l . "\n";
    }

    # Store our reserved registers in the stack
    $assembly .= "lda \$30,-16(\$30)\nstq \$6,0(\$30)\nstq \$27,8(\$30)\n";
    # Update $t12 and go.
    $assembly .= "ldah \$1,1(\$27)\nlda \$1,1(\$1)\nmov \$1,\$27\nbsr \$26,0\n";
    # Restore them
    $assembly .= "ldq \$6,0(\$30)\nldq \$27,8(\$30)\nlda \$30,16(\$30)\n";

    return Parrot::Jit->Assemble($assembly);
}

sub Fix_normal_call() {
    return "";
}

sub Fix_cpcf_call() {
    return Parrot::Jit->Assemble("ldq \$0,0(\$0)\njsr \$31,(\$0),0\n");
}

sub Assemble($) {
    my ($class,$body) = @_;

    my ($line, $ln, $assembler,$n,$s);
    my (@special,@special_arg);

    $ln = 0;
    $body =~ s/([^\n]*)\n//;
    $line = $1;
    $assembler = "";
    while (defined($line)) {
        $line =~ s/^\s*//;
        if (($line =~ m/^J/) || ($line =~ m/^C/) || ($line =~ m/^F/)) {
            $assembler .= DUMMY_INSTR . "\n";
            # Store the special instruction in the line where it will go.
            $special[$ln] = $line;
        } elsif ($line =~ m/^S/) {
            $line =~ m/\((\w+)\s*,\s*(\d+)\s*,\s*([^\)]*)\)\s*/;
            $body = system_call($2,$3,$1) . $body;
            $ln--;
        } elsif ($line =~ m/$Argument/) {
            $n = 0;
            if ($line =~ m/NUM_CONST/) {
                $line =~ s/($Argument)/$DUMMY_NUM_CONSTANT/;
                if (defined($1)) {
                    $special_arg[$ln][$n++] = $1;
                }
            } elsif (($line =~ m/INTERPRETER/) || ($line =~ m/CUR_OPCODE/) || ($line =~ m/CONST/)) {
                $line =~ s/\$(f?\d+)\s*,\s*($Argument)/\$$1,1(\$$1)/;
                if (defined($2)) {
                    $special_arg[$ln][$n++] = $2;
                }
            } else {
                $line =~ s/($Argument)/$DUMMY_INTERPRETER_REG/;
                if (defined($1)) {
                    $special_arg[$ln][$n++] = $1;
                }
            }
            $assembler .= $line . "\n";
        } else { 
            $assembler .= $line . "\n";
        }
        $ln++;
        $body =~ s/([^\n]*)\n//;
        $line = $1;
    }

    write_as($assembler,TMP_AS);
    assemble(TMP_AS, TMP_OBJ);
    return disassemble(TMP_OBJ,\@special_arg,\@special,$ln);
}
            
sub write_as($$) {
	my ($code, $target) = @_;

	my $out = new IO::File "> $target"
		or die "Could not write to $target: $!";

    print $out <<END;
main:
END
    print $out $code;
}

sub assemble($$) {
	my ($file, $obj) = @_;

	print STDERR "Assembling:\n\n", (new IO::File $file)->getlines, "\n\n"
		if DEBUG;

	system AS." $file -o $obj";
	die AS." $file failed" if (($? >> 8) != 0);
}

sub disassemble($$$$) {
	my ($obj,$sa,$si,$l) = @_;

    my ($result,@t);

	print STDERR "Disassembly:\n\n" if DEBUG;

	my $objdump = new IO::File OBJDUMP." $obj |"
		or die "Could not run ".OBJDUMP." $obj: $!";

	while (<$objdump>) { last if /<main>:$/ }

    $ln = 0;
	while (<$objdump>) {
        if (m/^\s*$/) {
            <$objdump>;
            next;
        }
		my ($opcodes, $instr, $args) =
			/^\s* \w+: \s+ ( (?:\w\w\s)+ ) \s+ (\w+) \s+ (.+)?/x;

        if ((defined($opcodes)) && (defined($instr))) {
            if (($instr eq DUMMY_INSTR) && defined(@$si[$ln])) {
                $result .= @$si[$ln];
            } else {
                $opcodes =~ s/(\w\w\s)/\\x$1/g;
                if (defined(@$sa[$ln])) {
                    $n = 0;
                    if ($opcodes =~ m/^(\\x0[01]\s){2}/) {
                        @t = @$sa[$ln];
                        $s = $t[0][$n++];
                        $opcodes =~ s/(\\x0[01]\s){2}/$s /;
                    }
                }
                $result .= $opcodes;
            }
        }
        $ln++;
		print STDERR $_ if DEBUG;
	}

    $result =~ s/\\x00 \\x00 (\\x.. \\x.. )JUMP\(([^\)]*)\)/JUMP($2) $1/;
    
	print STDERR "\n\nResult:\n\n" if DEBUG;

	print STDERR $result . "\n\n" if DEBUG;

    $result =~ s/\s//g;
    return $result;
}

1;
