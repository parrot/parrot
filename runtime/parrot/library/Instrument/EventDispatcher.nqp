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
    has %!callbacks;

=begin

=item new ()

Overrides the default constructor provided in P6object.pbc.
Initialises $!identifer and then calls the subclass specific
_self_init method.

=cut

=end

    method new () {
        self := Q:PIR {
            $P0 = self.'HOW'()
            $P1 = getattribute $P0, 'parrotclass'
            %r = new $P1
        };

        self._self_init();

        return self;
    };

=begin

=item _self_init ()

Private method to perform required initialisation.

=cut

=end

    method _self_init () {
        %!callbacks := {};

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
        my @list := get_list(%!callbacks, $event);
        @list.push($callback);
    };

=begin

=item deregister ($event, $callback)

Removes the handler for the given event.

=cut

=end

    method deregister ($event, $callback) {
        my @list := get_list(%!callbacks, $event);

        # Look for $callback in @list.
        my $found := 0;
        my $index := 0;
        for @list {
            if pir::defined__IP($_) && $_ eq $callback {
                pir::delete_p_k(@list, $index);
                $found := 1;
                break;
            }
            $index++;
        }

        # Check that the callback was found and removed.
        if !$found {
            die('Callback for event "' ~ $event ~ '" was not found.');
        }
    };

=begin

=item get_handlers ($event)

Returns a ResizablePMCArray of all the handlers registered for that event.

=cut

=end

    method get_handlers ($event) {
        my @tokens   := pir::split__PSS('::', $event);

        # Get the lists and join them into 1 big list.
        my @key    := ();
        my @list   := ();

        for @tokens {
            @key.push($_);
            @list.append(get_list(%!callbacks, pir::join__SSP('::', @key)));
        }

        return @list;
    }

=begin

=item handler ($event, $callback)

Helper sub that acts as the callback for the EventDispatcher
to dispatch the events to all the appropriate handler(s) registered
with it.

TODO: Update gc and vtable generator scripts before updating this.

=cut

=end

    sub handler ($handler, $task) {
        my %callbacks := pir::getattribute__PPS($handler, '%!callbacks');

        # Get the required subkeys.
        my %data  := pir::getattribute__PPS($task, "data");
        my @event := %data<event>;

        # Get the lists and join them into 1 big list.
        my @list := ();
        my @key;
        for @event {
            @key.push($_);
            @list.append(get_list(%callbacks, pir::join__SSP('::', @key)));
        }

        # Call the callbacks.
        for @list {
            $_(%data);
        }
    };

=begin

=item get_list ($hash, $key)

Returns a ResizablePMCArray object for the given key in
the given hash. If the key does not exists, create an entry
for it.

=cut

=end

    sub get_list (%hash, $key) {
        my @list  := %hash{$key};

        if !pir::defined__IP(@list) {
            @list       := ();
            %hash{$key} := @list;
        }

        return @list;
    };
};

# vim: ft=perl6 expandtab shiftwidth=4:
