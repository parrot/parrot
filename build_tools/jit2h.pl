#! /usr/bin/perl -w 
#
# jit2h.pl
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

my ($position, $bytecode, $type, $number, $size, $char, $move, $strflag);

my (%core_ops, %string, $arg, $tmp, $which, $argc, $argv, $syscall, $tmp_bytecode, $nargop);

my (@values);
my (@value_p);
my (@value_n);
my (@value_f);

open (IN,"jit/$cpuarch/core.jit");
while ($line = <IN>) {
    next if (($line =~ m/^[#;]/) || ($line =~ m/^\s*$/));
    ($function, $body) = split(":",$line);
    $body =~ s/\s+//g;
    $core_ops{$function} = $body;
}

open (IN,"jit/$cpuarch/string.jit");
while ($line = <IN>) {
    next if (($line =~ m/^[#;]/) || ($line =~ m/^\s*$/));
    ($function, $body) = split(":",$line);
    $body =~ s/\s+//g;
    $string{$function} = $body;
}

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
		if ($char eq 'F') {
			# fuction
			$tmp_bytecode = "";
			$tmp = substr($body,$move,index($body,')',$move) + 1);
			$tmp =~ m/(\w+),([^\)]*)\)/;
			$function = $1;
			$argv = $2;
			if (defined($string{$function})) {
				$argc = $tmp_bytecode = $string{$function};
				$argc =~ s/[^A]//g;
				$argc = length($argc);
				for($k = 0; $k < $argc; $k++) {
					$argv =~ s/([\&\*][a-zA-Z]+\d+)//; 
					$arg = $1;
					$tmp_bytecode =~ s/A/$arg/;
				}
			}
			$body =~ s/F\([^\)]*\)/$tmp_bytecode/;
		}
		if ($char eq 'S') {
			# system call
			$tmp_bytecode = "";
			$tmp = substr($body,$move,index($body,')',$move) + 1);
			$tmp =~ m/(\w+),(\d+),([^\)]*)\)/;
			$syscall = $1;
			$argc = $2;
			$argv = $3;

			$tmp_bytecode .= Jit::system_call($argc,$argv,$syscall);
			
			$body =~ s/S\([^\)]*\)/$tmp_bytecode/;
		}
		if ($char =~ m/[\&\*]/) {
			# Copy \x00 * sizeof(INTVAL) to the bytecode and add to the list
			$tmp = substr($body,$move,length($body) - $move + 1);
			$tmp =~ m/([\&\*][a-zA-Z]+)(\d+)/;
			$type = $1;
			$number = $2;
			$strflag = undef;
			if ($type eq '&IR') {
				$n = 0;
			}
			elsif ($type eq '&NR') {
				$n = 1;
			}
			elsif ($type eq '&SR') {
				$n = 2;
				$strflag = 0;
			}
			elsif ($type eq '&SRbufstart') {
				$n = 2;
				$strflag = 1;
			}
			elsif ($type eq '&SRbuflen') {
				$n = 2;
				$strflag = 2;
			}
			elsif ($type eq '&SRflags') {
				$n = 2;
				$strflag = 3;
			}
			elsif ($type eq '&SRbufused') {
				$n = 2;
				$strflag = 4;
			}
			elsif ($type eq '&SRstrlen') {
				$n = 2;
				$strflag = 5;
			}
			elsif ($type eq '&SRencoding') {
				$n = 2;
				$strflag = 6;
			}
			elsif ($type eq '&SRtype') {
				$n = 2;
				$strflag = 7;
			}
			elsif ($type eq '&SRlanguage') {
				$n = 2;
				$strflag = 8;
			}
			elsif ($type eq '&PR') {
				$n = 3;
			}
			elsif ($type eq '*IC') {
				$n = 4;
			}
			elsif ($type eq '*NC') {
				$n = 5;
			}
			elsif ($type eq '*SC') {
				$n = 6;
				$strflag = 0;
			}
			elsif ($type eq '*SCbufstart') {
				$n = 6;
				$strflag = 1;
			}
			elsif ($type eq '*SCbuflen') {
				$n = 6;
				$strflag = 2;
			}
			elsif ($type eq '*SCflags') {
				$n = 6;
				$strflag = 3;
			}
			elsif ($type eq '*SCbufused') {
				$n = 6;
				$strflag = 4;
			}
			elsif ($type eq '*SCstrlen') {
				$n = 6;
				$strflag = 5;
			}
			elsif ($type eq '*SCencoding') {
				$n = 6;
				$strflag = 6;
			}
			elsif ($type eq '*SCtype') {
				$n = 6;
				$strflag = 7;
			}
			elsif ($type eq '*SClanguage') {
				$n = 6;
				$strflag = 8;
			}
			elsif ($type eq '*PC') {
				$n = 7;
			}
			elsif ($type eq '&IC') {
				$n = 8;
			}
			elsif ($type eq '&NC') {
				$n = 9;
			}
			elsif ($type eq '&SC') {
				$n = 10;
				$strflag = 0;
			}
			elsif ($type eq '&SCbufstart') {
				$n = 10;
				$strflag = 1;
			}
			elsif ($type eq '&SCbuflen') {
				$n = 10;
				$strflag = 2;
			}
			elsif ($type eq '&SCflags') {
				$n = 10;
				$strflag = 3;
			}
			elsif ($type eq '&SCbufused') {
				$n = 10;
				$strflag = 4;
			}
			elsif ($type eq '&SCstrlen') {
				$n = 10;
				$strflag = 5;
			}
			elsif ($type eq '&SCencoding') {
				$n = 10;
				$strflag = 6;
			}
			elsif ($type eq '&SCtype') {
				$n = 10;
				$strflag = 7;
			}
			elsif ($type eq '&SClanguage') {
				$n = 10;
				$strflag = 8;
			}
			elsif ($type eq '&PC') {
				$n = 11;
			}
			elsif ($type eq '&TI') {
				$n = 12;
			}
			elsif ($type eq '&TN') {
				$n = 13;
			}
			elsif ($type eq '&TS') {
				$n = 14;
			}
			elsif ($type eq '&TC') {
				$n = 15;
			}
			elsif ($type eq '&CF') {
				$n = 21;
			}
			elsif ($type eq '&CC') {
				$n = 23;
			}
			elsif ($type eq '*JIC') {
				$n = 24;
			}
			elsif ($type eq '&L') {
				$n = 27;
			}
			$bytecode .= '\\x00' x 4;
			$values[$n]++;
			$value_p[$n][$values[$n]] = $position;
			$value_n[$n][$values[$n]] = $number;
			$value_f[$n][$values[$n]] = $strflag;
			$move += length($type) + length($number);
			$position += 4;
		}
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

	for ($k = 0; $k < 28; $k++) {
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
            print "      {0, 0},\n";
			print "    }\n";
        }

		print "  },\n";
	}

    print "},\n";
}


