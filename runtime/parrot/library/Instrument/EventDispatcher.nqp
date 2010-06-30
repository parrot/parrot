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
    has $!evt_category;
    has $!evt_subtype;
    has $!evt_fulltype;

=begin

=item _self_init ()

Private method to perform required initialisation.

=cut

=end

    method _self_init () {
        $!evt_category := Q:PIR { %r = new ['Hash'] };
        $!evt_subtype  := Q:PIR { %r = new ['Hash'] };
        $!evt_fulltype := Q:PIR { %r = new ['Hash'] };

        Q:PIR {
            $P0 = get_global 'handler'
            setattribute self, 'code', $P0
            addhandler self
        };
    };

=begin

=item can_handle ($task)

Overrides the can_handle method of parent EventHandler
and handle only tasks with subtype 'Instrument'.

=cut

=end

    method can_handle ($task) {
        my $subtype    := pir::getattribute__PPS($task, "subtype");
        return $subtype eq 'Instrument';
    };

=begin

=item register ($event, $callback)

Registers the handler for the given event.

=cut

=end

    method register ($event, $callback) {
        my $tokens   := pir::split__PSS('::', $event);
        my $count    := pir::set__IP($tokens);
        if $count > 3 || $count < 1 {
            die('Invalid Instrument event: ' ~ $event ~ "\n"
              ~ 'Expected between 1 to 3 tokens when split with \'::\'.');
        }

        my $list;

        if    $count == 3 {
            # Assume callback is for an exact event.
            $list  := get_list($!evt_fulltype, $event);
        }
        elsif $count == 2 {
            # Assume callback is for a subtype event.
            $list  := get_list($!evt_subtype, $event);
        }
        elsif $count == 1 {
            # Assume callback is for a category event.
            $list  := get_list($!evt_category, $event);
        }

        $list.push($callback);
    };

=begin

=item deregister ($event, $callback)

Removes the handler for the given event.

=cut

=end

    method deregister ($event, $callback) {
        my $tokens   := pir::split__PSS('::', $event);
        my $count    := pir::set__IP($tokens);
        if $count > 3 || $count < 1 {
            die('Invalid Instrument event: ' ~ $event ~ "\n"
              ~ 'Expected between 1 to 3 tokens when split with \'::\'.');
        }

        my $list;

        if    $count == 3 {
            # Assume callback is for an exact event.
            $list  := get_list($!evt_fulltype, $event);
        }
        elsif $count == 2 {
            # Assume callback is for a subtype event.
            $list  := get_list($!evt_subtype, $event);
        }
        elsif $count == 1 {
            # Assume callback is for a category event.
            $list  := get_list($!evt_category, $event);
        }

        # Look for $callback in $list.
        my $index := 0;
        for $list {
            if $_ eq $callback {
                pir::delete_p_k($list, $index);
                break;
            }
            $index++;
        }
    };

=begin

=item handler ($event, $callback)

Helper sub that acts as the callback for the EventDispatcher
to dispatch the events to all the appropriate handler(s) registered
with it.

=cut

=end

    sub handler ($handler, $task) {
        my $evt_category := pir::getattribute__PPS($handler, '$!evt_category');
        my $evt_subtype  := pir::getattribute__PPS($handler, '$!evt_subtype');
        my $evt_fulltype := pir::getattribute__PPS($handler, '$!evt_fulltype');

        # Get the required subkeys.
        my $data    := pir::getattribute__PPS($task, "data");
        my $category := pir::set_p_p_kc__PPS($data, 'event_category');
        my $subtype  := pir::set_p_p_kc__PPS($data, 'event_subtype');
        my $fulltype := pir::set_p_p_kc__PPS($data, 'event_fulltype');

        # Get the lists and join them into 1 big list.
        my $key  := [$category];
        my $list := Q:PIR { %r = new ['ResizablePMCArray'] };
        $list.append(get_list($evt_category, $category));
        $key.push($subtype);
        $list.append(get_list($evt_subtype, pir::join__SSP('::', $key)));
        $key.push($fulltype);
        $list.append(get_list($evt_fulltype, pir::join__SSP('::', $key)));

        # Call the callbacks.
        for $list {
            $_($data);
        }
    };

=begin

=item get_list ($hash, $key)

Returns a ResizablePMCArray object for the given key in
the given hash. If the key does not exists, create an entry
for it.

=cut

=end

    sub get_list ($hash, $key) {
        my $list  := Q:PIR {
            find_lex $P0, '$hash'
            find_lex $P1, '$key'
            %r  = $P0[$P1]
        };

        if !pir::defined__IP($list) {
            $list := Q:PIR { %r = new ['ResizablePMCArray'] };
            pir::set_p_k_p($hash, $key, $list);
        }

        return $list;
    };
};

# vim: ft=perl6 expandtab shiftwidth=4:
