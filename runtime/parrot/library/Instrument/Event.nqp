#! nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=begin

=head1 NAME

runtime/parrot/library/Instrument/Event.nqp - Abstract class for the Instruments library

=head1 SYNOPSIS

    Abstract class for the Instruments library.
    Provides the interface generally used by Instrument::Event::*

=cut

=end

class Instrument::Event is Instrument::Base {

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
        self.enable();
    };

=begin
=item enable()

Make the event hooks active.
Does nothing. Overridden in children.

=cut
=end

    method enable () {
    };

=begin
=item disable()

Remove the event hooks.
Does nothing. Overridden in children.

=cut
=end

    method disable () {
    };
};

# vim: ft=perl6 expandtab shiftwidth=4:
