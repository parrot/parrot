#
# Parrot::Jit::sun4Generic;
# 
# $Id $
#

package Parrot::Jit::sun4Generic;

use IO::File;

use constant DEBUG   => 0;

use constant TMP_OBJ => "t.o";
use constant TMP_AS  => "t.s";

use constant DUMMY_INSTR => 'nop';

my $Argument = '[\&\*][a-zA-Z_]+\[\d+\]';
my $Pointer_Argument = '\&[a-zA-Z_]+\[\d+\]';
my $Literal_Argument = '\*[a-zA-Z_]+\[\d+\]';

# Base address of registers are stored in the following CPU registers
my %register_base_map = ( INT => "%i0", NUM => "%i1", STR => "%i2" );
my $DUMMY_ARG_P = '[%l2 + 1]';
my $DUMMY_ARG_L = '%lo(1)';


sub init() {
   # just need to adjust the stack pointer
   my $start =<<END; 
   save    \%sp, -104, \%sp
END

    $start = Parrot::Jit->Assemble($start);
    return $start; 
}

# No working system call!!!!!
sub system_call($$$) {
    my ($class,$arg_c,$arg_v,$sys_n) = @_;

    die "No system calls yet\n";
}

sub call($$) {
    my ($class,$argc,$argv) = @_;

    my ($k,$assembly,$j,$l);

    $Parrot::Jit::Call_move = 0;
    for($k = 0; $k < $argc; $k++) {
        $argv =~ s/([VA])([\&\*][a-zA-Z_]+\[\d+\])//;
        $j = $1;
        $l = $2;

	# SPARC calling conventions - for < 6 arguments uses %o1, %o2 etc
        if ($j eq 'V') {
            $assembly .= "sethi \%hi(0), \%l1\n";
            $assembly .= "or %l1, L$l, \%o$k\n";
        } else {
            $assembly .= "sethi \%hi(0), \%l1\n";
            $assembly .= "ld $l, \%o$k\n";
        }
    }

    # call and link to 30 bit offset
    $assembly .= "HE:call HE\nnop\n";
    return Parrot::Jit->Assemble($assembly);
}

sub Fix_normal_call() {
    return "";
}

sub Fix_cpcf_call() {
    # return value from function cur_opcode in %o0, jump to *cur_opcode, which
    # has been modified by jit to contain corresponding jit code
    return Parrot::Jit->Assemble("ld [\%o0], \%o0\njmpl \%o0, \%g0\n");
}

sub Assemble($) {
    my ($class,$body) = @_;

    my ($line, $ln, $assembler,$n,$s, $reg_class);
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
        } elsif (($reg_class) = $line =~ m/(INT|NUM|STR)_REG/) {
	    # map parrot register set to appropriate base CPU register
            $n = 0;
            $line =~ s/($Argument)/[ $register_base_map{$reg_class} + 1 ]/;
	    if(defined($1)) {
		$special_arg[$ln][$n++] = $1;
	    }
            $assembler .= $line . "\n";
        } elsif ($line =~ m/\*JUMP_INT_CONST/) {
	    # This is good for 22-bit branches (which have a 24 bit range)
	    $n = 0;
	    $line =~ s/($Argument)/_$ln/;
	    if(defined($1)) {
		$special_arg[$ln][$n++] = $1;
	    }
            $assembler .= $line . "\n_$ln:\n";
        } elsif ($line =~ m/$Argument/) {
            $n = 0;

            $line =~ s/L($Argument)/$DUMMY_ARG_L/;
            $line =~ s/($Argument)/$DUMMY_ARG_P/;

            if (defined($1)) {
                $special_arg[$ln][$n++] = $1;
            }
            $assembler .= $line . "\n";
        } else { 
            $assembler .= $line . "\n";
        }
        $ln++;
	$line = undef;
        if($body =~ m/([^\n]*)\n/){
	    $line = $1;
	    $body =~ s/[^\n]*\n//;
	}
    }

    write_as($assembler,TMP_AS);
    assemble(TMP_AS, TMP_OBJ);
    return disassemble(TMP_OBJ,\@special_arg,\@special,$ln);
}
            
sub write_as($$) {
	my ($code, $target) = @_;

	my $out = new IO::File "> $target"
		or die "Could not write to $target: $!";

    print $out <<'END';
.globl main
        .type    main,@function
main:
END
    print $out $code;
}

sub assemble($$) {
	my ($file, $obj) = @_;

	print STDERR "Assembling:\n\n", (new IO::File $file)->getlines, "\n\n"
		if DEBUG;

	system $Parrot::Jit::AS." $file -o $obj";
	die $Parrot::Jit::AS." $file failed" if (($? >> 8) != 0);
}

sub disassemble($$$$) {
	my ($obj,$sa,$si,$l) = @_;

    my ($result,@t);

	print STDERR "Disassembly:\n\n" if DEBUG;

	my $objdump = new IO::File $Parrot::Jit::OBJDUMP." $obj |"
		or die "Could not run ".$Parrot::Jit::OBJDUMP." $obj: $!";

	while (<$objdump>) { last if /main/ }

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
                    if ($opcodes =~ m/^(\\x..\s){3}\\x01/) {
                        @t = @$sa[$ln];
                        $s = $t[0][$n++];
                        $opcodes =~ s/^((?:\\x..\s){3})\\x01/$1$s/;
                    }
                }
                $result .= $opcodes;
            }
        }
        $ln++;
		print STDERR $_ if DEBUG;
	}

#    $result =~ s/\\x00 \\x00 (\\x.. \\x.. )JUMP\(([^\)]*)\)/JUMP($2) $1/;
    
	print STDERR "\n\nResult:\n\n" if DEBUG;

	print STDERR $result . "\n\n" if DEBUG;

    $result =~ s/\s//g;
    return $result;
}

1;
