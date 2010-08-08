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
    $P0 = get_hll_global ['Instrument';'Event';'Internal'], 'loadlib'
    evt = $P0.'new'()
    evt.inspect('lib_name')
    evt.'callback'('loadlib_callback')

    instr = new ['Instrument']
    instr.attach(evt)

=cut

=end


=begin
=item Instrument::Event::Internal::loadlib

Raises an event whenever a dynlib is loaded.
Events are raised in the C code.

When at least one library name is passed to inspect,
this will only fire the callback when any of those libraries
are loaded.

If inspect is not called, it will call the callback for all
libraries loaded.

    Example usage:

    # Create an event handler to receive loadlib notifications.
    $P0 = get_hll_global ['Instrument';'Event';'Internal'], 'loadlib'
    evt = $P0.'new'()
    evt.inspect('lib_name')
    evt.'callback'('loadlib_callback')

    instr = new ['Instrument']
    instr.attach(evt)

=cut
=end

class Instrument::Event::Internal::loadlib is Instrument::Event {
    has @!libraries;

=begin
=item _self_init()

Internal usage. Performs initialisation.

=cut
=end

    method _self_init() {
        @!libraries  := ();
    };

=begin
=item inspect($library)

Adds $library to the list of libraries to look for
whenever a library is loaded.

Defaults to all when inspect is never called.

=cut
=end

    method inspect($library) {
        @!libraries.push($library);
    };

=begin
=item enable()

Inserts the hooks into the appropriate places.

=cut
=end

    method enable() {
        if !+$!is_enabled {
            if +@!libraries {
                for @!libraries {
                    my $event := 'Internal::loadlib::' ~ $_;
                    $!instr_obj.register_eventhandler($event, self);
                }
            }
            else {
                $!instr_obj.register_eventhandler('Internal::loadlib', self);
            }
        }
        $!is_enabled := 1;
    };

=begin
=item disable()

Removes the hooks inserted in enable.

=cut
=end

    method disable() {
        if +$!is_enabled {
            if +@!libraries {
                for @!libraries {
                    my $event := 'Internal::loadlib::' ~ $_;
                    $!instr_obj.remove_eventhandler($event, self);
                }
            }
            else {
                $!instr_obj.remove_eventhandler('Internal::loadlib', self);
            }
        }
        $!is_enabled := 0;
    };
};

=begin
=item Instrument::Event::GC

Interface to register callbacks for any given GC event.

Usage (in PIR):

    # Inspect a group (allocate) and two separate free events.
    $P0 = new ['Instrument']
    $P1 = $P0.'instrument_gc'()
    $P1.'callback'('gc_cb2')
    $P1.'inspect'('allocate')
    $P1.'inspect'('free_pmc_header')
    $P1.'inspect'('free_pmc_attributes')
    $P0.'attach'($P1)

=cut
=end

class Instrument::Event::GC is Instrument::Event {
    has @!probe_list;

=begin
=item _self_init()

Internal usage. Performs initialisation.

=cut
=end

    method _self_init() {
        @!probe_list := ();
    };

=begin
=item inspect($item)

Adds items to the list of hooks to insert when enabled.
$item can be one of the following:
1. Groups:
    a. allocate
    b. reallocate
    c. free
    d. administration
2. Specific functions:
    Please refer to src/gc/gc_private.h to get the full list.
    In that list, 3 functions aren't available for instrumentation.
    The functions are: is_blocked_mark, is_blocked_sweep, get_gc_info

=cut
=end

    method inspect($item) {
        @!probe_list.push($item);
    };

=begin
=item enable()

Inserts the hooks into the appropriate places.

=cut
=end

    method enable() {
        if $!is_enabled { return; }

        # For each item in $!probe_list, insert the gc hook
        #  and register the event handler.
        for @!probe_list {
            my @hooks := $!hook_obj.get_hook_list($_);

            for @hooks {
                $!hook_obj.insert_hook($_);

                my $group := $!hook_obj.get_hook_group($_);
                my $event := 'GC::' ~ $group ~ '::' ~ $_;

                # Register the callback.
                $!instr_obj.register_eventhandler($event, self);
            }
        }

        $!is_enabled := 1;
    };

=begin
=item disable()

Removes the hooks inserted in enable.

=cut
=end

    method disable() {
        if !$!is_enabled { return; }

        # For each item in $!probe_list, insert the gc hook
        #  and register the event handler.
        for @!probe_list {
            my @hooks := $!hook_obj.get_hook_list($_);

            for @hooks {
                $!hook_obj.remove_hook($_);

                my $group := $!hook_obj.get_hook_group($_);
                my $event := 'GC::' ~ $group ~ '::' ~ $_;

                # Remove the callback.
                $!instr_obj.remove_eventhandler($event, self);
            }
        }

        $!is_enabled := 0;
    };
};

=begin
=item Instrument::Event::Class

Interface to register hooks into a class' vtable or methods.

Usage (in PIR):

    $P0 = new ['Instrument']
    $P1 = $P0.'instrument_class'('class_name')
    $P1.'callback'('class_cb')
    $P1.'inspect_vtable'('vtable_name')
    $P1.'inspect_method'('method_name')
    $P0.'attach'($P1)

=cut
=end

class Instrument::Event::Class is Instrument::Event {
    has @!vtable_probes;
    has @!method_probes;

=begin
=item _self_init()

Internal usage. Performs initialisation.

=cut
=end

    method _self_init() {
        @!vtable_probes := ();
        @!method_probes := ();
    };

=begin
=item inspect_vtable($item)

Adds $item to the list of vtable entries to hook
into when enabled.

=cut
=end

    method inspect_vtable($item) {
        @!vtable_probes.push($item);
    };

=begin
=item inspect_method($item)

Adds $item to the list of methods to instrument
into when enabled.

=cut
=end

    method inspect_method($item) {
        @!method_probes.push($item);
    };

=begin
=item refresh()

Used internally to refresh the probe, allowing
it to insert hooks into places that weren't available
previously, eg, a class that is newly loaded.

=cut
=end

    method refresh() {
        $!hook_obj._instrument_vtable();
        CATCH {}
        if +$!is_enabled {
            self.disable();
            self.enable();
        }
    }

=begin
=item enable()

Inserts the hooks into the appropriate places.

=cut
=end

    method enable() {
        if !+$!is_enabled {
            my $class_name   := $!hook_obj.get_classname();
            my $event_prefix := 'Class::' ~ $class_name ~ '::';

            # Register the vtable probes.
            my $vtable_prefix := $event_prefix ~ 'vtable::';
            for @!vtable_probes {
                my @hooks := $!hook_obj.get_hook_list($_);
                for @hooks {
                    $!hook_obj.insert_hook($_);
                    my $group := $!hook_obj.get_hook_group($_);
                    my $event :=  $vtable_prefix ~ $group ~ '::' ~ $_;
                    $!instr_obj.register_eventhandler($event, self);

                    CATCH {}
                }

                CATCH {}
            }

            # Register the method probes.
            my $method_prefix := $event_prefix ~ 'method::';
            for @!method_probes {
                $!hook_obj.insert_method_hook($_);

                my $event := $method_prefix ~ $_;
                $!instr_obj.register_eventhandler($event, self);

                CATCH {}
            }
        }
        $!is_enabled := 1;
    };

=begin
=item disable()

Removes the hooks inserted in enable.

=cut
=end

    method disable() {
        if +$!is_enabled {
            my $class_name   := $!hook_obj.get_classname();
            my $event_prefix := 'Class::' ~ $class_name ~ '::';

            # Deregister the vtable probes.
            my $vtable_prefix := $event_prefix ~ 'vtable::';
            for @!vtable_probes {
                my @hooks := $!hook_obj.get_hook_list($_);

                for @hooks {
                    $!hook_obj.remove_hook($_);
                    my $group := $!hook_obj.get_hook_group($_);

                    my $event :=  $vtable_prefix ~ $group ~ '::' ~ $_;
                    $!instr_obj.remove_eventhandler($event, self);

                    CATCH {}
                }

                CATCH {}
            }

            # Deregister the method probes.
            my $method_prefix := $event_prefix ~ 'method::';
            for @!method_probes {
                $!hook_obj.remove_method_hook($_);

                my $event := $method_prefix ~ $_;
                $!instr_obj.remove_eventhandler($event, self);

                CATCH {}
            }
        }
        $!is_enabled := 0;
    };
};

=begin
=item Instrument::Event::Object

Interface to register hooks into an object's vtable or methods.

Usage (in PIR):

    $P0 = new ['Instrument']
    $P1 = $P0.'instrument_object'($P100)  # $P100 is an object in the child interp.
    $P1.'callback'('object_cb')
    $P1.'inspect_vtable'('vtable_name')
    $P1.'inspect_method'('method_name')
    $P0.'attach'($P1)

=cut
=end

class Instrument::Event::Object is Instrument::Event::Class {

=begin
=item _self_init()

Internal usage. Performs initialisation.

=cut
=end

    method _self_init() {
        @!vtable_probes := ();
        @!method_probes := ();
    };

=begin
=item enable()

Inserts the hooks into the appropriate places.

=cut
=end

    method enable () {
        if !+$!is_enabled {
            my $event_prefix := 'Object::' ~ $!hook_obj.get_address() ~ '::';

            # Register the vtable probes.
            my $vtable_prefix := $event_prefix ~ 'vtable::';
            for @!vtable_probes {
                my @hooks := $!hook_obj.get_hook_list($_);

                for @hooks {
                    $!hook_obj.insert_hook($_);
                    my $group := $!hook_obj.get_hook_group($_);

                    my $event :=  $vtable_prefix ~ $group ~ '::' ~ $_;
                    $!instr_obj.register_eventhandler($event, self);

                    CATCH {}
                }
                CATCH {}
            }

            # Register the method probes.
            my $method_prefix := $event_prefix ~ 'method::';
            for @!method_probes {
                $!hook_obj.insert_method_hook($_);

                my $event := $method_prefix ~ $_;
                $!instr_obj.register_eventhandler($event, self);

                CATCH {}
            }
        }
        $!is_enabled := 1;
    }

=begin
=item disable()

Removes the hooks inserted in enable.

=cut
=end

    method disable () {
        if +$!is_enabled {
            my $event_prefix := 'Object::' ~ $!hook_obj.get_address() ~ '::';

            # Register the vtable probes.
            my $vtable_prefix := $event_prefix ~ 'vtable::';
            for @!vtable_probes {
                my @hooks := $!hook_obj.get_hook_list($_);

                for @hooks {
                    $!hook_obj.remove_hook($_);
                    my $group := $!hook_obj.get_hook_group($_);

                    my $event :=  $vtable_prefix ~ $group ~ '::' ~ $_;
                    $!instr_obj.remove_eventhandler($event, self);

                    CATCH {}
                }
                CATCH {}
            }

            # Register the method probes.
            my $method_prefix := $event_prefix ~ 'method::';
            for @!method_probes {
                $!hook_obj.remove_method_hook($_);

                my $event := $method_prefix ~ $_;
                $!instr_obj.remove_eventhandler($event, self);

                CATCH {}
            }
        }
        $!is_enabled := 0;
    }

=begin
=item STRING get_address()

Returns the address of the object.

=cut
=end

    method get_address() {
        return $!hook_obj.get_address();
    }
}

=begin
=item Instrument::Event::ObjectDestroy

A class used internally to notify the instrumenter when the object
has been destroyed so that internal cleanups can take place.

For internal use only.

=cut
=end

class Instrument::Event::ObjectDestroy is Instrument::Event::Object {

=begin
=item _self_attach()

Called internally to set up and attach this probe to
the instrument instance.

=cut
=end

    method _self_attach() {
        self.inspect_vtable('destroy');
        self.callback(pir::get_global__PS('destroy_pre'));
        $!instr_obj.attach(self);
    }

=begin
=item destroy_pre($data, $instr, $probe)

Called internally when the object is being destroyed.
Simply returns another invokable so that the cleanup happens
after the object has been destroyed.

=cut
=end

    sub destroy_pre($data, $instr, $probe) {
        return pir::get_global__PS('destroy_post');
    }

=begin
=item destroy_post($data, $instr, $probe)

Returned by destroy_pre. Simply calls the detach_from_object
method of the InstrumentObject instance to perform cleanup.

=cut
=end

    sub destroy_post($data, $instr, $probe) {
        Q:PIR {
            find_lex $P0, '$probe'
            $P1 = getattribute $P0, '$!hook_obj'
            $P1.'detach_from_object'()
        };
    }
}

# vim: ft=perl6 expandtab shiftwidth=4:
