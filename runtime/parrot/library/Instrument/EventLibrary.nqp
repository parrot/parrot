#! nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=begin

=head1 NAME

runtime/parrot/library/Instrument/EventLibrary.nqp

    Library for the many classes that provide handlers for Events.

=head1 SYNOPSIS

    Each class in this library provides an interface to hook into
    a particular event.

    Example usage:

    # Create an event handler to receive loadlib notifications.
    evt = new ['Instrument';'Event';'Internal';'loadlib']
    evt.'set_callback'('loadlib_callback')

    instr = new ['Instrument']
    instr.attach(evt)

=cut

=end


=begin
=item Instrument::Event::Internal::loadlib

Raises an event whenever a dynlib is loaded.
Events are raised in the C code.

=cut
=end

class Instrument::Event::Internal::loadlib is Instrument::Event {

    method _self_init() {
        $!event_type := 'Instrument::Event::Internal::loadlib';
    };
};

=begin
=item Instrument::Event::Class:instantiate

Raises an event whenever a class is instantiated.

TODO: How about instantiations from C? Inspecting new opcodes
      don't really help that. Redo. Hold off until InstrumentPMC is done.

=cut
=end

class Instrument::Event::Class::instantiate is Instrument::Event {
    method _self_init() {
        $!event_type := 'Instrument::Event::Class::instantiate';

        my $class_hash := Q:PIR { %r = new ['Hash'] };
        self.data($class_hash);

        $!probe_obj := Instrument::Probe.new();
        $!probe_obj.data(self);

        $!probe_obj.inspect('new');
        $!probe_obj.callback(pir::get_global__PS('callback'));
    };

    method inspect ($class) {
        pir::set_p_k_ic($!class_hash, $class, 1);
    };

    sub callback ($op, $instr_obj, $probe) {
        my $class    := $op.get_arg(1);

        # Check if class is to be inspected.
        my $data := $probe.data().data();
        if pir::set__IP($data) == 0
        || pir::exists_i_p_k__IPP($data, $class) {
            my $data := Q:PIR { %r = new ['ResizablePMCArray'] };
            $data.push($class);
            $data.push($op);
            $data.push($instr_obj);

            Instrument::Event::_raise_event('Instrument::Event::Class::instantiate', $data);
        }
    };
};

=begin
=item Instrument::Event::Class:callmethod

Raises an event whenever a class method is called.

TODO: Similarly, how about calling from C? Hold off until InstrumentPMC is done.

=cut
=end

class Instrument::Event::Class::callmethod is Instrument::Event {

    method _self_init() {
        $!event_type := 'Instrument::Event::Class::callmethod';

        $!probe_obj := Instrument::Probe.new();

        $!probe_obj.inspect('callmethod');
        $!probe_obj.inspect('callmethodcc');
        $!probe_obj.callback(pir::get_global__PS('callback'));
    };

    sub callback ($op, $instr_obj) {
        my $method    := $op.get_arg(1);

        my $data := Q:PIR { %r = new ['ResizablePMCArray'] };
        $data.push($method);
        $data.push($op);
        $data.push($instr_obj);

        Instrument::Event::_raise_event('Instrument::Event::Class::callmethod', $data);
    };
};

class Instrument::Event::GC::allocate is Instrument::Event {
    method _self_init() {
        $!event_type := 'Instrument::Event::GC::allocate';
    };
};

class Instrument::Event::GC::reallocate is Instrument::Event {
    method _self_init() {
        $!event_type := 'Instrument::Event::GC::reallocate';
    };
};

class Instrument::Event::GC::free is Instrument::Event {
    method _self_init() {
        $!event_type := 'Instrument::Event::GC::free';
    };
};

class Instrument::Event::GC::administration is Instrument::Event {
    method _self_init() {
        $!event_type := 'Instrument::Event::GC::administration';
    };
};

# vim: ft=perl6 expandtab shiftwidth=4:
