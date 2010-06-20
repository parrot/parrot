#! nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=begin

=head1 NAME

runtime/parrot/library/Instrument/EventDispatcher.nqp

    Specific eventhandler to handle Instrument related events.

=head1 SYNOPSIS

    Each Instrument instance has an instance of this class,
    which will intercept all events raised and handle those which
    has eventhandlers registered with it.

=cut

=end

class Instrument::EventDispatcher is EventHandler {
    has $!events;

=begin

=item _self_init ()

Private method to perform required initialisation.

=cut

=end

    method _self_init () {
        $!events := Q:PIR { %r = new ['Hash'] };
        
        Q:PIR {
            $P0 = get_global 'handler'
            setattribute self, 'code', $P0
            addhandler self
        };
    };

=begin

=item can_handle ($task)

Overrides the can_handle method of parent EventHandler
and checks if there is a handler(s) registered with it
to handle that task.

=cut

=end

    method can_handle ($task) {
        my $subtype    := pir::getattribute_p_p_s__PPS($task, "subtype");
        my $list       := pir::set_p_p_kc__PPS($!events, $subtype);

        return pir::defined__IP($list);
    };

=begin

=item register ($event, $callback)

Registers the handler for the given event.

=cut

=end

    method register ($event, $callback) {
        my $list := Q:PIR {
            find_lex $P0, '$event'
            $P1 = getattribute self, '$!events'
            %r  = $P1[$P0]
        };

        if !pir::defined__IP($list) {
            $list := Q:PIR { %r = new ['ResizablePMCArray'] };
            pir::set_p_k_p($!events, $event, $list);
        }

        $list.push($callback);
    };

=begin

=item handler ($event, $callback)

Helper sub that acts as the callback for the EventDispatcher
to dispatch the events to all the appropriate handler(s) registered
with it.

=cut

=end

    sub handler ($handler, $task) {
        my $subtype := pir::getattribute_p_p_s__PPS($task, "subtype");
        my $events  := pir::getattribute_p_p_s__PPS($handler, '$!events');
        my $list    := pir::set_p_p_kc__PPS($events, $subtype);
        my $data    := pir::getattribute_p_p_s__PPS($task, "data");

        for $list {
            $_($data);
        }
    };
};

# vim: ft=perl6 expandtab shiftwidth=4:
