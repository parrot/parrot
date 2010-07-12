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
        $!event_type := 'Internal::loadlib';
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

=begin
=item Instrument::Event::GC

Interface to register callbacks for any given GC event.

Usage (in PIR):
    # Inspect a group (allocate) and two separate free events.
    $P0 = get_hll_global ['Instrument';'Event'], 'GC'
    $P1 = $P0.'new'()
    $P1.'callback'('gc_cb2')
    $P1.'inspect'('allocate')
    $P1.'inspect'('free_pmc_header')
    $P1.'inspect'('free_pmc_attributes')

    $P2 = new ['Instrument']
    $P2.'attach'($P1)

=cut
=end

class Instrument::Event::GC is Instrument::Event {
    has @!probe_list;

    method _self_init() {
        @!probe_list := ();
    };

    method inspect($item) {
        @!probe_list.push($item);
    };

    method _on_attach() {
        self.enable();
    };

    method enable() {
        # Grab the InstrumentGC and EventDispatcher object.
        my $gc := Q:PIR {
            $P0 = getattribute self, '$!instr_obj'
            %r  = $P0['gc']
        };
        my $dispatcher := Q:PIR {
            $P0 = getattribute self, '$!instr_obj'
            %r  = $P0['eventdispatcher']
        };

        # For each item in $!probe_list, insert the gc hook
        #  and register the event handler.
        for @!probe_list {
            my @hooks := $gc.get_hook_list($_);

            for @hooks {
                $gc.insert_hook($_);

                my $tokens := pir::split__PSS('_', $_);
                my $group  := $tokens[0];
                if $group ne 'allocate' && $group ne  'reallocate' && $group ne 'free' {
                    $group := 'administration';
                }

                my $event := 'GC::' ~ $group ~ '::' ~ $_;

                # Register the callback.
                $dispatcher.register($event, $!callback);
            }
        }
    };

    method disable() {
    }
};

# Incomplete.
class Instrument::Event::Class is Instrument::Event {
    has $!class_name;
    has @!vtable_probes;
    has @!method_probes;
    our @todo;
    our $loadlib_event;

    method _self_init() {
        @!vtable_probes := ();
        @!method_probes := ();
    };

    method inspect_class($class) {
        $!class_name := $class;
    };

    method inspect_vtable($item) {
        @!vtable_probes.push($item);
    };

    method inspect_method($item) {
        @!method_probes.push($item);
    };

    method _on_attach() {
        self.enable();
    };

    method enable() {
        my $dispatcher := Q:PIR {
            $P0 = getattribute self, '$!instr_obj'
            %r  = $P0['eventdispatcher']
        };

        my $class        := $!instr_obj.instrument_class($!class_name);
        my $event_prefix := 'Class::' ~ $!class_name ~ '::';

        # Register the vtable probes.
        my $vtable_prefix := $event_prefix ~ 'vtable::';
        for @!vtable_probes {
            $class.insert_hook($_);
            my $group := ($class.get_hook_group($_)).shift();

            my $event :=  $vtable_prefix ~ $group ~ '::' ~ $_;
            $dispatcher.register($event, $!callback);
        }
    };

    method disable() {
    };
};

# vim: ft=perl6 expandtab shiftwidth=4:
