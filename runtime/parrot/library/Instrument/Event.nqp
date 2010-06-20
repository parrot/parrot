#! nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=begin

=head1 NAME
    
runtime/parrot/library/Instrument/Event.nqp - Abstract class for the Instruments library

=head1 SYNOPSIS
    
    Abstract class for the Instruments library.
    Provides event specific methods.

=cut

=end

class Instrument::Event is Instrument::Base {
    has $!initialiser;
    has $!event_type;
    has $!probe_obj;

=begin

=item _self_init ()

Private method to perform additional initialisation.
Stub method for abstract base Instrument::Event class.

=cut

=end

    method _self_init () {
        die("Abstract class Instrument::Event cannot be instantiated.");
    };

=begin

=item inspect ($item)

Stub method for abstract base Instrument::Event class.

=cut

=end

    method inspect ($item) {
        die("Method inspect is unimplemented for abstract class Instrument::Event.");
    };

=begin
=item _on_attach()

Private method that is called on attaching to the Instrument dynpmc.
Registers callbacks with the EventDispatcher Object in the Instrument dynpmc.

=cut
=end

    method _on_attach () {
        if pir::defined__IP($!probe_obj) {
            $!instr_obj.attach($!probe_obj);
        }

        my $dispatcher := Q:PIR {
            $P0 = getattribute self, '$!instr_obj'
            %r  = $P0['eventdispatcher']
        };

        if pir::defined__IP($!callback) {
            $dispatcher.register($!event_type, $!callback);
        }
    };

=begin
=item enable()

Make the event hooks active.

=cut
=end

    method enable () {
        $!probe_obj.enable();
    };

=begin
=item disable()

Remove the event hooks.

=cut
=end

    method disable () {
        $!probe_obj.disable();
    };
    
=begin
=item _raise_event($event, $data)

Helper sub that creates a Task instance and schedules it.

=cut
=end

    sub _raise_event ($evt, $data) {
        my $hash := Q:PIR { %r = new ['Hash'] };
        pir::set_p_k_p($hash, 'type',    'event');
        pir::set_p_k_p($hash, 'subtype', $evt);
        pir::set_p_k_p($hash, 'data',    $data);

        my $task := pir::new_p_s_p__PSP('Task', $hash);

        pir::schedule($task);
    }
};

# vim: ft=perl6 expandtab shiftwidth=4:
