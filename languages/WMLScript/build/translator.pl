#! perl
# WMLScript => PIR Translator Generator
# Script to generate the instruction translator from a rules file and a
# stack to register mapping algorithm.

use strict;
use warnings;
use Getopt::Long;
use lib 'build';

# Grab parameters.
my ($rules_file, $output_file, $srm_module);
GetOptions(
    'output=s'  => \$output_file,
    'srm=s'     => \$srm_module,
) or usage();
$rules_file = shift @ARGV;
usage() if !$rules_file || @ARGV;

# Attempt to laod stack to register mapping module.
require "SRM/$srm_module.pm";
my $srm = "SRM::$srm_module"->new();

# Parse rules file.
my @rules = parse_rules($rules_file);

# Create metavariables table.
my $metavars = {};

# Generate initial translator code and populate metafields.
my $pir = generate_initial_pir();

$pir .= generate_initial_dump($srm, \@rules, $metavars);

# Emit translation dispatch table.
$pir .= generate_dispatch_table($srm, \@rules, $metavars);

# Generate instruction translation code from rules.
foreach (@rules) {
    $pir .= generate_rule_dump($srm, $_, $metavars);
}

$pir .= generate_final_dump($srm, $metavars);

$pir .= generate_initial_code($srm, \@rules, $metavars);

# Emit translation dispatch table.
$pir .= generate_dispatch_table($srm, \@rules, $metavars);

# Generate instruction translation code from rules.
foreach (@rules) {
    $pir .= generate_rule_code($srm, $_, $metavars);
}

# Generate final translator code.
$pir .= generate_final_code($srm, $metavars);

# Finally, we need to insert auto-magically instantiated local variables
# into the translator code.
$pir = insert_automagicals($pir, $metavars);

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
    my $line = 0;
    my $in_heredoc = 0;
    my ($heredoc_key, $heredoc_value, $heredoc_terminator);
    while (<$fh>) {
        chomp;
        $line++;

        # If it's a blank line or a comemnt line, skip it.
        next if !$in_heredoc && /^\s*#|^\s*$/;

        # Is this a new rule?
        if (!$in_heredoc && /^\s*\[([\w\.]+)\]\s*$/) {
            # If we have a current rule...
            my $name = $1;
            if ($rule) {
                # Validate it.
                validate_rule($rule);

                # Save it.
                push @rules, $rule;
            }

            # Create new rule structure.
            $rule = {
                name    => $name
            };
        }

        # Is it a value within a rule with a heredoc?
        elsif (!$in_heredoc && $rule && /^\s*(\w+)\s*=\s*<<(\w+)\s*$/) {
            # Initialize heredoc.
            $in_heredoc = 1;
            $heredoc_key = $1;
            $heredoc_value = q{};
            $heredoc_terminator = $2;
        }

        # Or is it a value within a rule and not a herdoc?
        elsif (!$in_heredoc && $rule && /^\s*(\w+)\s*=\s*(.+?)\s*$/) {
            if (exists $rule->{$1}) {
                die "Duplicate value for $rule->{$1} in rule $rule->{name}\n";
            }
            # Stash key and value.
            $rule->{$1} = $2;
        }

        # Are we at the end of a heredoc?
        elsif ($in_heredoc && /^$heredoc_terminator\s*$/) {
            if (exists $rule->{$heredoc_key}) {
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
    while (my ($key, $value) = each %{$rule}) {
        if ($key eq 'name') {
            # always fine
        }
        elsif ($key eq 'code') {
            if ($value !~ /^[0-9A-F]{2}$/) {
                die "Invalid value for $key in rule $name\n";
            }
        }
        elsif ($key eq 'class') {
            if ($value !~ /^(op|load|store|branch|calling|sc_op)$/) {
                die "Invalid value for $key in rule $name\n";
            }
        }
        elsif ($key eq 'push') {
            if ($value !~ /^\d+$/) {
                die "Invalid value for $key in rule $name\n";
            }
        }
        elsif ($key eq 'pop') {
            if ($value !~ /^\d+$/) {
                die "Invalid value for $key in rule $name\n";
            }
        }
        elsif ($key eq 'inline') {
            if ($value !~ /^[0-9A-F]{2}$/) {
                die "Invalid value for $key in rule $name\n";
            }
        }
        elsif ($key eq 'arguments') {
            my @args = split /\s*,\s+/, $value;
            foreach my $arg (@args) {
                if ($arg !~ /^(uint(8|16))$/) {
                    die "Invalid argument type $arg in rule $name\n";
                }
            }
        }
        elsif ($key eq 'instruction') {
            # always fine
        }
        elsif ($key eq 'pir') {
            # always fine
        }
        elsif ($key eq 'nb_arg') {
            # always fine
        }
        else {
            die "Unknown key $key in rule $name\n";
        }
    }

    # Check we had mandatory fields.
    unless (exists $rule->{code}) {
        die "Mandatory entry code missing in rule $name\n";
    }
    unless (exists $rule->{class}) {
        die "Mandatory entry class missing in rule $name\n";
    }

    if ($rule->{class} eq 'op') {
        unless (exists $rule->{pir} or exists $rule->{instruction}) {
            die "Translation (instruction or pir) not provided in rule $name\n";
        }
    }
    else {
        unless (exists $rule->{pir}) {
            die "Mandatory entry pir missing in rule $name\n";
        }
        if (exists $rule->{instruction}) {
            die "instruction not allowed in rule $name\n";
        }
    }

    if ($rule->{class} eq 'calling') {
        # pop and push forbidden for calling
        if (exists $rule->{pop} || exists $rule->{push}) {
            die "pop and push not allowed for class 'calling' in rule $name\n";
        }
        unless (exists $rule->{nb_arg}) {
            die "nb_arg must be supplied for rule $rule->{name}\n";
        }
    }
    else {
        if (exists $rule->{nb_arg}) {
            die "nb_arg not allowed in rule $name\n";
        }
    }

    $rule->{pop} = 0 unless (exists $rule->{pop});
    $rule->{push} = 0 unless (exists $rule->{push});
    return;
}


# Generate the initialization code.
# #################################
sub generate_initial_pir {
    return $pir = <<'PIRCODE';
# THIS IS A GENERATED FILE! DO NOT EDIT!

.namespace ['Wmls::Function']

PIRCODE
}


# Generate the translator initialization code.
# ############################################
sub generate_initial_code {
    my ($srm, $rules, $mv) = @_;

    # Set up some more metavariables.
    $mv->{INS} = 'gen_pir';
    $mv->{PC} = 'pc';
    $mv->{NEXTPC} = 'next_pc';
    $mv->{STACK0} = 'stack_0';
    $mv->{STACK1} = 'stack_1';
    $mv->{DEST0} = 'dest_0';
    $mv->{DEST1} = 'dest_1';
    $mv->{CONST} = 'h_const';

    # Emit the dumper.
    my $pir = <<'PIRCODE';
.sub 'translate_code'
    .param string code
    .param pmc script
    .local string gen_pir
    .local int pc, next_pc, bc_length, cur_ic
    .local int inline
    .local int arg_1
    .local int arg_2
    .local int arg_3
    .local string stack_0
    .local string stack_1
    .local string dest_0
    .local string dest_1
    .local string c_params
    .local string loadreg
    .local string storereg
    .local pmc h_const
    new h_const, .Hash
    .local pmc constants
    constants = script['Constants']

    gen_pir = <<"PIR"
  ${AUTO_MAGICALS}
PIR

    bc_length = length code
    next_pc = 0

PIRCODE

    # SRM pre translation code.
    $pir .= "### pre_translation\n";
    my $srm_pt = $srm->pre_translation();
    $pir .= sub_meta($srm_pt, $mv, 'pre_translation');
    $pir .= "### end pre_translation\n\n";

    $pir .= <<'PIRCODE';

    gen_pir = concat "\n# BEGIN OF TRANSLATED BYTECODE\n\n"

LOOP:
    pc = next_pc
    if pc >= bc_length goto COMPLETE
    $S0 = substr code, pc, 1
    next_pc += 1
    cur_ic = ord $S0

PIRCODE

    # Emit pre instruction code.
    $pir .= "### pre_instruction\n";
    my $srm_instr = $srm->pre_instruction();
    $pir .= sub_meta($srm_instr, $mv, 'pre_instruction');
    $pir .= "### end pre_instruction\n\n";

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
    my ($srm, $rules, $mv) = @_;

    # Emit the dumper.
    my $pir = <<'PIRCODE';
.sub 'dump_code'
    .param string code
    .local int pc, next_pc, bc_length, cur_ic
    .local int inline
    .local int arg_1
    .local int arg_2
    .local int arg_3

    bc_length = length code
    next_pc = 0

LOOP:
    pc = next_pc
    if pc >= bc_length goto COMPLETE
    $S0 = substr code, pc, 1
    next_pc += 1
    cur_ic = ord $S0

PIRCODE

    # Return generated code.
    return $pir;
}


# Generate the dispatch table.
# ############################
sub generate_dispatch_table {
    my ($srm, $rules, $mv) = @_;

    my %hash;
    my @sorted_rules;
    foreach (@{$rules}) {
        $hash{$_->{code}} = $_;
    }
    foreach (sort keys %hash) {
        push @sorted_rules, $hash{$_};
    }

    my $pir = <<'PIRCODE';
    # Translation code dispatch table.
PIRCODE

    $pir .= binary_dispatch_table('BDISPATCH', @sorted_rules);

    # Emit unknown instruction code.
    $pir .= <<'PIRCODE';
BDISPATCH_NOT_FOUND:
    .local pmc ex
    .local string msg
    ex = new Exception
    msg = "unknown instruction (code "
    $S0 = cur_ic
    msg = concat $S0
    msg = concat ")"
    ex["_message"] = msg
    throw ex

PIRCODE

    # Return generated PIR.
    return $pir;
}


# Binary dispatch table builder.
# ##############################
sub binary_dispatch_table {
    my $prefix = shift;
    my @rules = @_;
    my $pir = q{};

    # If we have 3 or less rules, dispatch directly to the translator.
    if (scalar(@rules) <= 3) {
        foreach (@rules) {
            if (exists $_->{inline}) {
                my $mask = sprintf("0x%2X", 0xFF ^ hex($_->{inline}));
                $pir .= "    \$I0 = cur_ic & $mask\n";
                $pir .= "    if \$I0 == 0x$_->{code} goto ${prefix}_$_->{name}\n";
            } else {
                $pir .= "    if cur_ic == 0x$_->{code} goto ${prefix}_$_->{name}\n";
            }
        }

        # If we don't branch at any of them, we've got an unknown op.
        $pir .= "    goto ${prefix}_NOT_FOUND\n";
    }
    else {
        # Otherwise, split the rules into two groups.
        my $split_point = int(scalar(@rules) / 2);
        my @r1 = @rules[0 .. $split_point - 1];
        my @r2 = @rules[$split_point .. $#rules];

        # Emit branch code.
        $pir .= "    if cur_ic >= 0x$r2[0]->{code} goto ${prefix}_$r2[0]->{code}\n";
        $pir .= "    if cur_ic < 0x$r2[0]->{code} goto ${prefix}_$r1[$#r1]->{code}\n";

        # Recurse to make code for sub branches.
        $pir .= "${prefix}_$r1[$#r1]->{code}:\n";
        $pir .= binary_dispatch_table($prefix, @r1);
        $pir .= "${prefix}_$r2[0]->{code}:\n";
        $pir .= binary_dispatch_table($prefix, @r2);
    }

    # Return generated code.
    return $pir;
}


# Generate translation code relating to a rule.
# #############################################
sub generate_rule_code {
    my ($srm, $rule, $mv) = @_;
    my @localmv = ();

    # Make current instruction code meta-variable.
    $mv->{CURIC} = $rule->{code};
    push @localmv, 'CURIC';

    # Emit dispatch label.
    my $pir = <<"PIRCODE";
BDISPATCH_$rule->{name}:
    # Translation code for $rule->{name} ($rule->{code})
    gen_pir = concat "  # $rule->{name}\\n"
PIRCODE

    # Emit trace code.
    # ...

    # Emit code to read arguments for the op.
    if (exists $rule->{inline}) {
        $pir .= <<"PIRCODE";
    # inline
    inline = cur_ic & 0x$rule->{inline}
PIRCODE
        $mv->{INLINE} = 'inline';
        push @localmv, 'INLINE';
    }
    my @args;
    @args = split(/,\s*/, $rule->{arguments})
        if (exists $rule->{arguments});
    my $arg_num = 1;
    foreach (@args) {
        if ($_ eq 'uint8') {
            $pir .= <<"PIRCODE";
    # $_ arg_$arg_num
    \$S0 = substr code, next_pc, 1
    next_pc += 1
    \$I0 = ord \$S0
    arg_$arg_num = \$I0
PIRCODE
        }
        elsif ($_ eq 'uint16') {
            $pir .= <<"PIRCODE";
    # $_ arg_$arg_num
    \$S0 = substr code, next_pc, 1
    next_pc += 1
    \$I0 = ord \$S0
    arg_$arg_num = \$I0 << 8
    \$S0 = substr code, next_pc, 1
    next_pc += 1
    \$I0 = ord \$S0
    arg_$arg_num += \$I0
PIRCODE
        }

        $mv->{"ARG$arg_num"} = "arg_$arg_num";
        push @localmv, "ARG$arg_num";
        $arg_num ++;
    }

    # Now we split based upon the class.
    # Operations (op class).
    if ($rule->{class} eq 'op') {
        # Now call pre_op and append code that it generates.
        my $pre_op = $srm->pre_op($rule->{pop}, $rule->{push});
        $pir .= "### pre_op\n";
        $pir .= sub_meta($pre_op, $mv, "pre_op for rule $rule->{name}");
        $pir .= "### end pre_op\n";

        $pir .= translation_code($rule, $mv);

        # Finally, call post_op and append code it generates.
        my $post_op = $srm->post_op($rule->{pop}, $rule->{push});
        $pir .= "### post_op\n";
        $pir .= sub_meta($post_op, $mv, "post_op for rule $rule->{name}");
        $pir .= "### end post_op\n";
    }

    if ($rule->{class} eq 'sc_op') {
        # Now call pre_op and append code that it generates.
        my $pre_op = $srm->pre_op($rule->{pop}, 2);
        $pir .= "### pre_op\n";
        $pir .= sub_meta($pre_op, $mv, "pre_op for rule $rule->{name}");
        $pir .= "### end pre_op\n";

        my $post_op = $srm->post_op($rule->{pop}, 1);
        $mv->{__PUSH_1__}  = "### push 1\n";
        $mv->{__PUSH_1__} .= sub_meta($post_op, $mv, "post_op for rule $rule->{name}");
        $mv->{__PUSH_1__} .= "### end push 1";
        push @localmv, '__PUSH_1__';
        $post_op = $srm->post_op($rule->{pop}, 2);
        $mv->{__PUSH_2__}  = "### push 2\n";
        $mv->{__PUSH_2__} .= sub_meta($post_op, $mv, "post_op for rule $rule->{name}");
        $mv->{__PUSH_2__} .= "### end push 2";
        push @localmv, '__PUSH_2__';

        $pir .= translation_code($rule, $mv);
    }


    # Loads (load class).
    elsif ($rule->{class} eq 'load') {
        if ($rule->{pir} =~ /\$\{LOADREG\}/) {
            die "\${LOADREG} not allowed in rule $rule->{name}\n";
        }
        elsif ($rule->{pir} !~ /\$\{DEST0\}/) {
            die "pir must use \${DEST0} in rule $rule->{name}\n";
        }

        # Now call pre_load and append code that it generates.
        my $pre_load = $srm->pre_load();
        $pir .= "### pre_load\n";
        $pir .= sub_meta($pre_load, $mv, "pre_load for rule $rule->{name}");
        $pir .= "### end pre_load\n";

        $pir .= translation_code($rule, $mv);

        # Finally, call post_load and append code it generates.
        my $post_load = $srm->post_load();
        $pir .= "### post_load\n";
        $pir .= sub_meta($post_load, $mv, "post_load for rule $rule->{name}");
        $pir .= "### end post_load\n";
    }

    # Stores (store class).
    elsif ($rule->{class} eq 'store') {
        if ($rule->{pir} =~ /\$\{STACK0\}/) {
            die "\${STACK0} not allowed in rule $rule->{name}\n";
        }
        elsif ($rule->{pir} =~ /\$\{STOREREG\}/) {
            $mv->{STOREREG} = 'storereg';
            push @localmv, 'STOREREG';
        }
        else {
            die "pir must use \${STOREREG} in rule $rule->{name}\n";
        }

        # Now call pre_store and append code that it generates.
        my $pre_store = $srm->pre_store();
        $pir .= "### pre_store\n";
        $pir .= sub_meta($pre_store, $mv, "pre_store for rule $rule->{name}");
        $pir .= "### end pre_store\n";

        $pir .= translation_code($rule, $mv);

        # Finally, call post_store and append code it generates.
        my $post_store = $srm->post_store();
        $pir .= "### post_store\n";
        $pir .= sub_meta($post_store, $mv, "post_store for rule $rule->{name}");
        $pir .= "### end post_store\n";
    }

    # Branches (branch class).
    elsif ($rule->{class} eq 'branch') {
        # Call pre_branch and append code that it generates.
        my $pre_branch = $srm->pre_branch($rule->{pop});
        $pir .= "### pre_branch\n";
        $pir .= sub_meta($pre_branch, $mv, "pre_branch for rule $rule->{name}");
        $pir .= "### end pre_branch\n";

        $pir .= translation_code($rule, $mv);

        # Finally, call post_branch and append code it generates.
        my $post_branch = $srm->post_branch($rule->{pop});
        $pir .= "### post_branch\n";
        $pir .= sub_meta($post_branch, $mv, "post_branch for rule $rule->{name}");
        $pir .= "### end post_branch\n";
    }

    # Calls/returns (calling class)
    elsif ($rule->{class} eq 'calling') {
        # Set meta-variable.
        $mv->{PARAMS} = 'c_params';
        push @localmv, 'PARAMS';

        # Now call pre_call and append code that it generates.
        my $pre_call = $srm->pre_call($rule->{nb_arg});
        $pir .= "### pre_call\n";
        $pir .= sub_meta($pre_call, $mv, "pre_call for rule $rule->{name}");
        $pir .= "### end pre_call\n";

        $pir .= translation_code($rule, $mv);

        # Finally, call post_call and append code it generates.
        my $post_call = $srm->post_call();
        $pir .= "### post_call\n";
        $pir .= sub_meta($post_call, $mv, "post_call for rule $rule->{'name'}");
        $pir .= "### end post_call\n";
    }

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
    my ($rule, $mv) = @_;

    # If we have PIR for the instruction, just take that. If not, we need
    # to generate it from the "to generate" instruction directive.
    my $pir = "### translation\n";
    if ($rule->{pir}) {
        $pir .= sub_meta($rule->{pir}, $mv,
            "pir for rule $rule->{name}");
    }
    elsif ($rule->{instruction}) {
        $pir .= sub_meta(ins_to_pir($rule->{instruction}), $mv,
            "pir for rule $rule->{name}");
    }
    else {
        $pir .= "# TODO\n";
    }
    $pir .= "\n" unless $pir =~ /\n$/;
    $pir .= "### end translation\n";

    return $pir;
}

# Instruction to PIR routine.
# ###########################
sub ins_to_pir {
    my ($ins, $mv) = @_;
    my $output;

    # Ensure we have a newline at the end.
    $ins .= "\n" unless $ins =~ /\n$/;

    # Escape some characters that will go into the output.
    $ins =~ s/\\/\\\\/g;
    $ins =~ s/\n/\\n/g;
    $ins =~ s/"/\\"/g;

    # Substitute in meta-variables. Yes, this really is the least evil way I
    # can think of to do it.
    $ins =~ s/(\$\{\w+\})/
        "\"\n    \${INS} = concat $1\n    \${INS} = concat \""
    /ge;
    $ins = "    \${INS} = concat \"  $ins\"\n";

    # Return PIR.
    return $ins;
}


# Generate dump code relating to a rule.
# #############################################
sub generate_rule_dump {
    my ($srm, $rule, $mv) = @_;

    # Emit dispatch label.
    my $pir = <<"PIRCODE";
BDISPATCH_$rule->{name}:
    # Dump code for $rule->{name}
PIRCODE

    # Emit code to read arguments for the op.
    if (exists $rule->{inline}) {
        $pir .= <<"PIRCODE";
    # inline
    inline = cur_ic & 0x$rule->{inline}
PIRCODE
    }
    my @args;
    @args = split(/,\s*/, $rule->{arguments})
        if (exists $rule->{arguments});
    my $arg_num = 1;
    foreach (@args) {
        if ($_ eq 'uint8') {
            $pir .= <<"PIRCODE";
    # $_ arg_$arg_num
    \$S0 = substr code, next_pc, 1
    next_pc += 1
    \$I0 = ord \$S0
    arg_$arg_num = \$I0
PIRCODE
        }
        elsif ($_ eq 'uint16') {
            $pir .= <<"PIRCODE";
    # $_ arg_$arg_num
    \$S0 = substr code, next_pc, 1
    next_pc += 1
    \$I0 = ord \$S0
    arg_$arg_num = \$I0 << 8
    \$S0 = substr code, next_pc, 1
    next_pc += 1
    \$I0 = ord \$S0
    arg_$arg_num += \$I0
PIRCODE
        }
        $arg_num ++;
    }

    # Emit code to dump.
    $pir .= "    print \"$rule->{name}\"\n";

    if (exists $rule->{inline}) {
        $pir .= <<'PIRCODE';
    print "\t"
    print inline
PIRCODE
    }

    $arg_num = 1;
    foreach (@args) {
        $pir .= <<"PIRCODE";
    print "\\t"
    print arg_$arg_num
PIRCODE
        $arg_num ++;
    }

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
    my ($srm, $mv) = @_;

    # Emit complete label.
    # Emit label generation code.
    my $pir = <<'PIRCODE';
COMPLETE:

    $S0 = pc
    gen_pir = concat "PC"
    gen_pir = concat $S0
    gen_pir = concat ": \n"

    gen_pir = concat "\n# END OF TRANSLATED BYTECODE\n\n"

    # Insert constants.
    $P0 = iter h_const
    $S0 = "\n"
L1_CST:
    $S1 = shift $P0
    if_null $S1, L2_CST
    $S1 = $P0[$S1]
    $S0 = concat $S1
    goto L1_CST
L2_CST:
    $S0 = concat "\n"
    gen_pir = concat $S0, gen_pir
PIRCODE

    # SRM post translation code
    $pir .= "\n### post_translation\n";
    my $srm_pt = $srm->post_translation();
    $pir .= sub_meta($srm_pt, $mv, 'post_translation');
    $pir .= "### end post_translation\n\n";

    # Emit the end of the translator PIR.
    $pir .= <<'PIRCODE';
    .return (gen_pir)
.end

PIRCODE

    # Return generated code.
    return $pir;
}


# Inserts auto-magically instantiated meta-variable locals.
# #########################################################
sub insert_automagicals {
    my ($pir, $mv) = @_;

    my %type = (
        'I' =>  'int',
        'N' =>  'num',
        'S' =>  'string',
        'P' =>  'pmc',
    );

    # Loop over keys to look for automagicals and build up declaration list.
    my $decls = q{};
    foreach (sort keys %{$mv}) {
        if (/^([INSP])_ARG_(\d+)$/ || /^([INSP])TEMP(\d+)$/) {
            $decls .= "  .local $type{$1} $mv->{$_}\n";
        }
    }

    # Insert 'em.
    $pir =~ s/[ \t]*\$\{AUTO_MAGICALS\}/$decls/;
    return $pir;
}


# Substiture meta variables.
# ##########################
sub sub_meta {
    my ($pir, $mv, $code_source) = @_;
    $code_source ||= "(unknown)";

    # Substiture in known meta-variables.
    for (keys %$mv) {
        $pir =~ s/\${$_}/$mv->{$_}/g;
    }

    # We need to automagically instantiate [INSP]_ARG_\d+ and [INSP]TEMP\d+.
    while ($pir =~ /\$\{([INS])TEMP(\d+)\}/g) {
        my $key = $1 . 'TEMP' . $2;
        my $value = '$' . $1 . $2;
        $pir =~ s/\$\{$key\}/$value/g;
    }
    while ($pir =~ /\$\{PTEMP(\d+)\}/g) {
        my $key = 'PTEMP' . $1;
        my $value = 'P_temp_' . $1;
        $mv->{$key} = $value;
        $pir =~ s/\$\{$key\}/$value/g;
    }

    # If we have any unsubstituted variables, error.
    if ($pir =~ /\$\{([^}]*)}/) {
        warn "Unknown metavariable $1 used in $code_source\n";
    }

    return $pir;
}


# Usage message.
# ##############
sub usage {
    print <<'USAGE';
Usage:
  perl build/translator.pl src/translation.rules --srm Stack \
    --output src/opcode.pir
USAGE
    exit(1);
}



# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
