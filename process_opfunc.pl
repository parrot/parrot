#! perl -w
#
# process_opfunc.pl
#
# Take a file of opcode functions and emit real C code for them
#
# opcode functions are in the format:
#
#  AUTO_OP opname {
#
#   ... body of function ...
#
#  }
#
# Where the closing brace is on its own line. Alternately, for opcode
# functions that manage their own return values:
#
# MANUAL_OP opname {
#
#    ... body of function ...
#
#    RETVAL = x;
#
# }
#
# There may be more than one RETVAL
#
# The functions have the magic variables Pnnn for parameters 1 through
# X. (Parameter 0 is the opcode number) Types for each, and the size
# of the return offset, are taken from the opcode_table file

open OPCODE, "opcode_table" or die "Can't open opcode_table, $!/$^E";
while (<OPCODE>) {
    s/#.*//;
    s/^\s+//;
    chomp;
    next unless $_;
    my ($num, $name, $params, @params) = split /\s+/;
    $opcode{$name}{PARAM_COUNT} = $params;
    $opcode{$name}{PARAM_ARRAY} = \@params;
    $opcode{$name}{OPNUM} = $num;

    my $num_i = () = grep {/i/} @params;
    my $num_n = () = grep {/n/} @params;
    $opcode{$name}{RETURN_OFFSET} = 1 + $num_i + $num_n * 2;
    my $count = 1;
    $opcode{$name}{PARAMETER_SUB} = ["", map {"cur_opcode[" . $count++ . "]"} @params];
}

my $file = $ARGV[0];
open INPUT, $file or die "Can't open $file, $!/$^E";
if (! ($file =~ s/\.ops$/.c/)) {
    $file .= ".c";
}
open OUTPUT, ">$file" or die "Can't open $file, $!/$^E";

while (<INPUT>) {
    if (/^AUTO_OP/) {
	($name, $footer) = emit_auto_header($_);
	next;
    }

    if (/^MANUAL_OP/) {
	($name, $footer) = emit_manual_header($_);
	next;
    }

    s/RETVAL/return_offset/;

    s/RETURN\(0\);/return 0;/;

    s/RETURN\((.*)\)/return cur_opcode + $1/;

    s/\bP(\d+)\b/$opcode{$name}{PARAMETER_SUB}[$1]/g;

    if (/^}/) {
        print OUTPUT $footer, "\n";
	next;
    }

    print OUTPUT $_;
}

sub emit_auto_header {
    my $line = shift;
    my ($name) = $line =~ /AUTO_OP\s+(\w+)/;
    
    print OUTPUT "IV *$name(IV cur_opcode[], struct Perl_Interp *interpreter) {\n";
    return($name, "  return cur_opcode + "
    . $opcode{$name}{RETURN_OFFSET}. ";\n}\n");
}

sub emit_manual_header {
    my $line = shift;
    my ($name) = $line =~ /MANUAL_OP\s+(\w+)/;
    
    print OUTPUT "IV *$name(IV cur_opcode[], struct Perl_Interp *interpreter) {\n";
    print OUTPUT "  IV return_offset = 1;\n";
    return($name, "  return cur_opcode + return_offset;\n}\n");
}

