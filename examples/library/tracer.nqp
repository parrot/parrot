# Copyright (C) 2010, Parrot Foundation.
# $Id$

=begin
=head1 NAME

examples/library/tracer.nqp - Implementation of the tracing runcore using the Instrument dynpmc

=head1 DESCRIPTION

A simple example of how to use the Instrument dynpmc in nqp.

=head1 SYNOPSIS

% ./parrot-nqp examples/library/tracer.nqp <file>

=end

Q:PIR {
    load_bytecode 'Instrument/InstrumentLib.pbc'
};

my $args := pir::getinterp__p()[2];
$args.shift();

my $probe := Instrument::Probe.new();
$probe.make_catchall();
$probe.set_callback('tracer');

my $instr := Q:PIR { %r = new ['Instrument'] };
$instr.attach($probe);
$instr.run($args[0], $args);

sub tracer ($op, $instr_obj, $probe) {
    my $sprintf_args := [$op.pc()];
    my $pc_hex       := pir::sprintf__SSP("%04x", $sprintf_args);
    my $op_name      := $op.family();
    my $param_cnt    := $op.count();
    my $params       := '';
    my $cur_arg      := 0;

    my $arg_list     := [];
    while $cur_arg < $param_cnt {
        my $arg_str;
        my $arg_type := $op.arg_type($cur_arg);
        my $arg      := $op.get_arg($cur_arg, 1);

        # Evaluate in order of:
        # 1. keys
        # 2. constants
        # 3. regs.
        # TODO: There's probably a smarter way to do the code below. Messy!
        if pir::band__III($arg_type, 0x20) == 0x20 {
            # Keys.
            if pir::band__III($arg_type, 16) == 16 {
                # Constant keys are int constants or strings.
                if pir::band__III($arg_type, 2) == 2 {
                    # String constant key.
                    my $arg_val := pir::escape__SS($op.get_arg($cur_arg));
                    $arg_str := '["' ~ $arg_val ~ '"]';

                } else {
                    # Integer constant key.
                    $arg_str := '[' ~ $arg ~ ']';
                }
            } else {
                # Non-constant keys. Reference regs only.
                if !$arg_type {
                    # 0 is int reg.
                    $arg_str := '[I' ~ $arg ~ ']';
                    
                } elsif pir::band__III($arg_type, 2) == 2 {
                    # 2 is pmc.
                    $arg_str := '[P' ~ $arg ~ ']';
                }
            }

            my $prev := $arg_list.pop();
            $arg_str := $prev ~ $arg_str;

        } elsif pir::band__III($arg_type, 16) == 16
                && pir::band__III($arg_type, 2) != 2 {

            if pir::band__III($arg_type, 1) == 1 {
                my $arg_val := pir::escape__SS($op.get_arg($cur_arg));
                $arg_str := '"' ~ $arg_val ~ '"';

            } else {
                $arg_str := $arg;
            }
        }  elsif !$arg_type {
            # 0 is int reg.
            $arg_str := 'I' ~ $arg;

        } elsif pir::band__III($arg_type, 1) == 1{
            # 1 is string reg.
            $arg_str := 'S' ~ $arg;

        } elsif pir::band__III($arg_type, 2) == 2 {
            # 2 is pmc.
            if pir::band__III($arg_type, 16) == 16 {
                # Constant pmc.
                $arg_str := 'PC' ~ $arg;
            } else {
                # Normal reg.
                $arg_str := 'P' ~ $arg;
            }

        } elsif pir::band__III($arg_type, 3) == 3 {
            # 3 is num reg.
            $arg_str := 'N' ~ $arg;

        }

        $arg_list.push($arg_str);
        $cur_arg++;
    }

    $params := pir::join__SSP(', ', $arg_list);

    say($pc_hex ~ ' ' ~ $op_name ~ ' ' ~ $params);
};

# vim: ft=perl6 expandtab shiftwidth=4:
