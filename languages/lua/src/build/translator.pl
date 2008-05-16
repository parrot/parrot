#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

# Lua bytecode => PIR Translator Generator
# Script to generate the instruction translator from a rules file.

use strict;
use warnings;
use Getopt::Long;
use lib 'build';

# Grab parameters.
my ( $rules_file, $output_file );
GetOptions(
    'output=s' => \$output_file,
) or usage();
$rules_file = shift @ARGV;
usage() if !$rules_file || @ARGV;

# Attempt to laod stack to register mapping module.
my $srm;

# Parse rules file.
my @rules = parse_rules($rules_file);

# Create metavariables table.
my $metavars = {};

# Generate initial translator code and populate metafields.
my $pir = generate_initial_pir();

$pir .= generate_initial_dump( $srm, \@rules, $metavars );

# Emit translation dispatch table.
$pir .= generate_dispatch_table( $srm, \@rules, $metavars );

# Generate instruction translation code from rules.
foreach (@rules) {
    $pir .= generate_rule_dump( $srm, $_, $metavars );
}

$pir .= generate_final_dump( $srm, $metavars );

$pir .= generate_initial_code( $srm, \@rules, $metavars );

# Emit translation dispatch table.
$pir .= generate_dispatch_table( $srm, \@rules, $metavars );

# Generate instruction translation code from rules.
foreach (@rules) {
    $pir .= generate_rule_code( $srm, $_, $metavars );
}

# Generate final translator code.
$pir .= generate_final_code( $srm, $metavars );

# Finally, write generated PIR to output file.
open my $fh, '>', $output_file
    or die "Unable to open $output_file: $!\n";
print $fh $pir;
close $fh;

# And display count of ops that can be translated.
print scalar(@rules) . " instructions translated.\n";

##############################################################################
# Subroutines.
##############################################################################

# Parse rules file and build a data structure.
# ############################################
sub parse_rules {

    # Get filename and open the file.
    my ($filename) = @_;

    open my $fh, '<', $filename
        or die "Unable to open $filename: $!\n";

    # We'll store an array of hashes containing the data.
    my @rules = ();
    my $rule;

    # Read through rules file line by line.
    my $line       = 0;
    my $in_heredoc = 0;
    my ( $heredoc_key, $heredoc_value, $heredoc_terminator );
    while (<$fh>) {
        chomp;
        $line++;

        # If it's a blank line or a comemnt line, skip it.
        next if !$in_heredoc && /^\s*#|^\s*$/;

        # Is this a new rule?
        if ( !$in_heredoc && /^\s*\[([\w\.]+)\]\s*$/ ) {

            # If we have a current rule...
            my $name = $1;
            if ($rule) {

                # Validate it.
                validate_rule($rule);

                # Save it.
                push @rules, $rule;
            }

            # Create new rule structure.
            $rule = { name => $name };
        }

        # Is it a value within a rule with a heredoc?
        elsif ( !$in_heredoc && $rule && /^\s*(\w+)\s*=\s*<<(\w+)\s*$/ ) {

            # Initialize heredoc.
            $in_heredoc         = 1;
            $heredoc_key        = $1;
            $heredoc_value      = q{};
            $heredoc_terminator = $2;
        }

        # Or is it a value within a rule and not a heredoc?
        elsif ( !$in_heredoc && $rule && /^\s*(\w+)\s*=\s*(.+?)\s*$/ ) {
            if ( exists $rule->{$1} ) {
                die "Duplicate value for $rule->{$1} in rule $rule->{name}\n";
            }

            # Stash key and value.
            $rule->{$1} = $2;
        }

        # Are we at the end of a heredoc?
        elsif ( $in_heredoc && /^$heredoc_terminator\s*$/ ) {
            if ( exists $rule->{$heredoc_key} ) {
                die "Duplicate value for $rule->{$heredoc_key} in rule $rule->{name}\n";
            }

            # Stash key/value pair away and unset heredoc flag.
            $rule->{$heredoc_key} = $heredoc_value;
            $in_heredoc = 0;
        }

        # Is this heredoc content?
        elsif ($in_heredoc) {
            $heredoc_value .= "$_\n";
        }

        # Otherwise, syntax eror.
        else {
            die "Syntax error on line $line (\"$_\")\n";
        }
    }

    # If we're still in a heredoc, we got an error.
    if ($in_heredoc) {
        die "Unterminated heredoc runs to end of file\n";
    }

    # If we've a rule left, validate and stash it.
    if ($rule) {
        validate_rule($rule);
        push @rules, $rule;
    }

    # Close file and return parsed rules.
    close $fh;
    return @rules;
}

# Rule validator.
# ###############
sub validate_rule {
    my ($rule) = @_;

    my $name = $rule->{name};

    # Iterate over keys and do validation.
    while ( my ( $key, $value ) = each %{$rule} ) {
        if ( $key eq 'name' ) {

            # always fine
        }
        elsif ( $key eq 'code' ) {
            if ( $value !~ /^\d+$/ ) {
                die "Invalid value for $key in rule $name\n";
            }
        }
        elsif ( $key eq 'format' ) {
            if ( $value !~ /^(A|AB|AC|ABC|ABx|AsBx|sBx)$/ ) {
                die "Invalid value for $key in rule $name\n";
            }
        }
        elsif ( $key eq 'instruction' ) {

            # always fine
        }
        elsif ( $key eq 'pir' ) {

            # always fine
        }
        else {
            die "Unknown key $key in rule $name\n";
        }
    }

    # Check we had mandatory fields.
    unless ( exists $rule->{code} ) {
        die "Mandatory entry code missing in rule $name\n";
    }
    unless ( exists $rule->{format} ) {
        die "Mandatory entry format missing in rule $name\n";
    }
    unless ( exists $rule->{pir} ) {
        die "Mandatory entry pir missing in rule $name\n";
    }

    return;
}

# Generate the initialization code.
# #################################
sub generate_initial_pir {
    return $pir = <<'PIRCODE';
# THIS IS A GENERATED FILE! DO NOT EDIT!

.namespace ['Lua::InstructionList']

PIRCODE
}

# Generate the translator initialization code.
# ############################################
sub generate_initial_code {
    my ( $srm, $rules, $mv ) = @_;

    # Set up some more metavariables.
    $mv->{INS}    = 'gen_pir';
    $mv->{PC}     = 'pc';
    $mv->{NEXTPC} = 'next_pc';
    $mv->{SUBR}   = 'subr';
    $mv->{GLOB}   = 'glob';
    $mv->{REG}    = 'loc_';
    $mv->{K}      = 'k_';
    $mv->{A}      = 'arg_a';
    $mv->{B}      = 'arg_b';
    $mv->{C}      = 'arg_c';
    $mv->{FPF}    = '50';
    $mv->{STACK}    = 'stack';

    # Emit the dumper.
    my $pir = <<'PIRCODE';
.sub 'translate' :method
    .param pmc func
    .local string gen_pir
    .local int pc, next_pc, bc_length, cur_ic, cur_op
    .local int arg_a
    .local int arg_b
    .local int arg_c
    .local int stack

    bc_length = self
    next_pc = 0

PIRCODE

    $pir .= <<'PIRCODE';
    gen_pir = concat "\n# BEGIN OF TRANSLATED BYTECODE\n\n"

  LOOP:
    pc = next_pc
    if pc >= bc_length goto COMPLETE
    cur_ic = self[pc]
    next_pc += 1
    cur_op = cur_ic & 0x003f

PIRCODE

    # Emit label generation code.
    $pir .= <<'PIRCODE';
    $S0 = pc
    gen_pir = concat "PC"
    gen_pir = concat $S0
    gen_pir = concat ": \n"

PIRCODE

    # Return generated code.
    return $pir;
}

# Generate the dumper initialization code.
# ########################################
sub generate_initial_dump {
    my ( $srm, $rules, $mv ) = @_;

    # Emit the dumper.
    my $pir = <<'PIRCODE';
.sub 'brief' :method
    .local int pc, next_pc, bc_length, cur_ic, cur_op
    .local int arg_a
    .local int arg_b
    .local int arg_c
    .local pmc args
    .local string format_pc
    .const string format_A = "%d"
    .const string format_AB = "%-3d %d"
    .const string format_ABC = "%-3d %-3d %d"
    .const string format_AC = "%-3d     %d"
    .const string format_ABx = "%-3d %d"
    .const string format_Bx = "%d"

    bc_length = self
    next_pc = 0
    $N0 = bc_length
    $N0 = log10 $N0
    $I0 = floor $N0
    inc $I0
    format_pc = '[%0'
    $S0 = $I0
    format_pc .= $S0
    format_pc .= 'd] '

  LOOP:
    pc = next_pc
    if pc >= bc_length goto COMPLETE
    cur_ic = self[pc]
    next_pc += 1
    cur_op = cur_ic & 0x003f
    new $P0, 'FixedPMCArray'
    set $P0, 1
    set $P0[0], next_pc
    $S0 = sprintf format_pc, $P0
    print $S0
    new args, 'ResizablePMCArray'

PIRCODE

    # Return generated code.
    return $pir;
}

# Generate the dispatch table.
# ############################
sub generate_dispatch_table {
    my ( $srm, $rules, $mv ) = @_;

    my %hash;
    my @sorted_rules;
    foreach ( @{$rules} ) {
        my $code = sprintf "%02d", $_->{code};
        $hash{ $code } = $_;
    }
    foreach ( sort keys %hash ) {
        push @sorted_rules, $hash{$_};
    }

    my $pir = <<'PIRCODE';
    # Translation code dispatch table.
PIRCODE

    $pir .= binary_dispatch_table( 'BDISPATCH', @sorted_rules );

    # Emit unknown instruction code.
    $pir .= <<'PIRCODE';
  BDISPATCH_NOT_FOUND:
    .local string msg
    msg = "unknown instruction (code "
    $S0 = cur_ic
    msg = concat $S0
    msg = concat ")"
    die msg

PIRCODE

    # Return generated PIR.
    return $pir;
}

# Binary dispatch table builder.
# ##############################
sub binary_dispatch_table {
    my $prefix = shift;
    my @rules  = @_;
    my $pir    = q{};

    # If we have 3 or less rules, dispatch directly to the translator.
    if ( scalar(@rules) <= 3 ) {
        foreach (@rules) {
            $pir .= "    if cur_op == $_->{code} goto ${prefix}_$_->{name}\n";
        }

        # If we don't branch at any of them, we've got an unknown op.
        $pir .= "    goto ${prefix}_NOT_FOUND\n";
    }
    else {

        # Otherwise, split the rules into two groups.
        my $split_point = int( scalar(@rules) / 2 );
        my @r1          = @rules[ 0 .. $split_point - 1 ];
        my @r2          = @rules[ $split_point .. $#rules ];

        # Emit branch code.
        $pir .= "    if cur_op >= $r2[0]->{code} goto ${prefix}_$r2[0]->{code}\n";
        $pir .= "    if cur_op < $r2[0]->{code} goto ${prefix}_$r1[$#r1]->{code}\n";

        # Recurse to make code for sub branches.
        $pir .= "  ${prefix}_$r1[$#r1]->{code}:\n";
        $pir .= binary_dispatch_table( $prefix, @r1 );
        $pir .= "  ${prefix}_$r2[0]->{code}:\n";
        $pir .= binary_dispatch_table( $prefix, @r2 );
    }

    # Return generated code.
    return $pir;
}

# Generate translation code relating to a rule.
# #############################################
sub generate_rule_code {
    my ( $srm, $rule, $mv ) = @_;
    my @localmv = ();

    # Make current instruction code meta-variable.
    $mv->{LABEL} = 'L_' . $rule->{code};
    push @localmv, 'LABEL';

    # Emit dispatch label.
    my $pir = <<"PIRCODE";
  BDISPATCH_$rule->{name}:
    # Translation code for $rule->{name} ($rule->{code})
    gen_pir = concat "  # $rule->{name}\\n"
PIRCODE

    # Emit code to read arguments for the op.
    if ($rule->{format} =~ /^A/) {
        $pir .= "    arg_a = cur_ic >> 6\n";
        $pir .= "    arg_a &= 0x00ff\n";
    }

    if ($rule->{format} =~ /sBx$/) {
        $pir .= "    arg_b = cur_ic >>> 14\n";
        $pir .= "    arg_b -= 131071\n";
    }
    elsif ($rule->{format} =~ /Bx$/) {
        $pir .= "    arg_b = cur_ic >>> 14\n";
    }
    elsif ($rule->{format} =~ /B/) {
        $pir .= "    arg_b = cur_ic >> 23\n";
        $pir .= "    arg_b &= 0x01ff\n";
    }

    if ($rule->{format} =~ /C$/) {
        $pir .= "    arg_c = cur_ic >> 14\n";
        $pir .= "    arg_c &= 0x01ff\n";
    }

    $pir .= translation_code( $rule, $mv );

    # Finally, emit code to go to translate next instruction.
    $pir .= "    goto LOOP\n\n";

    # Clean up meta-variables hash.
    foreach (@localmv) {
        delete $mv->{$_};
    }

    # Return generated code.
    return $pir;
}

sub translation_code {
    my ( $rule, $mv ) = @_;

    # If we have PIR for the instruction, just take that. If not, we need
    # to generate it from the "to generate" instruction directive.
    my $pir = "### translation\n";
    if ( $rule->{pir} ) {
        $pir .= sub_meta( $rule->{pir}, $mv, "pir for rule $rule->{name}" );
    }
    else {
        $pir .= "    gen_pir = concat \"  not_translated()\\n\"\n";
    }
    $pir .= "### end translation\n";

    return $pir;
}

# Generate dump code relating to a rule.
# #############################################
sub generate_rule_dump {
    my ( $srm, $rule, $mv ) = @_;

    # Emit dispatch label.
    my $pir = <<"PIRCODE";
  BDISPATCH_$rule->{name}:
    # Dump code for $rule->{name}
PIRCODE


    # Emit code to dump.
    my $name = sprintf "%-11s", lc $rule->{name};
    $pir .= "    print \"${name}\"\n";

    if ($rule->{format} =~ /^A/) {
        $pir .= "    arg_a = cur_ic >> 6\n";
        $pir .= "    arg_a &= 0x00ff\n";
        $pir .= "    push args, arg_a\n";
    }

    if ($rule->{format} =~ /sBx$/) {
        $pir .= "    arg_b = cur_ic >>> 14\n";
        $pir .= "    arg_b -= 131071\n";
        $pir .= "    push args, arg_b\n";
    }
    elsif ($rule->{format} =~ /Bx$/) {
        $pir .= "    arg_b = cur_ic >>> 14\n";
        $pir .= "    push args, arg_b\n";
    }
    elsif ($rule->{format} =~ /B/) {
        $pir .= "    arg_b = cur_ic >> 23\n";
        $pir .= "    arg_b &= 0x01ff\n";
        $pir .= "    push args, arg_b\n";
    }

    if ($rule->{format} =~ /C$/) {
        $pir .= "    arg_c = cur_ic >> 14\n";
        $pir .= "    arg_c &= 0x01ff\n";
        $pir .= "    push args, arg_c\n";
    }

    my %format = (
        A    => 'format_A',
        AB   => 'format_AB',
        AC   => 'format_AC',
        ABC  => 'format_ABC',
        ABx  => 'format_ABx',
        AsBx => 'format_ABx',
        sBx  => 'format_Bx',
    );

    $pir .= "    \$S0 = sprintf $format{$rule->{format}}, args\n";
    $pir .= "    print \$S0\n";

    $pir .= "    print \"\\n\"\n";

    # Finally, emit code to go to translate next instruction.
    $pir .= "    goto LOOP\n\n";

    # Return generated code.
    return $pir;
}

# Generate the dumper trailer code.
# #################################
sub generate_final_dump {

    # Emit complete label.
    # Emit the end of the dumper.
    my $pir = <<'PIRCODE';
  COMPLETE:
.end

PIRCODE

    # Return generated code.
    return $pir;
}

# Generate the translator trailer code.
# #####################################
sub generate_final_code {
    my ( $srm, $mv ) = @_;

    # Emit complete label.
    # Emit label generation code.
    my $pir = <<'PIRCODE';
  COMPLETE:

    $S0 = pc
    gen_pir = concat "PC"
    gen_pir = concat $S0
    gen_pir = concat ": \n"

    gen_pir = concat "\n# END OF TRANSLATED BYTECODE\n\n"

PIRCODE

    # Emit the end of the translator PIR.
    $pir .= <<'PIRCODE';
    .return (gen_pir)
.end

PIRCODE

    # Return generated code.
    return $pir;
}

# Substiture meta variables.
# ##########################
sub sub_meta {
    my ( $pir, $mv, $code_source ) = @_;
    $code_source ||= "(unknown)";

    # Substiture in known meta-variables.
    for ( keys %$mv ) {
        $pir =~ s/\${$_}/$mv->{$_}/g;
    }

    # We need to automagically instantiate [INSP]_ARG_\d+ and [INSP]TEMP\d+.
    while ( $pir =~ /\$\{([INS])TEMP(\d+)\}/g ) {
        my $key   = $1 . 'TEMP' . $2;
        my $value = '$' . $1 . $2;
        $pir =~ s/\$\{$key\}/$value/g;
    }
    while ( $pir =~ /\$\{PTEMP(\d+)\}/g ) {
        my $key   = 'PTEMP' . $1;
        my $value = 'P_temp_' . $1;
        $mv->{$key} = $value;
        $pir =~ s/\$\{$key\}/$value/g;
    }

    # If we have any unsubstituted variables, error.
    if ( $pir =~ /\$\{([^}]*)}/ ) {
        warn "Unknown metavariable $1 used in $code_source\n";
    }

    return $pir;
}

# Usage message.
# ##############
sub usage {
    print <<'USAGE';
Usage:
  perl src/build/translator.pl src/lib/translation.rules \
    --output src/lib/luabytecode_gen.pir
USAGE
    exit(1);
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
