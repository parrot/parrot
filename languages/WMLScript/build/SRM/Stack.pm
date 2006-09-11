# WMLSscript To PIR Translator
# Stack emulation stack to register mapper. Simple and stupid.

use strict;

package SRM::Stack;

#use base qw(SRM::Base);

# Constructor. Just base this class on a hash.
sub new {
    my $invocant = shift;
    return bless {}, $invocant;
}

# Pre-translation hook.
sub pre_translation {
    # We need to emit PIR that sets up a dummy stack.
    return <<'PIR';
    ${INS} = concat <<'PIRCODE'
  .local pmc reg0, reg1, reg2
  .local pmc s
  new s, .ResizablePMCArray
PIRCODE
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
    my $register_num = 0;
    my $pir = q{};

    # Do code for each pop. Need to set up mv's and pop stuff off the stack
    # we're maintaining.
    for my $pop_num (0 .. $pops-1) {
        $pir .= <<"PIR";
    # Assign register name.
    \${STACK$pop_num} = "reg$register_num"
    # Emit pop code.
    \${INS} = concat "  "
    \${INS} = concat \${STACK$pop_num}
    \${INS} = concat " = pop s\\n"
PIR
        $register_num++;
    }

    for my $push_num (0 .. $pushes-1) {
        $pir .= <<"PIR";
    # Assign register name.
    \${DEST$push_num} = "reg$register_num"
PIR
        $register_num++;
    }

    # Return generated code.
    return $pir;
}

sub post_op {
    my $self = shift;
    my ($pops, $pushes) = @_;
    my $pir = q{};

    # Emit code to push stuff back onto the stack.
    for my $push_num (0 .. $pushes-1) {
        $pir .= <<"PIR";
    \${INS} = concat "  push s, "
    \${INS} = concat \${DEST$push_num}
    \${INS} = concat "\\n"
PIR
    }

    # Return it.
    return $pir;
}

# Pre and post branch operation hooks.
sub pre_branch {
    my $self = shift;
    my ($pops) = @_;
    my $register_num = 0;
    my $pir = q{};

    # Do code for each pop. Need to set up mv's and pop stuff off the stack
    # we're maintaining.
    for my $pop_num (0 .. $pops-1) {
        $pir .= <<"PIR";
    # Assign register name.
    \${STACK$pop_num} = "reg$register_num"
    # Emit pop code.
    \${INS} = concat "  "
    \${INS} = concat \${STACK$pop_num}
    \${INS} = concat " = pop s\\n"
PIR
        $register_num++;
    }

    # Return generated code.
    return $pir;
}

sub post_branch {
    # Nothing to do here.
    return q{};
}

# Pre and post load operation hooks.
sub pre_load {
    return <<'PIR';
    # Just got it in the 0th register.
    ${DEST0} = "reg0"
PIR
}

sub post_load {
    return <<'PIR';
    ${INS} = concat "  push s, "
    ${INS} = concat ${DEST0}
    ${INS} = concat "\n"
PIR
}

# Pre and post store operation hooks.
sub pre_store {
    # Nothing to do here.
    return q{};
}

sub post_store {
    return <<'PIR';
    ${INS} = concat "  "
    ${INS} = concat ${STOREREG}
    ${INS} = concat " = pop s\n"
PIR
}

sub pre_call {
    my $self = shift;
    my ($nb_arg) = @_;

    return <<"PIR";
    \${PARAMS} = ""
    \$I0 = $nb_arg
    dec \$I0
    \$I1 = \$I0
L1_\${CURIC}:
    unless \$I1 >= 0 goto L2_\${CURIC}
    \${INS} = concat "  \$P"
    \$S0 = \$I1
    \${INS} = concat \$S0
    \${INS} = concat " = pop s\\n"
    if \$I1 == \$I0 goto L3_\${CURIC}
    \${PARAMS} = concat ", ", \${PARAMS}
L3_\${CURIC}:
    \$S1 = "\$P"
    \$S1 = concat \$S1, \$S0
    \${PARAMS} = concat \$S1, \${PARAMS}
    dec \$I1
    goto L1_\${CURIC}
L2_\${CURIC}:
    # Just got it in the 0th register.
    \${DEST0} = "reg0"
PIR
}

sub post_call {
    return <<'PIR';
    ${INS} = concat "  push s, "
    ${INS} = concat ${DEST0}
    ${INS} = concat "\n"
PIR
}

# Pop everything on the stack.
sub pop_all {
    return <<'PIR';
    ${INS} = concat "  s = new .ResizablePMCArray\n"
PIR
}

1;
