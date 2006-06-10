# .NET CLI To PIR Translator
# This SRM algorithm keeps track of the current stack depth and assigns to
# virtual registers numbered by depth. This eliminates the need for a stack.
# Inherits from SRM::Base.

package SRM::Register;
use strict;
use SRM::Base;
our @ISA = qw/SRM::Base/;

# Constructor. Just base this class on a hash.
sub new() {
	my $invocant = shift;
	return bless {}, $invocant;
}

# Pre-translation hook.
sub pre_translation() {
	# We need a stack depth and a string for label gen and some
	# storage for stack depths and stack type states that we are
	# propogating.
	return <<'PIR';
.local string strPC
.local int stack_depth
.local pmc prop_type_state, prop_stack_depth
stack_depth = -1
prop_type_state = new Hash
prop_stack_depth = new Hash
PIR
}

# Post translation hook.
sub post_translation() {
	# Nothing to do.
	return "";
}

# Extra subroutines required for the mapper.
sub subs() {
	# No extra subs.
	return "";
}

# Label generation.
sub gen_label() {
	# We'll emit a label for every single instruction. While we kinda find
	# basic blocks, we don't discover backward branches until late to do
	# otherwise. Also, putting a label everywhere doesn't hurt the final
	# Parrot bytecode that is produced.
	my $pir = <<'PIR';
strPC = ${PC}
${INS} = concat "LAB"
${INS} = concat strPC
${INS} = concat ": "
PIR
	
	# This is also a good place (as we call gen_label before translating
	# every instruction) to see if we need to instate a stack type state
	# that was propogated to this instruction.
	$pir .= <<'PIR';
${PTEMP0} = prop_type_state[${PC}]
if ${PTEMP0} == "" goto NOWT_TO_PROPOGATE
stack_depth = prop_stack_depth[${PC}]
NOWT_TO_PROPOGATE:
PIR

	# Return.
	return $pir;
}

# Pre and post stack operation (op class instructions) hooks.
sub pre_op($$) {
	my $self = shift;
	my ($pops, $pushes) = @_;
	my $register_num = 0;
	my $push_num = 0;
	my $pir = '';

	# Do code for each pop. Need to set up mv's and pop stuff off the stack
	# we're maintaining.
	for (1..$pops) {
		$pir .= <<'PIR';
# Get type (so we can find register type).
${PTEMP0} = ${STYPES}[stack_depth]

# Set register name.
${STEMP0} = "$"
${STEMP1} = ${PTEMP0}["reg_type_short"]
${STEMP0} = concat ${STEMP1}
${STEMP1} = stack_depth
${STEMP0} = concat ${STEMP1}
${STACK$register_num} = ${STEMP0}

# Decrement stack height.
dec stack_depth
PIR
		$pir =~ s/\$register_num/$register_num/g;
		$register_num++;
	}

	# Do code for each push.
	$pir .= "\${ITEMP0} = 0\n";
	for (1..$pushes) {
		$pir .= <<'PIR';
# Increment stack depth.
inc stack_depth

# Get type (so we can find register type).
${PTEMP0} = ${DTYPES}[${ITEMP0}]

# Assign register name.
${STEMP0} = "$"
${STEMP1} = ${PTEMP0}["reg_type_short"]
${STEMP0} = concat ${STEMP1}
${STEMP1} = stack_depth
${STEMP0} = concat ${STEMP1}
${DEST$push_num} = ${STEMP0}

# Increment dtypes index.
inc ${ITEMP0}
PIR
		$pir =~ s/\$push_num/$push_num/g;
		$push_num++;
	}

	# Return generated code.
	return $pir;
}

sub post_op($$) {
	# Nothing to do.
	return "";
}

# Pre and post branch operation hooks.
sub pre_branch($) {
	my $self = shift;
	my $pops = shift;
	my $register_num = 0;
	my $pir = '';

	# Do code for each pop. Need to set up mv's and pop stuff off the stack
	# we're maintaining.
	for (1..$pops) {
		$pir .= <<'PIR';
# Get type (so we can find register type).
${PTEMP0} = ${STYPES}[stack_depth]

# Set register name.
${STEMP0} = "$"
${STEMP1} = ${PTEMP0}["reg_type_short"]
${STEMP0} = concat ${STEMP1}
${STEMP1} = stack_depth
${STEMP0} = concat ${STEMP1}
${STACK$register_num} = ${STEMP0}

# Decrement stack height.
dec stack_depth
PIR
		$pir =~ s/\$register_num/$register_num/g;
		$register_num++;
	}

	# Return generated code.
	return $pir;
}

sub post_branch($) {
	my $self = shift;
	my $pops = shift;
	my $pir = '';

	# Branches mean we need to deal with basic block-ish stuff. If the branch
	# did not pop anything it is unconditional, so next instruction needs to
	# have an empty stack type state propogated to it if nothing has been
	# propogated there already.
	$pir .= <<'PIR';
if 0x${CURIC} == 0x45 goto POST_BRANCH_switch_${CURIC}
${ITEMP0} = ${NEXTPC} + I_arg_0 # XXX Can't use ${ARG0} :-(
prop_type_state[${ITEMP0}] = ${STYPES}
prop_stack_depth[${ITEMP0}] = stack_depth
goto POST_BRANCH_NOT_switch_${CURIC}

POST_BRANCH_switch_${CURIC}:
i = elements P_arg_0
POST_BRANCH_switch_${CURIC}_LOOP:
if i == 0 goto POST_BRANCH_switch_${CURIC}_LOOP_EXIT
    dec i
    j = P_arg_0[i]
    ${ITEMP0} = ${NEXTPC} + j
    prop_type_state[${ITEMP0}] = ${STYPES}
    prop_stack_depth[${ITEMP0}] = stack_depth
    goto POST_BRANCH_switch_${CURIC}_LOOP
POST_BRANCH_switch_${CURIC}_LOOP_EXIT:

POST_BRANCH_NOT_switch_${CURIC}:
PIR
	return $pir;
}

# Pre and post load operation hooks.
sub pre_load($) {
	my $self = shift;
	my $need_dest = shift;
	my $pir = "";

	# If we need a destination, we simply supply the register to load
	# into here.
	if ($need_dest) {
		$pir .= <<'PIR'
inc stack_depth 
${DEST0} = "$"
${STEMP0} = ${LOADTYPE}["reg_type_short"]
${DEST0} = concat ${STEMP0}
${STEMP0} = stack_depth
${DEST0} = concat ${STEMP0}
PIR
	}

	return $pir;
}

sub post_load($) {
	my $self = shift;
	my $need_dest = shift;
	my $pir = "";

	# If the register name to load from was supplied, we need to generate
	# the name of the destination register emulating the stack position and
	# generate a move instruction.
	if (!$need_dest) {
		$pir .= <<'PIR'
inc stack_depth 
${STEMP0} = "$"
${STEMP1} = ${LOADTYPE}["reg_type_short"]
${STEMP0} = concat ${STEMP1}
${STEMP1} = stack_depth
${STEMP0} = concat ${STEMP1}

${INS} = concat ${STEMP0}
${INS} = concat " = "
${INS} = concat ${LOADREG}
${INS} = concat "\n"
PIR
	}

	return $pir;
}

# Pre and post store operation hooks.
sub pre_store($) {
	my $self = shift;
	my $dest_reg = shift;
	my $pir = "";

	# If the destination isn't a register, determine register name now.
	if (!$dest_reg) {
		$pir .= <<'PIR'
# Get type (so we can find register type).
${PTEMP0} = ${STYPES}[stack_depth]

# Set register name.
${STEMP0} = "$"
${STEMP1} = ${PTEMP0}["reg_type_short"]
${STEMP0} = concat ${STEMP1}
${STEMP1} = stack_depth
${STEMP0} = concat ${STEMP1}
${STACK0} = ${STEMP0}

# Decrement stack height.
dec stack_depth
PIR
	}

	return $pir;
}

sub post_store($) {
	my $self = shift;
	my $dest_reg = shift;
	my $pir = "";

	# If destination is a register then it is up to the SRM to do the store.
	# Otherwise, there's nothing to do here.
	if ($dest_reg) {
		$pir .= <<'PIR'
# Get type (so we can find register type).
${PTEMP0} = ${STYPES}[stack_depth]

# Set register name.
${STEMP0} = "$"
${STEMP1} = ${PTEMP0}["reg_type_short"]
${STEMP0} = concat ${STEMP1}
${STEMP1} = stack_depth
${STEMP0} = concat ${STEMP1}

# Emit move.
${INS} = concat ${STOREREG}
${INS} = concat " = "
${INS} = concat ${STEMP0}
${INS} = concat "\n"

# Decrement stack height.
dec stack_depth
PIR
	}

	return $pir;
}

# Pre and post call hooks.
sub pre_call {
    my $self = shift;
    return <<'PIR'
# See if we've got a return or something to call.
if ${ARGCOUNT} == 0 goto PRE_CALL_RETURN_${CURIC}

# It's a call. Get details of method we're calling.
(${PTEMP0}, ${STEMP0}, ${PTEMP1}, ${PTEMP2}) = method_info_from_token(${ASSEMBLY}, ${ARG0})

# If it's a call to instantiate, need to knock off first arg.
if "${CURIC}" != "73" goto pre_call_NOT_CTOR_${CURIC}
${PTEMP4} = shift ${PTEMP2}
pre_call_NOT_CTOR_${CURIC}:

# Loop over each parameter and put them into ${PARAMS}. Note that they come
# off the stack last to first, but need to be first to last in ${PARAMS}.
${ITEMP0} = elements ${PTEMP2}
${ITEMP2} = elements ${STYPES}
pre_call_PLOOP_${CURIC}:
if ${ITEMP0} == 0 goto PRE_CALL_PLOOP_END_${CURIC}
dec ${ITEMP0}
dec ${ITEMP2}

# Generate name of register to hold value we pop off the stack.
${PTEMP3} = ${STYPES}[${ITEMP2}]
${STEMP0} = "$"
${STEMP1} = ${PTEMP3}["reg_type_short"]
${STEMP0} = concat ${STEMP1}
${STEMP1} = stack_depth
${STEMP0} = concat ${STEMP1}

# Put it in the parameter register list.
${PARAMS}[${ITEMP0}] = ${STEMP0}

# Next parameter.
dec stack_depth
goto pre_call_PLOOP_${CURIC}
PRE_CALL_PLOOP_END_${CURIC}:

# If there is a return type, need to supply a ${DEST0}.
${ITEMP0} = ${PTEMP1}["type"]
if ${ITEMP0} != ELEMENT_TYPE_VOID goto pre_call_HAS_RETURN_${CURIC}
if "${CURIC}" == "73" goto pre_call_HAS_RETURN_${CURIC}
goto pre_call_NO_RETURN_${CURIC}
pre_call_HAS_RETURN_${CURIC}:
${DEST0} = "$"
${STEMP0} = ${PTEMP1}["reg_type_short"]
${DEST0} = concat ${STEMP0}
inc stack_depth
${STEMP0} = stack_depth
${DEST0} = concat ${STEMP0}
pre_call_NO_RETURN_${CURIC}:

# Finished.
goto PRE_CALL_END_${CURIC}

# It's a return. See if we have a return value.
PRE_CALL_RETURN_${CURIC}:
${ITEMP0} = elements ${DTYPES}
if ${ITEMP0} == 0 goto PRE_CALL_END_${CURIC}

# Get type of return value and build code to pop it.
${ITEMP1} = elements ${STYPES}
dec ${ITEMP1}
${PTEMP0} = ${STYPES}[${ITEMP1}]
${STEMP0} = "$"
${STEMP1} = ${PTEMP0}["reg_type_short"]
${STEMP0} = concat ${STEMP1}
${STEMP1} = stack_depth
${STEMP0} = concat ${STEMP1}
${PARAMS}[0] = ${STEMP0}
dec stack_depth

PRE_CALL_END_${CURIC}:
PIR
}

sub post_call {
    # Nothing to do.
    return "";
}

sub pop_all {
    return "stack_depth = -1\n"
}
