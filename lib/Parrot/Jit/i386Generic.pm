#
# Parrot::Jit::i386Generic;
#
# $Id$
#

package Parrot::Jit::i386Generic;

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

sub init() {
    my $start;
    $start .= "push \%ebp\n";
    $start .= "mov \%esp,\%ebp\n";

    $start = Parrot::Jit->Assemble($start);
    return $start; 
}

sub call($$) {
    my ($class,$argc,$argv) = @_;

    my ($k,$assembly,$j,$l);

    for($k = 0; $k < $argc; $k++) {
        $argv =~ s/([VA])([\&\*][a-zA-Z_]+\[\d+\])$//;
        $j = $1;
        $l = $2;
        if ($j eq 'V') {
            $assembly .= 'pushl L';
        } else {
            $assembly .= 'pushl ';
        }
        $assembly .= $l . "\n";
    }

    $assembly .= "call 0xffffffff\n";

    return Parrot::Jit->Assemble($assembly);
}

sub Fix_normal_call() {
    return Parrot::Jit->Assemble("addl \$8,\%esp\n");
}

sub Fix_cpcf_call() {
    return Parrot::Jit->Assemble("addl \$8,\%esp\njmp *(\%eax)\n");
}

sub Assemble($) {
    my ($class,$body) = @_;

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
            $body = Parrot::Jit->system_call($2,$3,$1) . $body;
            $ln--;
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
                $line =~ s/L?($Literal_Argument)/$DUMMY_ARG_L/;
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
    unlink TMP_AS or warn "Could not unlink " . TMP_AS . ": $!";
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
    $result =~ s/\\x00 \\x00 $// unless $result =~ m/\\x0f \\x82 \\x00 \\x00 \\x00 \\x00/;
    # These 2 are OK by now.
    $result =~ s/\\xff \\xff \\x00 \\x00 JUMP/JUMP/g;
    $result =~ s/\\x00 JUMP/JUMP/g;

    if (defined($Parrot::Jit::Correct_objdump_output)) {
        eval($Parrot::Jit::Correct_objdump_output);
    }
    
    print STDERR "\n\nResult:\n\n" if DEBUG;  
    
    print STDERR $result . "\n\n" if DEBUG;

    $result =~ s/\s//g;
    return $result;
}

1;
