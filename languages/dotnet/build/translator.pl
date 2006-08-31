#! perl
# .NET CLI => PIR Translator Generator
# Script to generate the instruction translator from a rules file and a
# stack to register mapping algorithm.

use strict;
use warnings;
use Getopt::Long;
use lib 'build';

# This is a list of instructions that need the magical enum fixup.
our @need_enum_fix = (
    qw/2E 2F 30 31 32 33 34 35 36 37 3B 3C 3D 3E 3F 40 41 42 43 44/, # branch
    qw/58 59 5A 5B 5C 5D 5E 5F 60 61/, # arithmetic and logical
    'FE01', 'FE02', 'FE03', 'FE04', 'FE05' # compare
);

# Grab parameters.
my ($rules_file, $output_file, $srm_module);
GetOptions(
    "output=s"    => \$output_file,
    "srm=s"        => \$srm_module
) or usage();
$rules_file = shift @ARGV;
usage() if !$rules_file || @ARGV;

# Attempt to laod stack to register mapping module.
require "SRM/$srm_module.pm";
my $srm = "SRM::$srm_module"->new();

# Ensure rules file exists and parse it.
my @rules = ();
if (-e $rules_file) {
    @rules = parse_rules($rules_file);
} else {
    die "Error: Cannot load rules file $rules_file: $!\n";
}

# Create metavariables table.
my $metavars = {};

# Generate initial translator code and populate metafields.
my $pir = generate_initial_pir($srm, \@rules, $metavars);

# Emit translation dispatch table.
$pir .= generate_dispatch_table($srm, \@rules, $metavars);

# Generate instruction translation code from rules.
foreach (@rules) {
	$pir .= generate_rule_code($srm, $_, $metavars);
}

# Generate final translator code.
$pir .= generate_final_pir($srm, $metavars);

# Finally, we need to insert auto-magically instantiated local variables
# into the translator code.
$pir = insert_automagicals($pir, $metavars);

# Append any custom subs that the SRM wants.
my $csubs = $srm->subs();
$pir .= sub_meta($csubs, {}, 'custom subs');

# Finally, write generated PIR to output file.
open my $fh, "> $output_file";
print $fh $pir;
close $fh;

# And display count of ops that can be translated.
print "Currently able to translate " . scalar(@rules) . " out of 213 instructions.\n";


##############################################################################
# Subroutines.
##############################################################################

# Parse rules file and build a data structure.
# ############################################
sub parse_rules {
    # Get filename and open the file.
    my $filename = shift;
    open my $fh, "< $filename" or die "Unable to open $filename: $!\n";
    
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
            $heredoc_value = "";
            $heredoc_terminator = $2;
        }

        # Or is it a value within a rule and not a herdoc?
        elsif (!$in_heredoc && $rule && /^\s*(\w+)\s*=\s*(.+?)\s*$/) {
            # Stash key and value.
            $rule->{$1} = $2;
        }

        # Are we at the end of a heredoc?
        elsif ($in_heredoc && /^$heredoc_terminator\s*$/) {
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
    my $rule = shift;
    
    # Flags we'll set as we go through key/value pairs.
    my ($has_code, $has_class, $has_push, $has_pop, $has_args, $has_trans,
	    $has_typeinfo);

    # Iterate over keys and do validation.
    for (keys %$rule) {
        # name
        if (/^name$/) {
            # always fine
        }

        # code
        elsif (/^code$/) {
            if ($rule->{$_} =~ /^([0-9A-F]{2}\s+)*[0-9A-F]{2}$/) {
                if ($has_code) {
                    die "Duplicate value for code in rule $rule->{'name'}\n";
                } else {
                    $has_code = 1;
                }
            } else {
                die "Invalid value for code in rule $rule->{'name'}\n";
            }
        }

        # class
        elsif (/^class$/) {
            if ($rule->{$_} =~ /^(op|load|store|branch|calling)$/) {
                if ($has_class) {
                    die "Duplicate value for class in rule $rule->{'name'}\n";
                } else {
                    $has_class = 1;
                }
            } else {
                die "Invalid value for class in rule $rule->{'name'}\n";
            }
        }

        # push
        elsif (/^push$/) {
            if ($rule->{$_} =~ /^\d+$/) {
                if ($has_push) {
                    die "Duplicate value for push in rule $rule->{'name'}\n";
                } else {
                    $has_push = 1;
                }
            } else {
                die "Invalid value for push in rule $rule->{'name'}\n";
            }
        }

        # pop
        elsif (/^pop$/) {
            if ($rule->{$_} =~ /^\d+$/) {
                if ($has_pop) {
                    die "Duplicate value for pop in rule $rule->{'name'}\n";
                } else {
                    $has_pop = 1;
                }
            } else {
                die "Invalid value for pop in rule $rule->{'name'}\n";
            }
        }

        # arguments
        elsif (/^arguments$/) {
            if ($has_args) {
                die "Duplicate value for arguments in rule $rule->{'name'}\n";
            } else {
                my @args = split(/\s*,\s+/, $rule->{'arguments'});
                foreach (@args) {
                    die "Invalid argument type $_ in rule $rule->{'name'}\n"
                      unless /^((u?int(8|16|32|64))|float(32|64)|jumptable)$/ ||
                      /^t(string|standalonesig|valuetype|method|field|type)$/;
                }
                $has_args = 1;
            }
        }

        # instruction or pir
        elsif (/^(instruction|pir)$/) {
            if ($has_trans) {
                die "Only one of instruction or pir is allowed in rule " .
                    "$rule->{'name'}\n";
            } else {
                $has_trans = 1;
            }
        }

		# typeinfo
        elsif (/^typeinfo$/) {
            if ($has_typeinfo) {
                die "Duplicate value for typeinfo in rule $rule->{'name'}\n";
            } else {
                $has_typeinfo = 1;
            }
        }
		
        # Unknown key.
        else {
            die "Unknown key $_ in rule $rule->{'name'}\n";
        }
    }

    # Check we had mandatory fields.
    unless ($has_code) {
        die "Mandatory entry code missing in rule $rule->{'name'}\n";
    }
    unless ($has_class) {
        die "Mandatory entry class missing in rule $rule->{'name'}\n";
    }
    unless ($has_trans) {
        die "Translation (instruction or pir) not provided in rule " .
            "$rule->{'name'}\n";
    }

	# typeinfo must be supplied with op, load and calling, but not with
    # anything else.
	if ($has_typeinfo && $rule->{'class'} ne 'op' && $rule->{'class'} ne 'store' &&
	    $rule->{'class'} ne 'load' && $rule->{'class'} ne 'calling') {
		die "typeinfo only valid for rules of class op, calling or load in " . 
		    "$rule->{'name'}\n";
	} elsif (!$has_typeinfo && ($rule->{'class'} eq 'op' ||
	         $rule->{'class'} eq 'load' || $rule->{'class'} eq 'calling')) {
		die "typeinfo must be supplied for rule $rule->{'name'}\n";
	}

    # pop and push forbidden for calling
    if ($rule->{'class'} eq 'calling' && ($has_pop || $has_push)) {
        die "pop and push not allowed for class calling in rule $rule->{'name'}\n";
    }

	# Set default values.
	$rule->{'pop'} ||= 0;
	$rule->{'push'} ||= 0;
	$rule->{'instruction'} ||= "";
	$rule->{'pir'} ||= "";
	$rule->{'arguments'} = "" unless $has_args;
}


# Generate the translator initialization code.
# ############################################
sub generate_initial_pir {
    my $srm = shift;
	my $rules = shift;
	my $mv = shift;

	# Get number of locals we need for ${STACKn} and ${DESTm} and set up
	# their meta-variables.
	my ($max_pop, $max_push) = (0, 0);
	foreach (@$rules) {
		if ($_->{'pop'} > $max_pop) {
			$max_pop = $_->{'pop'};
		}
		if ($_->{'push'} > $max_push) {
			$max_push = $_->{'push'};
		}
	}
	my $stack_locals = "";
	for (0..$max_pop - 1) {
		$stack_locals .= $stack_locals ? ', ' : '.local string ';
		$stack_locals .= "stack$_";
		$mv->{"STACK$_"} = "stack$_";
	}
	my $dest_locals = "";
	for (0..$max_push - 1) {
		$dest_locals .= $dest_locals ? ', ' : '.local string ';
		$dest_locals .= "dest$_";
		$mv->{"DEST$_"} = "dest$_";
	}

    # Emit the translator PIR.
    my $pir = <<TRANSPIR;
# THIS IS A GENERATED FILE! DO NOT EDIT!

.HLL '_dotnet', ''

.sub trans_instructions
    .param pmc assembly
    .param pmc class
    .param pmc meth
    .param pmc ptypes
    .param pmc ltypes
    .param pmc rettype
    .param int trace
    .local pmc bc, ex, stypes, dtypes, loadtype, type_trans, c_params, escaper
    .local pmc ehs, eh, ss_propogate, ss
    .local string gen_pir, loadreg, storereg, err, str_ic, tmp
    .local int pc, next_pc, bc_length, cur_ic, pop_count, label_num, sp_dest
    .local int i, j, type, try_offset, try_length, try_end, handler_offset, eh_flags
    .local int class_type, class_id
	$stack_locals
	$dest_locals
	\${AUTO_MAGICALS}

	# Type constants.
	.const int ELEMENT_TYPE_VOID = 0x01
	.const int ELEMENT_TYPE_BOOLEAN = 0x02
	.const int ELEMENT_TYPE_CHAR = 0x03
	.const int ELEMENT_TYPE_I1 = 0x04
	.const int ELEMENT_TYPE_U1 = 0x05
	.const int ELEMENT_TYPE_I2 = 0x06
	.const int ELEMENT_TYPE_U2 = 0x07
	.const int ELEMENT_TYPE_I4 = 0x08
	.const int ELEMENT_TYPE_U4 = 0x09
	.const int ELEMENT_TYPE_I8 = 0x0A
	.const int ELEMENT_TYPE_U8 = 0x0B
	.const int ELEMENT_TYPE_R4 = 0x0C
	.const int ELEMENT_TYPE_R8 = 0x0D
	.const int ELEMENT_TYPE_STRING = 0x0E
	.const int ELEMENT_TYPE_PTR = 0x0F
	.const int ELEMENT_TYPE_BYREF = 0x10
	.const int ELEMENT_TYPE_VALUETYPE = 0x11
	.const int ELEMENT_TYPE_CLASS = 0x12
	.const int ELEMENT_TYPE_ARRAY= 0x14
	.const int ELEMENT_TYPE_TYPEDBYREF = 0x16
	.const int ELEMENT_TYPE_I = 0x18
	.const int ELEMENT_TYPE_U = 0x19
	.const int ELEMENT_TYPE_FNPTR = 0x1B
	.const int ELEMENT_TYPE_OBJECT = 0x1C
	.const int ELEMENT_TYPE_SZARRAY = 0x1D
	.const int ELEMENT_TYPE_INTERNAL = 0x21
    
    # Trace info - param and local types.
    if trace != 2 goto NO_IN_TRACE
printerr "    PTYPES: "
i = elements ptypes
j = 0
PTYPES_LOOP:
if j == i goto PTYPES_LOOP_END
type_trans = ptypes[j]
type = type_trans["type"]
printerr type
printerr " "
inc j
goto PTYPES_LOOP
PTYPES_LOOP_END:
printerr "\\n"
printerr "    LTYPES: "
i = elements ltypes
j = 0
LTYPES_LOOP:
if j == i goto LTYPES_LOOP_END
type_trans = ltypes[j]
type = type_trans["type"]
printerr type
printerr " "
inc j
goto LTYPES_LOOP
LTYPES_LOOP_END:
printerr "\\n"
NO_IN_TRACE:
    
    # Get bytecode and initialize pc.
    bc = meth.get_bytecode()
    bc_length = bc.get_length()
    pc = 0

	# Initialize stack types array.
	stypes = new ResizablePMCArray

    # Instantiate a bytecode escaper.
    escaper = find_global "Data::Escape", "String"

    # Source of generated label numbers set to zero.
    label_num = 0
TRANSPIR

    # Set up some more metavariables.
    $mv->{'ASSEMBLY'} = 'assembly';
    $mv->{'BC'} = 'bc';
    $mv->{'INS'} = 'gen_pir';
    $mv->{'PC'} = 'pc';
	$mv->{'NEXTPC'} = 'next_pc';
	$mv->{'PTYPES'} = 'ptypes';
	$mv->{'LTYPES'} = 'ltypes';
	$mv->{'STYPES'} = 'stypes';
	$mv->{'DTYPES'} = 'dtypes';
	$mv->{'LOADTYPE'} = 'loadtype';
    $mv->{'RETTYPE'} = 'rettype';
    $mv->{'LABELNUM'} = 'label_num';
    $mv->{'EHANDLERS'} = 'ehs';

    # SRM pre translation code.
    $pir .= "### pre_translation\n";
    my $srm_pt = $srm->pre_translation();
    $pir .= sub_meta($srm_pt, $mv, 'pre_translation');
    $pir .= "### end pre_translation\n\n";

    # Emit first bit of PIR to loop over instructions. Each translation 
    # routine will jump back to TRANS_LOOP after translating the instruction.
    $pir .= <<'PIRCODE';
    # If we have exception handlers, need some intial stuff emitted.
    ehs = bc.get_eh()
    if null ehs goto NO_EH_HEADER
    i = elements ehs
    gen_pir = concat ".local pmc cur_exception\n"
    gen_pir = concat ".local pmc saved_ehs\nsaved_ehs = new .FixedPMCArray\nsaved_ehs = "
    tmp = i
    gen_pir = concat tmp
    gen_pir = concat "\n"
NO_EH_HEADER:
    gen_pir = concat "pushmark 0\n"

    # Translation loop.
    ss_propogate = new .Hash
TRANS_LOOP:
    pc = bc.get_pos()
	next_pc = pc
    if pc >= bc_length goto COMPLETE
    
    # If we have a stack type state propogated here, put it in place.
    ss = ss_propogate[pc]
    if null ss goto NO_SS_PROP
    stypes = ss
NO_SS_PROP:

	# Generate label.
PIRCODE

	# Emit label generation code.
	$pir .= "### gen_label\n";
    my $srm_label = $srm->gen_label();
    $pir .= sub_meta($srm_label, $mv, 'gen_label');
    $pir .= "### end gen_label\n\n";

    # Emit code to do exception related stuff.
    $pir .= <<'PIRCODE';
    # Look through exception handlers.
    if null ehs goto END_EH_LOOP
    i = elements ehs
EH_LOOP:
    dec i
    if i < 0 goto END_EH_LOOP
    eh = ehs[i]
    
    # If this is the start of a try block, emit a push_eh instruction.
    try_offset = eh.get_try_offset()
    try_length = eh.get_try_length()
    if try_offset != pc goto NOT_TRY_START
    gen_pir = concat "push_eh LAB"
    handler_offset = eh.get_handler_offset()
    tmp = handler_offset
    gen_pir = concat tmp
    gen_pir = concat "\npushmark "
    $I0 = i + 1
    tmp = $I0
    gen_pir = concat tmp
    gen_pir = concat "\n"
NOT_TRY_START:

    # If this is the start of a typed exception handler...
    handler_offset = eh.get_handler_offset()
    eh_flags = eh.get_flags()
    if eh_flags != 0 goto NOT_TYPED_EH_START
    if handler_offset != pc goto NOT_TYPED_EH_START

    # Emit code to get the .NET exception object and check if it's of the type that
    # is accepted.
    gen_pir = concat ".get_results (cur_exception, $S1000000)\n"
    gen_pir = concat "$P1000001 = cur_exception[\"obj\"]\n"
    class_type = eh.get_class_type()
    class_id = eh.get_class_id()
    gen_pir = concat "$I1000000 = isa $P1000001, "
    ($P0, $S0) = class_info_from_ehtype(assembly, class_type, class_id)
    $S0 = namespace_to_key($S0)
    gen_pir = concat $S0
    gen_pir = concat "\nif $I1000000 goto TYPED_EH_FOUND_"
    tmp = handler_offset
    gen_pir = concat tmp
    gen_pir = concat "\nthrow $P1000000\nTYPED_EH_FOUND_"
    gen_pir = concat tmp
    gen_pir = concat ":\n"

    # Need to fix up stack type state. Create new empty array.
    stypes = new ResizablePMCArray
    type_trans = new Hash
    type_trans["type"] = ELEMENT_TYPE_CLASS
    type_trans["byref"] = 0
    annotate_reg_type(type_trans)
    stypes = push type_trans
    loadtype = type_trans

    # If the object is OK, we'll not have re-thrown and will need to put it on
    # the stack. Emit code to deal with that.
PIRCODE
    my $pop_all = $srm->pop_all();
    $pir .= "### pop_all (typed eh)\n";
	$pir .= sub_meta($pop_all, $mv, "pop_all for typed exception handler");
	$pir .= "### end pop_all (typed eh)\n";
    my $pre_load = $srm->pre_load(0);
	$pir .= "### pre_load (typed eh)\n";
	$pir .= sub_meta($pre_load, { %$mv, LOADREG => 'loadreg' }, "pre_load for typed exception handler");
	$pir .= "### end pre_load (typed eh)\n";
    $pir .= <<'PIRCODE';
    loadreg = "$P1000001"
PIRCODE
    my $post_load = $srm->post_load(0);
	$pir .= "### post_load (typed eh)\n";
	$pir .= sub_meta($post_load, { %$mv, LOADREG => 'loadreg' }, "post_load for typed exception handler");
	$pir .= "### end post_load (typed eh)\n";
    $pir .= <<'PIRCODE';
NOT_TYPED_EH_START:

    # If this is the start of a finally handler...
    if eh_flags != 2 goto NOT_FINALLY_START
    if handler_offset != pc goto NOT_FINALLY_START

    # Emit code to get and stash the .NET exception object, then put a jump
    # label.
    gen_pir = concat ".get_results (cur_exception, $S1000000)\nsaved_ehs["
    tmp = i
    gen_pir = concat tmp
    gen_pir = concat "] = cur_exception\nFINALLY_"
    tmp = handler_offset
    gen_pir = concat tmp
    gen_pir = concat ": "
NOT_FINALLY_START:

    # Goto next handler.
    goto EH_LOOP
END_EH_LOOP:
PIRCODE

    # Return generated code.
    return $pir;
}


# Generate the dispatch table.
# ############################
sub generate_dispatch_table {
    my $srm = shift;
    my @rules = @{shift()};
    my $mv = shift;

    # Make a copy of the original instruction code before we trash it.
    foreach (@rules) {
        $_->{'orig_code'} = $_->{'code'};
    }

    # Put rules with the same startcode into a group.
    my %groups = ();
    foreach (@rules) {
        $_->{'code'} =~ /^(\w{2})/;
        $groups{$1} ||= [];
        push @{$groups{$1}}, $_;
    }

    # Go through groups, sorted by start code.
    my @rules_grouped = ();
    foreach (sort keys %groups) {
        # If there is only a single element with a single code...
        if (@{$groups{$_}} == 1 && $groups{$_}->[0]->{'code'} =~ /^\w{2}$/) {
            # Just put that rule into the list, with no grouping.
            push @rules_grouped, $groups{$_}->[0];
        } else {
            # Strip first code from all the groups.
            foreach (@{$groups{$_}}) {
                $_->{'code'} =~ s/^\w{2} //;
            }

            # Build a group entry.
            push @rules_grouped, {
                code    => $_,
                group   => $groups{$_}
            };
        }
    }

    # We'll use recursion to build up a binary search style tree to dispatch
    # to the translation code for an instruction in something like O(log(n))
    # rather than O(n).
	my $pir = <<PIRCODE;
	# Translation code dispatch table.
	cur_ic = bc.read_uint8()
	next_pc += 1
PIRCODE
    $pir .= binary_dispatch_table('', @rules_grouped);

    # Emit unknown instruction code.
    $pir .= <<PIRCODE;
INS_NOT_FOUND_ERROR:
    ex = new Exception
	err = "Attempt to translate unknown instruction (code "
	str_ic = cur_ic
	err = concat str_ic
	err = concat ")"
    ex["_message"] = err 
    throw ex

PIRCODE

    # Restore original instruction codes, but remove spaces.
    foreach (@rules) {
        $_->{'code'} = $_->{'orig_code'};
        $_->{'code'} =~ s/\s//g;
    }

    # Return generated PIR.
    return $pir;
}


# Binary dispatch table builder.
# ##############################
sub binary_dispatch_table {
    my $prefix = shift;
    my @rules = @_;
    my $pir = "";

    # Ensure groups have been built properly and we only dispatch one
    # byte at a time.
    foreach (@rules) {
        if ($_->{'code'} =~ /\w\s+\w/) {
            die "Currently unable to build dispatch table for instructions of " .
                "more than 2 bytes in rule $_->{'name'}\n";
        }
    }

    # If we have 3 or less rules, dispatch directly to the translator.
    if (@rules <= 3) {
        my %byte2_todo = ();
        foreach (@rules) {
            # If we have a group, need to build dispatch code for that.
            if ($_->{'group'}) {
                $pir .= "    if cur_ic == 0x$_->{'code'} goto B2_BRANCH_$prefix$_->{'code'}\n";
                $byte2_todo{"$prefix$_->{'code'}"} = $_->{'group'};
            } else {
                # Not a group; jump straight to instruction.
                my $name = $_->{'name'};
                $name =~ s/\./_/g;
                $pir .= "    if cur_ic == 0x$_->{'code'} goto INS_TRANS_$name\n";
            }
        }
        
        # If we don't branch at any of them, we've got an unknown op.
        $pir .= "    goto INS_NOT_FOUND_ERROR\n";

        # We may need to bulid second byte dispatch tables.
        foreach (keys %byte2_todo) {
            my @rules = @{$byte2_todo{$_}};
            @rules = sort { 
                $a->{'code'} =~ /^(\w{2})/;
                my $x = $1;
                $b->{'code'} =~ /^(\w{2})/;
                hex($x) <=> hex($1)
            } @rules;
            $pir .= "B2_BRANCH_$_:\n";
            $pir .= "    cur_ic = bc.read_uint8()\n    next_pc += 1\n";
            $pir .= binary_dispatch_table($_, @rules);
        }
    } else {
        # Otherwise, split the rules into two groups.
        my $split_point = int(@rules / 2);
        my @r1 = @rules[0 .. $split_point - 1];
        my @r2 = @rules[$split_point .. $#rules];

        # Emit branch code.
        $pir .= "    if cur_ic >= 0x$r2[0]->{'code'} goto INS_BRANCH_$prefix$r2[0]->{'code'}\n";
        $pir .= "    if cur_ic < 0x$r2[0]->{'code'} goto INS_BRANCH_$prefix$r1[$#r1]->{'code'}\n";

        # Recurse to make code for sub branches.
        $pir .= "INS_BRANCH_$prefix$r1[$#r1]->{'code'}:\n";
        $pir .= binary_dispatch_table($prefix, @r1);
        $pir .= "INS_BRANCH_$prefix$r2[0]->{'code'}:\n";
        $pir .= binary_dispatch_table($prefix, @r2);
    }

    # Return generated code.
    return $pir;
}


# Generate translation code relating to a rule.
# #############################################
sub generate_rule_code {
	my $srm = shift;
	my $rule = shift;
	my $mv = shift;
	my @localmv = ();
	my $pir = "";
	
	# Make current instruction code meta-variable.
	$mv->{'CURIC'} = $rule->{'code'};
	push @localmv, 'CURIC';

	# Emit dispatch label.
	my $name = $rule->{'name'};
	$pir .= "    # Translation code for $name\n";
	$name =~ s/\./_/g;
	$pir .= "INS_TRANS_$name:\n";

    # Emit trace code.
    $pir .= <<PIR;
if trace != 2 goto NO_TRACE_$name
printerr "    $name STS: "
i = elements stypes
j = 0
STS_LOOP_$name:
if j == i goto STS_LOOP_END_$name
type_trans = stypes[j]
type = type_trans["type"]
printerr type
printerr " "
inc j
goto STS_LOOP_$name
STS_LOOP_END_$name:
printerr "\\n"
NO_TRACE_$name:
PIR
	
	# Emit code to read arguments for the op and set argument meta-variables.
	# There is something slightly curious going on here. sub_meta will create
	# the .local declarations for arguments, but it needs to know the argument
	# type. Thus we assign to meta-variable I_ARG_0, I_ARG_1 etc, let sub_meta
	# do what it needs to, then set ARG0 in the meta-variables table to whatever
	# I_ARG_0 turns out to me. We also keep track of the fact that ARG0 should
	# only exist inside this rule.
	my @args = split(/,\s*/, $rule->{'arguments'});
    $mv->{'ARGCOUNT'} = scalar @args;
    push @localmv, 'ARGCOUNT';
	my $arg_num = 0;
	my $arg_size = 0;
	foreach (@args) {
		my $out;
		my $arg_name;

		# uint8
		if (/^uint8$/) {
			$out =  "    \${I_ARG_$arg_num} = bc.read_uint8()\n    next_pc += 1\n";
			$arg_name = "I_ARG_$arg_num";
		}

		# int8
		elsif (/^int8$/) {
			$out =  "    \${I_ARG_$arg_num} = bc.read_int8()\n    next_pc += 1\n";
			$arg_name = "I_ARG_$arg_num";
		}

		# uint16
		elsif (/^uint16$/) {
			$out =  "    \${I_ARG_$arg_num} = bc.read_uint16()\n    next_pc += 2\n";
			$arg_name = "I_ARG_$arg_num";
		}

		# int16
		elsif (/^int16$/) {
			$out =  "    \${I_ARG_$arg_num} = bc.read_int16()\n    next_pc += 2\n";
			$arg_name = "I_ARG_$arg_num";
		}

		# uint32
		elsif (/^uint32$/) {
			$out =  "    \${I_ARG_$arg_num} = bc.read_uint32()\n    next_pc += 4\n";
			$arg_name = "I_ARG_$arg_num";
		}

		# int32
		elsif (/^int32$/) {
			$out =  "    \${I_ARG_$arg_num} = bc.read_int32()\n    next_pc += 4\n";
			$arg_name = "I_ARG_$arg_num";
		}

		# float32
		elsif (/^float32$/) {
			$out =  "    \${N_ARG_$arg_num} = bc.read_float32()\n    next_pc += 4\n";
			$arg_name = "N_ARG_$arg_num";
		}

		# float64
		elsif (/^float64$/) {
			$out =  "    \${N_ARG_$arg_num} = bc.read_float64()\n    next_pc += 8\n";
			$arg_name = "N_ARG_$arg_num";
		}

        # tfield
		elsif (/^tfield$/) {
			$out =  "    \${I_ARG_$arg_num} = bc.read_tfield()\n    next_pc += 4\n";
			$arg_name = "I_ARG_$arg_num";
		}

        # tmethod
		elsif (/^tmethod$/) {
			$out =  "    \${I_ARG_$arg_num} = bc.read_tmethod()\n    next_pc += 4\n";
			$arg_name = "I_ARG_$arg_num";
		}

        # ttype
		elsif (/^ttype$/) {
			$out =  "    \${I_ARG_$arg_num} = bc.read_ttype()\n    next_pc += 4\n";
			$arg_name = "I_ARG_$arg_num";
		}

        # tstring
		elsif (/^tstring$/) {
			$out =  "    \${I_ARG_$arg_num} = bc.read_tstring()\n    next_pc += 4\n";
			$arg_name = "I_ARG_$arg_num";
		}

        # jumptable
		elsif (/^jumptable$/) {
			$out = <<"PIR";
    \${P_ARG_$arg_num} = new FixedPMCArray
    i = bc.read_uint32()
    next_pc += 4
    \${P_ARG_$arg_num} = i
    j = 0
JT_LOOP_$name:
    if j == i goto JT_LOOP_END_$name
    \$I0 = bc.read_int32()
    next_pc += 4
    \${P_ARG_$arg_num}[j] = \$I0
    inc j
    goto JT_LOOP_$name
JT_LOOP_END_$name:
PIR
			$arg_name = "P_ARG_$arg_num";
		}

		# Unknown.
		else {
			die "Known argument type $_ not implemented yet.\n";
		}

		# Generate PIR.
		$pir .= sub_meta($out, $mv, "argument read");
		$mv->{"ARG$arg_num"} = $mv->{$arg_name};
		push @localmv, "ARG$arg_num";
        $arg_num++;
	}

    # Generate code that we need to insert to handle enum fixups if this is
    # an instruction that needs it.
    my $pre_translate_code = "";
    if (grep { $rule->{'code'} eq $_ } @need_enum_fix) {
        $pre_translate_code = <<'PIR'
(${STEMP0}, ${STACK0}, ${STACK1}) = fix_enum_operands(${STYPES}, ${STACK0}, ${STACK1})
${INS} = concat ${STEMP0}
PIR
    }
	
	# Now we split based upon the class.
	# Operations (op class).
	$rule->{'pop'} ||= 0;
	$rule->{'push'} ||= 0;
	if ($rule->{'class'} eq 'op') {
		# Init destination types array.
		$pir .= "    dtypes = new ResizablePMCArray\n";

		# Insert typeinfo code (sets up dtypes).
		$pir .= "### typeinfo\n";
		$pir .= sub_meta($rule->{'typeinfo'}, $mv, 
			"typeinfo for rule $rule->{'name'}");
		$pir .= "\n" if $pir !~ /\n$/;
		$pir .= "### end typeinfo\n";

		# Now call pre_op and append code that it generates.
		my $pre_op = $srm->pre_op($rule->{'pop'}, $rule->{'push'});
		$pir .= "### pre_op\n";
		$pir .= sub_meta($pre_op, $mv, "pre_op for rule $rule->{'name'}");
		$pir .= "### end pre_op\n";

        # Add pre-translate code, if any.
        $pir .= sub_meta($pre_translate_code, $mv, "pre-translate for $rule->{'name'}");

		# If we have PIR for the instruction, just take that. If not, we need
		# to generate it from the "to generate" instruction directive.
		$pir .= "### translation\n";
		if ($rule->{'pir'}) {
			$pir .= sub_meta($rule->{'pir'}, $mv, 
				"pir for rule $rule->{'name'}");
		} else {
			$pir .= sub_meta(ins_to_pir($rule->{'instruction'}), $mv, 
				"pir for rule $rule->{'name'}");
		}
		$pir .= "\n" unless $pir =~ /\n$/;
		$pir .= "### end translation\n";

		# Emit code to fix up the stack type array.
		for (1..$rule->{'pop'}) {
			$pir .= "    type_trans = pop stypes\n";
		}
		for (1..$rule->{'push'}) {
			$pir .= "    type_trans = pop dtypes\n";
			$pir .= "    stypes = push type_trans\n";
		}

		# Finally, call post_op and append code it generates.
		my $post_op = $srm->post_op($rule->{'pop'}, $rule->{'push'});
		$pir .= "### post_op\n";
		$pir .= sub_meta($post_op, $mv, "post_op for rule $rule->{'name'}");
		$pir .= "### end post_op\n";
	}

	# Loads (load class).
	elsif ($rule->{'class'} eq 'load') {
		# Undef the loadtype so we can detect case where typeinfo fails to set
		# it.
		$pir .= "    loadtype = null\n";

		# Insert typeinfo code.
		$pir .= "### typeinfo\n";
		$pir .= sub_meta($rule->{'typeinfo'}, $mv, 
			"typeinfo for rule $rule->{'name'}");
		$pir .= "\n" if $pir !~ /\n$/;
		$pir .= "### end typeinfo\n";

		# Does the translator code actually load a value or just give back a
		# register name?
		my $need_dest;
		if ($rule->{'pir'} =~ /\$\{DEST0\}/ &&
		    $rule->{'pir'} =~ /\$\{LOADREG\}/) {
			die "pir must use one of \${DEST0} or \${LOADREG} in rule " .
				"$rule->{'name'}\n";
        } elsif ($rule->{'instruction'} =~ /\$\{DEST0\}/ &&
		         $rule->{'instruction'} =~ /\$\{LOADREG\}/) {
			die "pir must use one of \${DEST0} or \${LOADREG} in rule " .
				"$rule->{'name'}\n";
		} elsif ($rule->{'pir'} =~ /\$\{DEST0\}/ || $rule->{'instruction'} =~ /\$\{DEST0\}/) {
			$need_dest = 1;
		} elsif ($rule->{'pir'} =~ /\$\{LOADREG\}/ || $rule->{'instruction'} =~ /\$\{LOADREG\}/) {
			$need_dest = 0;
			$mv->{'LOADREG'} = 'loadreg';
			push @localmv, 'LOADREG';
		} else {
			die "pir or instruction must use one of \${DEST0} or \${LOADREG} in rule " .
				"$rule->{'name'}\n";
		}

		# Now call pre_load and append code that it generates.
		my $pre_load = $srm->pre_load($need_dest);
		$pir .= "### pre_load\n";
		$pir .= sub_meta($pre_load, $mv, "pre_load for rule $rule->{'name'}");
		$pir .= "### end pre_load\n";

		# If we have PIR for the instruction, just take that. If not, we need
		# to generate it from the "to generate" instruction directive.
		$pir .= "### translation\n";
		if ($rule->{'pir'}) {
			$pir .= sub_meta($rule->{'pir'}, $mv, 
				"pir for rule $rule->{'name'}");
		} else {
			$pir .= sub_meta(ins_to_pir($rule->{'instruction'}), $mv, 
				"pir for rule $rule->{'name'}");
		}
		$pir .= "\n" unless $pir =~ /\n$/;
		$pir .= "### end translation\n";

		# Push load type onto the stack types array.
		$pir .= "    stypes = push loadtype\n";

        # Emit code to clone value types for the need_dest set case.
        if ($need_dest) {
            my $label = "LD_VALTYPE_$name";
            $pir .= <<PIR
\$I1000000 = loadtype["type"]
if \$I1000000 != ELEMENT_TYPE_VALUETYPE goto $label
gen_pir = concat dest0
gen_pir = concat " = clone "
gen_pir = concat dest0
gen_pir = concat "\\n"
$label:
PIR
        }

		# Finally, call post_load and append code it generates.
		my $post_load = $srm->post_load($need_dest);
		$pir .= "### post_load\n";
		$pir .= sub_meta($post_load, $mv, "post_load for rule $rule->{'name'}");
		$pir .= "### end post_load\n";

        # Emit code to clone value types for the need_dest not set case.
        if (!$need_dest) {
            my $label = "LD_VALTYPE_$name";
            my $pre_op = $srm->pre_op(1, 1);
		    $pre_op = sub_meta($pre_op, $mv, "pre_op for rule $rule->{'name'} value type clone");
            my $post_op = $srm->post_op(1, 1);
		    $post_op = sub_meta($post_op, $mv, "post_op for rule $rule->{'name'} value type clone");
            $pir .= <<PIR
\$I1000000 = loadtype["type"]
if \$I1000000 != ELEMENT_TYPE_VALUETYPE goto $label
dtypes = new ResizablePMCArray
dtypes[0] = loadtype
$pre_op
gen_pir = concat dest0
gen_pir = concat " = clone "
gen_pir = concat stack0
gen_pir = concat "\\n"
$post_op
$label:
PIR
        }
	}
	
	# Stores (store class).
	elsif ($rule->{'class'} eq 'store') {
		# Does the translator code actually store a value or just give back a
		# register name where the value would be stored in?
		my $dest_reg;
		if ($rule->{'pir'} =~ /\$\{STACK0\}/ &&
		    $rule->{'pir'} =~ /\$\{STOREREG\}/) {
			die "pir must use one of \${STACK0} or \${STOREREG} in rule " .
				"$rule->{'name'}\n";
        } elsif ($rule->{'instruction'} =~ /\$\{STACK0\}/ &&
		    $rule->{'instruction'} =~ /\$\{STOREREG\}/) {
			die "instruction must use one of \${STACK0} or \${STOREREG} in rule " .
				"$rule->{'name'}\n";
		} elsif ("$rule->{'pir'}$rule->{'instruction'}" =~ /\$\{STACK0\}/) {
			$dest_reg = 0;
		} elsif ("$rule->{'pir'}$rule->{'instruction'}" =~ /\$\{STOREREG\}/) {
			$dest_reg = 1;
			$mv->{'STOREREG'} = 'storereg';
			push @localmv, 'STOREREG';
		} else {
			die "pir or instruction must use one of \${STACK0} or \${STOREREG} in rule " .
				"$rule->{'name'}\n";
		}

        # Insert typeinfo code if we have any. Note that it has no obligations.
        if ($rule->{'typeinfo'}) {
		    $pir .= "### typeinfo\n";
		    $pir .= sub_meta($rule->{'typeinfo'}, $mv, 
			    "typeinfo for rule $rule->{'name'}");
		    $pir .= "\n" if $pir !~ /\n$/;
		    $pir .= "### end typeinfo\n";
        }

		# Now call pre_store and append code that it generates.
		my $pre_store = $srm->pre_store($dest_reg);
		$pir .= "### pre_store\n";
		$pir .= sub_meta($pre_store, $mv, "pre_store for rule $rule->{'name'}");
		$pir .= "### end pre_store\n";

		# If we have PIR for the instruction, just take that. If not, we need
		# to generate it from the "to generate" instruction directive.
		$pir .= "### translation\n";
		if ($rule->{'pir'}) {
			$pir .= sub_meta($rule->{'pir'}, $mv, 
				"pir for rule $rule->{'name'}");
		} else {
			$pir .= sub_meta(ins_to_pir($rule->{'instruction'}), $mv, 
				"pir for rule $rule->{'name'}");
		}
		$pir .= "\n" unless $pir =~ /\n$/;
		$pir .= "### end translation\n";

		# Finally, call post_store and append code it generates.
		my $post_store = $srm->post_store($dest_reg);
		$pir .= "### post_store\n";
		$pir .= sub_meta($post_store, $mv, "post_store for rule $rule->{'name'}");
		$pir .= "### end post_store\n";

        # Now pop type off the stack types array.
		$pir .= "    type_trans = pop stypes\n";
	}

	# Branches (branch class).
	elsif ($rule->{'class'} eq 'branch') {
		# Call pre_branch and append code that it generates.
		my $pre_branch = $srm->pre_branch($rule->{'pop'});
		$pir .= "### pre_branch\n";
		$pir .= sub_meta($pre_branch, $mv, "pre_branch for rule $rule->{'name'}");
		$pir .= "### end pre_branch\n";

        # Add pre-translate code, if any.
        $pir .= sub_meta($pre_translate_code, $mv, "pre-translate for $rule->{'name'}");

		# If we have PIR for the instruction, just take that. If not, we need
		# to generate it from the "to generate" instruction directive.
		$pir .= "### translation\n";
		if ($rule->{'pir'}) {
			$pir .= sub_meta($rule->{'pir'}, $mv, 
				"pir for rule $rule->{'name'}");
		} else {
			$pir .= sub_meta(ins_to_pir($rule->{'instruction'}), $mv, 
				"pir for rule $rule->{'name'}");
		}
		$pir .= "### end translation\n";

		# Now emit code to fix up the stack type array and propogate it.
		for (1..$rule->{'pop'}) {
			$pir .= "    type_trans = pop stypes\n";
		}
        if ($rule->{'code'} eq '45') {
            $pir .= <<'PIRCODE';
i = elements P_arg_0
SS_PROP_LOOP_switch:
if i == 0 goto SS_PROP_LOOP_EXIT_switch
    dec i
    j = P_arg_0[i]
    sp_dest = next_pc + j
    ss = clone stypes
    ss_propogate[sp_dest] = ss
    goto SS_PROP_LOOP_switch
SS_PROP_LOOP_EXIT_switch:
PIRCODE
        } else {
            $pir .= <<'PIRCODE';
sp_dest = next_pc + I_arg_0
ss = clone stypes
ss_propogate[sp_dest] = ss
PIRCODE
        }

		# Finally, call post_branch and append code it generates.
		my $post_branch = $srm->post_branch($rule->{'pop'});
		$pir .= "### post_branch\n";
		$pir .= sub_meta($post_branch, $mv, "post_branch for rule $rule->{'name'}");
		$pir .= "### end post_branch\n";
	}

    # Calls/returns (calling class)
    elsif ($rule->{'class'} eq 'calling') {
		# Init destination types array and params array and set meta-variable.
		$pir .= "    dtypes = new ResizablePMCArray\n";
        $pir .= "    c_params = new ResizableStringArray\n";
        $mv->{'PARAMS'} = 'c_params';
        push @localmv, 'PARAMS';

        # If we don't have an ARG0, we'll fake it out. This is needed as ret will
        # never have a method to call, thus no argument, but we still want to use
        # this mechanism. Ugly, huh?
        unless ($mv->{'ARG0'}) {
            $mv->{'ARG0'} = 'I_arg_0';
            push @localmv, 'ARG0';
        }

		# Insert typeinfo code (sets up dtypes as needed).
		$pir .= "### typeinfo\n";
		$pir .= sub_meta($rule->{'typeinfo'}, $mv, 
			"typeinfo for rule $rule->{'name'}");
		$pir .= "\n" if $pir !~ /\n$/;
		$pir .= "### end typeinfo\n";

		# Now call pre_call and append code that it generates.
		my $pre_call = $srm->pre_call();
		$pir .= "### pre_call\n";
		$pir .= sub_meta($pre_call, $mv, "pre_call for rule $rule->{'name'}");
		$pir .= "### end pre_call\n";

		# If we have PIR for the instruction, just take that. If not, we need
		# to generate it from the "to generate" instruction directive.
		$pir .= "### translation\n";
		if ($rule->{'pir'}) {
			$pir .= sub_meta($rule->{'pir'}, $mv, 
				"pir for rule $rule->{'name'}");
		} else {
			$pir .= sub_meta(ins_to_pir($rule->{'instruction'}), $mv, 
				"pir for rule $rule->{'name'}");
		}
		$pir .= "\n" unless $pir =~ /\n$/;
		$pir .= "### end translation\n";

		# Emit code to fix up the stack type array.
		$pir .= <<PIR;
pop_count = elements c_params
goto INS_TRANS_CP_LOOP_CHK_$name
INS_TRANS_CP_LOOP_$name:
type_trans = pop stypes
dec pop_count
INS_TRANS_CP_LOOP_CHK_$name:
if pop_count != 0 goto INS_TRANS_CP_LOOP_$name
pop_count = elements dtypes
if pop_count == 0 goto INS_TRANS_PUSH_LOOP_$name
type_trans = dtypes[0]
push stypes, type_trans
INS_TRANS_PUSH_LOOP_$name:
PIR

		# Finally, call post_call and append code it generates.
		my $post_call = $srm->post_call();
		$pir .= "### post_call\n";
		$pir .= sub_meta($post_call, $mv, "post_call for rule $rule->{'name'}");
		$pir .= "### end post_call\n";
	}

	# Unsupported class.
	else {
		die "Do not know how to handle class $rule->{'class'}\n";
	}

	# Finally, emit code to go to translate next instruction.
	$pir .= "    goto TRANS_LOOP\n\n";

	# Clean up meta-variables hash.
	foreach (@localmv) {
		delete $mv->{$_};
	}

	# Return generated code.
	return $pir;
}


# Instruction to PIR routine.
# ###########################
sub ins_to_pir {
	my $ins = shift;
	my $mv = shift;
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
		"\"\n\${INS} = concat $1\n\${INS} = concat \""
	/ge;
	$ins = "\${INS} = concat \"$ins\"\n";
		
	# Return PIR.
	return $ins;
}


# Generate the translator trailer code.
# #####################################
sub generate_final_pir {
    my $srm = shift;
    my $mv = shift;
    
    # Emit complete label.
    my $pir .= "COMPLETE:\n";

    # SRM post translation code
    $pir .= "### post_translation\n";
    my $srm_pt = $srm->post_translation();
    $pir .= sub_meta($srm_pt, $mv, 'post_translation');
    $pir .= "### end post_translation\n";

    # Emit the end of the translator PIR.
    $pir .= <<TRANSPIR;
    .return(gen_pir)
.end
TRANSPIR

    # Return generated code.
    return $pir;
}


# Inserts auto-magically instantiated meta-variable locals.
# #########################################################
sub insert_automagicals {
	my $pir = shift;
	my $mv = shift;

	# Loop over keys to look for automagicals and build up declaration list.
	my $decls = "";
	for (keys %$mv) {
		if (/^([INSP])_ARG_(\d+)$/ || /^([INSP])TEMP(\d+)$/) {
			my $type = $1 eq 'I' ? 'int' :
			           $1 eq 'N' ? 'num' :
					   $1 eq 'S' ? 'string' : 'pmc';
			$decls .= "    .local $type $mv->{$_}\n";
		}
	}

	# Insert 'em.
	$pir =~ s/[ \t]*\$\{AUTO_MAGICALS\}/$decls/;
	return $pir;
}


# Substiture meta variables.
# ##########################
sub sub_meta {
    my $pir = shift;
    my $mv = shift;
    my $code_source = shift;
	$code_source ||= "(unknown)";

    # Substiture in known meta-variables.
    for (keys %$mv) {
        $pir =~ s/\${$_}/$mv->{$_}/g;
    }

	# We need to automagically instantiate [INSP]_ARG_\d+ and [INSP]TEMP\d+.
	while ($pir =~ /\$\{([INSP])_ARG_(\d+)\}/g) {
		my $key = "${1}_ARG_$2";
		my $value = "${1}_arg_$2";
		$mv->{$key} = $value;
		$pir =~ s/\$\{$key\}/$value/g;
	}
	while ($pir =~ /\$\{([INSP])TEMP(\d+)\}/g) {
		my $key = "${1}TEMP$2";
		my $value = "${1}_temp_$2";
		$mv->{$key} = $value;
		$pir =~ s/\$\{$key\}/$value/g;
	}

    # If we have any unsubstituted variables, error.
    if ($pir =~ /\$\{([^}]*)}/) {
        die "Unknown metavariable $1 used in $code_source\n";
    } else {
        return $pir;
    }
}


# Usage message.
# ##############
sub usage {
    print <<USAGE;
Usage:
  perl build/translator.pl src/translation.rules --srm Stack \
    --ouptput src/it.pir
USAGE
    exit(1);
}


