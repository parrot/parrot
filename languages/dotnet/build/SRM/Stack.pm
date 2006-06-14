# .NET CLI To PIR Translator
# Stack emulation stack to register mapper. Simple and stupid.
# Inherits from SRM::Base.

package SRM::Stack;
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
	# We need to emit PIR that sets up a dummy stack.
	return <<'PIR';
.local string strPC
${INS} = concat <<"CODE"
    .local pmc s
    s = new ResizablePMCArray
CODE
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
	# We'll emit a label for every single instruction.
	return <<'PIR';
strPC = ${PC}
${INS} = concat "LAB"
${INS} = concat strPC
${INS} = concat ": "
PIR
}

# Pre and post stack operation (op class instructions) hooks.
sub pre_op($$) {
	my $self = shift;
	my ($pops, $pushes) = @_;
	my $register_num = 0;
	my $push_num = 0;
	
	# Emit initial code.
	my $pir = <<'PIR';
# Get current stack types array size.
${ITEMP0} = elements ${STYPES}
PIR

	# Do code for each pop. Need to set up mv's and pop stuff off the stack
	# we're maintaining.
	for (1..$pops) {
		$pir .= <<'PIR';
# Get type (so we can find register type).
dec ${ITEMP0}
${PTEMP0} = ${STYPES}[${ITEMP0}]

# Assign register name.
${STEMP0} = "$"
${STEMP1} = ${PTEMP0}["reg_type_short"]
${STEMP0} = concat ${STEMP1}
${STEMP1} = "$register_num"
${STEMP0} = concat ${STEMP1}
${STACK$register_num} = ${STEMP0}

# Emit pop code.
${INS} = concat ${STACK$register_num}
${INS} = concat " = pop s\n"
PIR
		$pir =~ s/\$register_num/$register_num/g;
		$register_num++;
	}

	# Do code for each push.
	$pir .= "\${ITEMP0} = 0\n";
	for (1..$pushes) {
		$pir .= <<'PIR';
# Get type (so we can find register type).
${PTEMP0} = ${DTYPES}[${ITEMP0}]

# Assign register name.
${STEMP0} = "$"
${STEMP1} = ${PTEMP0}["reg_type_short"]
${STEMP0} = concat ${STEMP1}
${STEMP1} = "$register_num"
${STEMP0} = concat ${STEMP1}
${DEST$push_num} = ${STEMP0}

# Increment dtypes index.
inc ${ITEMP0}
PIR
		$pir =~ s/\$register_num/$register_num/g;
		$pir =~ s/\$push_num/$push_num/g;
		$register_num++;
		$push_num++;
	}

	# Return generated code.
	return $pir;
}

sub post_op($$) {
	my $self = shift;
	my ($pops, $pushes) = @_;
	my $pir = "";

	# Emit code to push stuff back onto the stack.
	for (1..$pushes) {
		$pir .= <<'PIR';
${INS} = concat "push s, "
${INS} = concat ${DEST$push_num}
${INS} = concat "\n"
PIR
		$pir =~ s/\$push_num/$_ - 1/ge;
	}

	# Return it.
	return $pir;
}

# Pre and post branch operation hooks.
sub pre_branch($) {
	my $self = shift;
	my $pops = shift;
	my $register_num = 0;
	
	# Emit initial code.
	my $pir = <<'PIR';
# Get current stack types array size.
${ITEMP0} = elements ${STYPES}
PIR

	# Do code for each pop. Need to set up mv's and pop stuff off the stack
	# we're maintaining.
	for (1..$pops) {
		$pir .= <<'PIR';
# Get type (so we can find register type).
dec ${ITEMP0}
${PTEMP0} = ${STYPES}[${ITEMP0}]

# Assign register name.
${STEMP0} = "$"
${STEMP1} = ${PTEMP0}["reg_type_short"]
${STEMP0} = concat ${STEMP1}
${STEMP1} = "$register_num"
${STEMP0} = concat ${STEMP1}
${STACK$register_num} = ${STEMP0}

# Emit pop code.
${INS} = concat ${STACK$register_num}
${INS} = concat " = pop s\n"
PIR
		$pir =~ s/\$register_num/$register_num/g;
		$register_num++;
	}

	# Return generated code.
	return $pir;
}

sub post_branch($) {
	# Nothing to do here.
	return "";
}

# Pre and post load operation hooks.
sub pre_load($) {
	my $self = shift;
	my $need_dest = shift;
	my $pir = "";

	# If we need a destination, emit PIR to generate one. Otherwise, we've
	# nothing to do here.
	if ($need_dest) {
		$pir .= <<'PIR'
# Just got it in the 0th register of the appropriate type.
${DEST0} = "$"
${STEMP0} = ${LOADTYPE}["reg_type_short"]
${DEST0} = concat ${STEMP0}
${DEST0} = concat "0"
PIR
	}

	return $pir;
}

sub post_load($) {
	my $self = shift;
	my $need_dest = shift;
	my $pir = "";

	if ($need_dest) {
		# Translator needs to emit an instruction to push the loaded value onto
		# the stack.
		$pir .= <<'PIR'
${INS} = concat "push s, "
${INS} = concat ${DEST0}
${INS} = concat "\n"
PIR
	} else {
		# Translator needs to emit an instruction to push the value in the
		# load register onto to the stack.
		$pir .= <<'PIR'
${INS} = concat "push s, "
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

	# If the destination is not going to be a register, the translation code
	# needs the value on the stack top, so pop it off into a register.
	if (!$dest_reg) {
		$pir .= <<'PIR'
# Get type.
${ITEMP0} = elements ${STYPES}
dec ${ITEMP0}
${PTEMP0} = ${STYPES}[${ITEMP0}]

# We'll use register $[INSP]0.
${STACK0} = "$"
${STEMP1} = ${PTEMP0}["reg_type_short"]
${STACK0} = concat ${STEMP1}
${STACK0} = concat "0"

# Emit pop code.
${INS} = concat ${STACK0}
${INS} = concat " = pop s\n"
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
${INS} = concat ${STOREREG}
${INS} = concat " = pop s\n"
PIR
	}

	return $pir;
}

sub pre_call() {
    my $self = shift;
    return <<'PIR';
# See if we've got a return or something to call.
if ${ARGCOUNT} == 0 goto PRE_CALL_RETURN_${CURIC}

# It's a call. Get details of method we're calling.
(${PTEMP0}, ${STEMP0}, ${PTEMP1}, ${PTEMP2}) = method_info_from_token(${ASSEMBLY}, ${ARG0})

# If there is a return type, need to supply a ${DEST0}.
${ITEMP0} = ${PTEMP1}["type"]
if ${ITEMP0} != ELEMENT_TYPE_VOID goto pre_call_HAS_RETURN_${CURIC}
if "${CURIC}" == "73" goto pre_call_HAS_RETURN_${CURIC}
goto pre_call_NO_RETURN_${CURIC}
pre_call_HAS_RETURN_${CURIC}:
${DEST0} = "$"
${STEMP0} = ${PTEMP1}["reg_type_short"]
${DEST0} = concat ${STEMP0}
${DEST0} = concat "0"
pre_call_NO_RETURN_${CURIC}:

# If it's a call to instantiate, need to knock off first arg.
if "${CURIC}" != "73" goto pre_call_NOT_CTOR_${CURIC}
${PTEMP4} = shift ${PTEMP2}
pre_call_NOT_CTOR_${CURIC}:

# Loop over each parameter and put them into ${PARAMS}. Note that they come
# off the stack last to first, but need to be first to last in ${PARAMS}.
${ITEMP0} = elements ${PTEMP2}
${ITEMP2} = elements ${STYPES}
pre_call_PLOOP_${CURIC}:
if ${ITEMP0} == 0 goto PRE_CALL_END_${CURIC}
dec ${ITEMP0}
dec ${ITEMP2}

# Generate name of register to hold value we pop off the stack.
${PTEMP1} = ${STYPES}[${ITEMP2}]
${STEMP0} = "$"
${STEMP1} = ${PTEMP1}["reg_type_short"]
${STEMP0} = concat ${STEMP1}
${ITEMP1} = ${ITEMP0} + 1
${STEMP1} = ${ITEMP1}
${STEMP0} = concat ${STEMP1}

# Put it in the parameter register list.
${PARAMS}[${ITEMP0}] = ${STEMP0}

# Emit code to pop the register.
${INS} = concat ${STEMP0}
${INS} = concat " = pop s\n"

# Next parameter.
goto pre_call_PLOOP_${CURIC}

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
${STEMP0} = concat "0"
${PARAMS}[0] = ${STEMP0}
${INS} = concat ${STEMP0}
${INS} = concat " = pop s\n"

PRE_CALL_END_${CURIC}:
PIR
}

sub post_call() {
    my $self = shift;
    my $pir = <<'PIR';
# See if we've got a return, in which case nothing to do.
if ${ARGCOUNT} == 0 goto POST_CALL_END_${CURIC}

# It's a call. Get details of method we're calling.
(${PTEMP0}, ${STEMP0}, ${PTEMP1}, ${PTEMP2}) = method_info_from_token(${ASSEMBLY}, ${ARG0})

# If there is a return type, need to push ${DEST0} onto the stack.
${ITEMP0} = ${PTEMP1}["type"]
if ${ITEMP0} != ELEMENT_TYPE_VOID goto post_call_HAS_RETURN_${CURIC}
if "${CURIC}" == "73" goto post_call_HAS_RETURN_${CURIC}
goto post_call_NO_RETURN_${CURIC}
post_call_HAS_RETURN_${CURIC}:
${INS} = concat "push s, "
${INS} = concat ${DEST0}
${INS} = concat "\n"
post_call_NO_RETURN_${CURIC}:

POST_CALL_END_${CURIC}:
PIR
}

# Pop everything on the stack.
sub pop_all {
    return <<'PIR'
${INS} = concat "s = new ResizablePMCArray\n"
PIR
}

1;
