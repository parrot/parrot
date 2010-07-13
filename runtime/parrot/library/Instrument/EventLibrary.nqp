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
        if $!is_enabled { return; }

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

                my $group := $gc.get_hook_group($_).shift();
                my $event := 'GC::' ~ $group ~ '::' ~ $_;

                # Register the callback.
                $dispatcher.register($event, $!callback);
            }
        }

        $!is_enabled := 1;
    };

    method disable() {
        if !$!is_enabled { return; }

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
                $gc.remove_hook($_);

                my $group := $gc.get_hook_group($_).shift();
                my $event := 'GC::' ~ $group ~ '::' ~ $_;

                # Register the callback.
                $dispatcher.deregister($event, $!callback);
            }
        }

        $!is_enabled := 0;
    };
};

# Incomplete.
class Instrument::Event::Class is Instrument::Event {
    has @!class_names;
    has @!vtable_probes;
    has @!method_probes;
    our @todo;
    our $loadlib_event;

    method _self_init() {
        @!class_names   := ();
        @!vtable_probes := ();
        @!method_probes := ();
    };

    method inspect_class($class) {
        @!class_names.push($class);
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
        if $!is_enabled { return; }

        my $dispatcher := Q:PIR {
            $P0 = getattribute self, '$!instr_obj'
            %r  = $P0['eventdispatcher']
        };

        for (@!class_names) {
            my $class_name   := $_;
            my $class        := $!instr_obj.instrument_class($class_name);
            my $event_prefix := 'Class::' ~ $class_name ~ '::';

            # Register the vtable probes.
            my $vtable_prefix := $event_prefix ~ 'vtable::';
            for @!vtable_probes {
                my @hooks := $class.get_hook_list($_);

                for @hooks {
                    $class.insert_hook($_);
                    my $group := ($class.get_hook_group($_)).shift();

                    my $event :=  $vtable_prefix ~ $group ~ '::' ~ $_;
                    $dispatcher.register($event, $!callback);
                }
            }

            CATCH {
                # Something was not found.
                # Push to todo list.
                say("OH NOES! Class not found.");
            }
        }

        $!is_enabled := 1;
    };

    method disable() {
    };
};

# vim: ft=perl6 expandtab shiftwidth=4:
