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

    # Create a catchall probe which will be called for
    #  each op.
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

TODO: Add inspect so that specific classes can be targetted.

=cut
=end

class Instrument::Event::Class::instantiate is Instrument::Event {

    method _self_init() {
        $!event_type := 'Instrument::Event::Class::instantiate';

        $!probe_obj := Instrument::Probe.new();

        $!probe_obj.inspect('new');
        $!probe_obj.set_callback(pir::get_global__PS('callback'));
    };

    sub callback ($op, $instr_obj, $probe) {
        my $class    := $op.get_arg(1);

        my $data := Q:PIR { %r = new ['ResizablePMCArray'] };
        $data.push($class);
        $data.push($op);
        $data.push($instr_obj);

        Instrument::Event::_raise_event('Instrument::Event::Class::instantiate', $data);
    };
};

=begin
=item Instrument::Event::Class:callmethod

Raises an event whenever a class method is called.

TODO: Add inspect so that specific methods and classes can be targetted.

=cut
=end

class Instrument::Event::Class::callmethod is Instrument::Event {

    method _self_init() {
        $!event_type := 'Instrument::Event::Class::callmethod';

        $!probe_obj := Instrument::Probe.new();

        $!probe_obj.inspect('callmethod');
        $!probe_obj.inspect('callmethodcc');
        $!probe_obj.set_callback(pir::get_global__PS('callback'));
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

# vim: ft=perl6 expandtab shiftwidth=4:
