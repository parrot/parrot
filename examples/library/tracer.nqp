# Copyright (C) 2010, Parrot Foundation.
# $Id$

=begin
=head1 NAME

examples/library/tracer.nqp - Implementation of the tracing runcore using the Instrument dynpmc

=head1 DESCRIPTION

A simple example of how to use the Instrument dynpmc in nqp.

=head1 SYNOPSIS

% ./parrot-nqp examples/library/tracer.nqp <file>

=cut

=end

Q:PIR {
    load_bytecode 'Instrument/InstrumentLib.pbc'
};

my @args := pir::getinterp__p()[2];
@args.shift();

my $probe := Instrument::Probe.new();
$probe.catchall(1);
$probe.callback('tracer');

my $instr := pir::new__PS('Instrument');
$instr.attach($probe);
$instr.run(@args[0], @args);

##
# Callback that is called by Instrument.
##
sub tracer ($op, $instr_obj, $probe) {
    my $pc_hex       := pir::sprintf__SSP("%04x", [$op.pc()]);
    my $op_name      := $op.family();
    my $param_cnt    := $op.count();
    my $params       := '';
    my $cur_arg      := 0;

    my @arg_list     := ();
    while $cur_arg < $param_cnt {
        # Evaluate in order of:
        # 1. keys
        # 2. constants
        # 3. regs.
        my $arg_str := try_key($op, $cur_arg, @arg_list)
                    // try_constant($op, $cur_arg)
                    // try_register($op, $cur_arg);

        @arg_list.push($arg_str);
        $cur_arg++;
    }

    $params := pir::join__SSP(', ', @arg_list);
    say($pc_hex ~ ' ' ~ $op_name ~ ' ' ~ $params);
};

##
# Try to evaluate current argument as a key.
##
sub try_key($op, $cur_arg, @arg_list) {
    my $arg_type := $op.arg_type($cur_arg);
    my $arg      := $op.get_arg($cur_arg, 1);
    my $arg_str;

    # Keys have the flag 0x20 set.
    if and($arg_type, 0x20) {
        if and($arg_type, 16) {
            # Constant keys are int constants or strings.
            $arg_str := '[' ~ try_constant($op, $cur_arg) ~ ']';
        }
        else {
            # Non-constant keys. Reference regs only.
            $arg_str := '[' ~ try_register($op, $cur_arg) ~ ']';
        }

        my $prev := @arg_list.pop();
        $arg_str := $prev ~ $arg_str;
    }

    return $arg_str;
}

##
# Try to evaluate current argument as a constant.
##
sub try_constant($op, $cur_arg) {
    my $arg_type := $op.arg_type($cur_arg);
    my $arg      := $op.get_arg($cur_arg, 1);
    my $arg_str;

    if and($arg_type, 16) {
        if and($arg_type, 1) {
            # String constant.
            $arg_str := '"' ~ pir::escape__SS($op.get_arg($cur_arg)) ~ '"';
        }
        elsif and($arg_type, 2) {
            # PMC constant.
            $arg_str := 'PC' ~ $arg;
        }
        else {
            # Either integer or float constant.
            $arg_str := $arg;
        }
    }

    return $arg_str;
}

##
# Try to evaluate current argument as a register.
##
sub try_register($op, $cur_arg) {
    my $arg_type := $op.arg_type($cur_arg);
    my $arg      := $op.get_arg($cur_arg, 1);
    my $arg_str;

    # Assume $arg is a register.
    if !$arg_type {
        # 0 is int reg.
        $arg_str := 'I' ~ $arg;
    }
    elsif and($arg_type, 1) {
        # 1 is string reg.
        $arg_str := 'S' ~ $arg;
    }
    elsif and($arg_type, 2) {
        # 2 is pmc.
        $arg_str := 'P' ~ $arg;
    }
    elsif and($arg_type, 3) {
        # 3 is num reg.
        $arg_str := 'N' ~ $arg;
    }

    return $arg_str;
}

##
# ANDs $a and $b and check that the result is $b.
##
sub and($a, $b) {
    pir::band__III($a, $b) == $b;
}

# vim: ft=perl6 expandtab shiftwidth=4:
