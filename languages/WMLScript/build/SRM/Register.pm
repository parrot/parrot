# WMLSscript To PIR Translator
# This SRM algorithm keeps track of the current stack depth and assigns to
# virtual registers numbered by depth. This eliminates the need for a stack.

use strict;

package SRM::Register;

#use base qw(SRM::Base);

# Constructor. Just base this class on a hash.
sub new {
    my $invocant = shift;
    return bless {}, $invocant;
}

# Pre-translation hook.
sub pre_translation {
    # We need a stack depth and some
    # storage for stack depths that we are
    # propogating.
    return <<'PIR';
    .local int stack_depth
    stack_depth = -1
PIR
}

# Post translation hook.
sub post_translation {
    # Nothing to do.
    return q{};
}

# Pre intruction (common) hook.
sub pre_instruction {
    # Nothing to do.
    return q{};
}

# Pre and post stack operation (op class instructions) hooks.
sub pre_op {
    my $self = shift;
    my ($pops, $pushes) = @_;
    my $pir = q{};

    # Do code for each pop. Need to set up mv's and pop stuff off the stack
    # we're maintaining.
    for my $pop_num (0 .. $pops-1) {
        $pir .= <<"PIR";
    # Set register name.
    \${STACK$pop_num} = "\$P"
    \$S0 = stack_depth
    \${STACK$pop_num} = concat \$S0
    # Decrement stack height.
    dec stack_depth
PIR
    }

    # Do code for each push.
    for my $push_num (0 .. $pushes-1) {
        $pir .= <<"PIR";
    # Increment stack depth.
    inc stack_depth
    # Assign register name.
    \${DEST$push_num} = "\$P"
    \$S0 = stack_depth
    \${DEST$push_num} = concat \$S0
PIR
    }

    # Return generated code.
    return $pir;
}

sub post_op {
    # Nothing to do.
    return q{};
}

# Pre and post branch operation hooks.
sub pre_branch {
    my $self = shift;
    my ($pops) = @_;
    my $pir = q{};

    # Do code for each pop. Need to set up mv's and pop stuff off the stack
    # we're maintaining.
    for my $pop_num (0 .. $pops-1) {
        $pir .= <<"PIR";
    # Set register name.
    \${STACK$pop_num} = "\$P"
    \$S0 = stack_depth
    \${STACK$pop_num} = concat \$S0
    # Decrement stack height.
    dec stack_depth
PIR
    }

    # Return generated code.
    return $pir;
}

sub post_branch {
    # Nothing to do.
    return q{};
}

# Pre and post load operation hooks.
sub pre_load {
    return <<'PIR';
    # Increment stack depth.
    inc stack_depth
    # Assign register name.
    ${DEST0} = "$P"
    $S0 = stack_depth
    ${DEST0} = concat $S0
PIR
}

sub post_load {
    # Nothing to do.
    return q{};
}

# Pre and post store operation hooks.
sub pre_store {
    # Nothing to do.
    return q{};
}

sub post_store {
    return <<'PIR';
    # Set register name.
    $S0 = "$P"
    $S1 = stack_depth
    $S0 = concat $S1
    # Emit move.
    ${INS} = concat "  "
    ${INS} = concat ${STOREREG}
    ${INS} = concat " = "
    ${INS} = concat $S0
    ${INS} = concat "\n"
    # Decrement stack height.
    dec stack_depth
PIR
}

# Pre and post call hooks.
sub pre_call {
    my $self = shift;
    my ($nb_arg) = @_;

    return <<"PIR";
    \${PARAMS} = ""
    \$I0 = $nb_arg
    \$I1 = 0
L1_\${CURIC}:
    unless \$I1 < \$I0 goto L2_\${CURIC}
    if \$I1 == 0 goto L3_\${CURIC}
    \${PARAMS} = concat ", ", \${PARAMS}
L3_\${CURIC}:
    \$S0 = "\$P"
    \$S1 = stack_depth
    \$S0 = concat \$S1
    \${PARAMS} = concat \$S0, \${PARAMS}
    # Decrement stack height.
    dec stack_depth
    inc \$I1
    goto L1_\${CURIC}
L2_\${CURIC}:
    # Increment stack depth.
    inc stack_depth
    # Assign register name.
    \${DEST0} = "\$P"
    \$S0 = stack_depth
    \${DEST0} = concat \$S0
PIR
}

sub post_call {
    # Nothing to do.
    return q{};
}

sub pop_all {
    return "  stack_depth = -1\n";
}

1;

