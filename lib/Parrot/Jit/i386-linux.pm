#
# Parrot::Jit;
#
# $Id$
#

package Parrot::Jit;

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
my $DUMMY_ARG_P = '($0x0)';
my $DUMMY_ARG_L = '$0xffffff00';

my ($debug, $line, $ln, $assembler,$n,$s);

$Push_Inmediate = '\\x68';
$Push = '\\xff\\x35';
$Call = '\\xe8';

my %syscall_number = (
    "WRITE"         => 4,
    "GETTIMEOFDAY"  => 78
);

sub system_call($$$) {
    my ($arg_c,$arg_v,$sys_n) = @_;

    my ($t,$sc,$k,$j);

    my @mov_v = (
                 "\\xbb",
                 "\\xb9",
                 "\\xba",
                 "\\xbe",
                 "\\xbf",
                 "\\xbd"
                );

    my @mov_a = (
                 "\\x1d",
                 "\\x0d",
                 "\\x15",
                 "\\x35",
                 "\\x3d",
                 "\\x2d"
                );

    $sys_n = $syscall_number{$sys_n};

    for ($k = 0; $k < $arg_c; $k++) {
        $arg_v =~ s/([VA])([\&\*][a-zA-Z_]+\[\d+\])//; 
        $t = $1;
        $j = $2;
        if ($t eq 'V') {
            $sc .= $mov_v[$k] . $j;
        } elsif ($t eq 'A') { 
            $sc .= "\\x8b" . $mov_a[$k] . $j;
        }
    }
        
    $sc .= "\\xb8";

    $sys_n = sprintf("%x",$sys_n);
    for ($k = 1; $k <= 4; $k++) {
        if ($sys_n) {
            $sys_n =~ s/(.?.)$//;
            $j = $1;
            $j = "0" . $j if length($j) == 1;
         } else {
            $j = "00";
         }
         $sc .= "\\x" . $j; 
    }

    $sc .= "\\xcd\\x80\\x72\\x00";
    return $sc;
}

sub Assemble($) {
    my ($body) = @_;

    my (@special,@special_arg);

    $ln = 0;
    $body =~ s/([^\n]*)\n//;
    $line = $1;
    $assembler = "";
    while (defined($line)) {
        $line =~ s/^\s*//;
        if (($line =~ m/^J/) || ($line =~ m/^C/) || ($line =~ m/^F/) || ($line =~ m/^S/)) {
           $assembler .= DUMMY_INSTR . "\n";
           # Store the special instruction in the line where it will go.
           $special[$ln] = $line;
        } elsif ($line =~ m/$Argument/) {
            $n = 0;
            while ($line =~ m/$Pointer_Argument/) {
                $line =~ s/L($Pointer_Argument)/$DUMMY_ARG_L/;
                $line =~ s/($Pointer_Argument)/$DUMMY_ARG_P/;
                if (defined($1)) {
                    $special_arg[$ln][$n++] = $1;
                }
            }
            while ($line =~ m/$Literal_Argument/) {
                $line =~ s/L($Literal_Argument)/$DUMMY_ARG_P/;
                $line =~ s/($Literal_Argument)/$DUMMY_ARG_L/;
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
.globl _main
    .type _main , \@function
_main:
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

	while (<$objdump>) { last if /<_main>:$/ }

    $ln = 0;
	while (<$objdump>) {
        if (m/^\s*$/) {
            <$objdump>;
            next;
        }
		my ($opcodes, $instr, $args) =
			/^\s* \w+: \s+ ( (?:\w\w\s)+ ) \s+ (\w+) \s+ (.+)/x;

        if ((defined($opcodes)) && (defined($instr))) {
            if (($instr eq DUMMY_INSTR) && defined(@$si[$ln])) {
                $result .= @$si[$ln];
            } else {
                $opcodes =~ s/(\w\w\s)/\\x$1/g;
                if (defined(@$sa[$ln])) {
                    $n = 0;
                    # hmmm....
                    while ($opcodes =~ m/(\\x00\s){4}/) {
                        @t = @$sa[$ln];
                        $s = $t[0][$n++];
                        $opcodes =~ s/(\\x00\s){4}/$s /;
                    }
                    while ($opcodes =~ m/(\\x00\s)(\\xff\s){3}/) {
                        @t = @$sa[$ln];
                        $s = $t[0][$n++];
                        $opcodes =~ s/(\\x00\s)(\\xff\s){3}/$s /;
                    }
                }
                $result .= $opcodes;
            }
        }
        $ln++;
		print STDERR $_ if DEBUG;
	}
	print STDERR "\n\n" if DEBUG;

    # FIXME
    $result =~ s/\\x00 \\x00 $//;
    # These 2 are OK by now.
    $result =~ s/\\x\w\w \\xff \\xff \\xff JUMP/JUMP/g;
    $result =~ s/\\x00 JUMP/JUMP/g;
    # XXX:These is a hack to make the jit in redhat.
    $result =~ s/\\x90 $//;

    $result =~ s/\s+//g;
    return $result;
}

1;
