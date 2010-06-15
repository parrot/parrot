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

sub tracer ($pc, $op, $instr_obj) {
    my $op_lib       := Q:PIR { %r = new ['OpLib'] };
    my $op_code      := pir::set_p_p_ki__PPI($op_lib, $op[0]);
    my $sprintf_args := [$pc];
    my $pc_hex       := pir::sprintf__SSP("%04x", $sprintf_args);
    my $op_name      := $op_code.family_name();
    my $param_cnt    := pir::elements($op_code);
    my $params       := '';
    my $cur_arg      := 0;

    my $arg_list     := [];
    while $cur_arg < $param_cnt {
        my $arg_str;
        my $arg_type := pir::set_i_p_ki__IPI($op_code, $cur_arg);

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
                    my $arg := $instr_obj.get_op_arg($op[$cur_arg + 1], $arg_type);
                    $arg_str := '["' ~ $arg ~ '"]';

                } else {
                    # Integer constant key.
                    $arg_str := '[' ~ $op[$cur_arg + 1] ~ ']';
                }
            } else {
                # Non-constant keys. Reference regs only.
                if !$arg_type {
                    # 0 is int reg.
                    $arg_str := '[I' ~ $op[$cur_arg + 1] ~ ']';
                    
                } elsif pir::band__III($arg_type, 2) == 2 {
                    # 2 is pmc.
                    $arg_str := '[P' ~ $op[$cur_arg + 1] ~ ']';
                }
            }

            my $prev := $arg_list.pop();
            $arg_str := $prev ~ $arg_str;

        } elsif pir::band__III($arg_type, 16) == 16
                && pir::band__III($arg_type, 2) != 2 {
            my $arg := $instr_obj.get_op_arg($op[$cur_arg + 1], $arg_type);

            if pir::band__III($arg_type, 1) == 1 {
                $arg_str := '"' ~ $arg ~ '"';

            } else {
                $arg_str := $arg;
            }
        }  elsif !$arg_type {
            # 0 is int reg.
            $arg_str := 'I' ~ $op[$cur_arg + 1];

        } elsif pir::band__III($arg_type, 1) == 1{
            # 1 is string reg.
            $arg_str := 'S' ~ $op[$cur_arg + 1];

        } elsif pir::band__III($arg_type, 2) == 2 {
            # 2 is pmc.
            if pir::band__III($arg_type, 16) == 16 {
                # Constant pmc.
                $arg_str := 'PC' ~ $op[$cur_arg + 1];
            } else {
                # Normal reg.
                $arg_str := 'P' ~ $op[$cur_arg + 1];
            }

        } elsif pir::band__III($arg_type, 3) == 3 {
            # 3 is num reg.
            $arg_str := 'N' ~ $op[$cur_arg + 1];

        }

        $arg_list.push($arg_str);
        $cur_arg++;
    }

    my $prefix := ' ';
    for $arg_list {
        $params := $params ~ $prefix ~ $_;
        $prefix := ', '
    }

    say($pc_hex ~ ' ' ~ $op_name ~ $params);
};

# vim: ft=perl6 expandtab shiftwidth=4:
