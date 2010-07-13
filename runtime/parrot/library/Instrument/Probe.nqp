#! nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=begin

=head1 NAME

runtime/parrot/library/Instrument/Probe.nqp - Helper class to automate inserting and removing hooks from the interpreter.

=head1 SYNOPSIS

    ## In PIR.
    .local pmc probe_class
    probe_class = get_hll_global ['Instrument'], 'Probe'

    # Create a probe that will be called whenever the
    #  specified ops are encountered.
    probe = probe_class.'new'()
    probe.'inspect'('lt')
    probe.'inspect'('gt')
    probe.'set_callback'('specific_callback')
    probe.'set_finalize'('specific_finalize')

    # Create a catchall probe which will be called for
    #  each op.
    probe = probe_class.'new'()
    probe.'make_catchall'()
    probe.'set_callback'('catchall_callback')
    probe.'set_finalize'('catchall_finalize')

=cut

=end

class Instrument::Probe is Instrument::Base {
    has $!is_catchall;
    has @!oplist;
    has @!op_todo_list;
    our $loadlib_evt;
    our @loadlib_probelist := ();

=begin

=item _self_init ()

Private method to perform additional initialisation.

=cut

=end

    method _self_init () {
        @!op_todo_list := ();
        @!oplist      := ();
        $!is_catchall := 0;
    };

=begin
=item catchall($catchall?)

Set this probe to catch all ops if $catchall is not zero.
Returns the current catchall status.

=cut
=end

    method catchall ($catchall?) {
        $!is_catchall := $catchall // $!iscatchall;
    }

=begin
=item inspect(op)

Add op to the list of ops that this probe's callback will be called on.
op can be identified by op number, op short name and op full name.
A list of ops can also be passed, eg. in NQP, $p.inspect(['gt','lt']);

If a non-existant op is found, it is placed on a todo list which is reevaluated
everytime a dynlib is loaded.

=cut
=end

    method inspect ($op) {
        if pir::does__IPS($op, 'array') {
            # $op is a list.
            for $op {
                self.inspect($_);
            }
        }
        else {
            # $op is singular.
            my %oplib := pir::new__PS('OpLib');

            if pir::does__IPS($op, 'integer') {
                # $op = op number.
                if $op > +%oplib {
                    # op number is invalid.
                    # Put it in the todo list.
                    @!op_todo_list.push($op);
                }
                else {
                    @!oplist.push($op);
                }
            }
            else {
                # Lookup the op.
                my @op_ret := %oplib.op_family($op);
                if pir::defined__IP(@op_ret) {
                    # $op = short name.
                    for @op_ret {
                        @!oplist.push(pir::set__IP($_));
                    }
                }
                else {
                    # $op = long name.
                    @!oplist.push(pir::set__IP(%oplib{$op}));
                }
            }
        }
        CATCH {
            # Push to op_todo_list
            @!op_todo_list.push($op);
        }
    };

    method _on_attach() {
        self.enable();
    };

=begin
=item enable()

Inserts the hooks into the interpreter.
This should only be called after attaching to an Instrument object.
eg,
    instr_obj = new ['Instrument']
    instr_obj.'attach'(probe)

=cut
=end

    method enable () {
        if !pir::defined__IP($!instr_obj) {
            pir::die('Probe has not been attached to an Instrument object.');
        }

        # Check for any op_todo_list.
        if pir::set__IP(@!op_todo_list) != 0 {
            # Double check the op_todo_list.
            my @list      := @!op_todo_list;
            @!op_todo_list := ();
            for @list {
                self.inspect($_);
            }

            # If there is still a op_todo_list,
            #  set up an event handler to update.
            if +@!op_todo_list != 0 {
                @Instrument::Probe::loadlib_probelist.push(self);

                if !pir::defined__IP($Instrument::Probe::loadlib_evt) {
                    my $callback := pir::get_global__PS('loadlib_callback');
                    $Instrument::Probe::loadlib_evt := Instrument::Event::Internal::loadlib.new();
                    $Instrument::Probe::loadlib_evt.callback($callback);
                    $Instrument::Probe::loadlib_evt.data(self);
                    $!instr_obj.attach($Instrument::Probe::loadlib_evt);
                }
            }
        }

        if !$!is_enabled {
            if $!is_catchall {
                # Attach a catchall hook.
                $!instr_obj.insert_op_catchall(self);
            } else {
                # Attach a hook to each op in @!oplist.
                for @!oplist {
                    $!instr_obj.insert_op_hook(self, $_);
                }
            }

            $!is_enabled := 1;
        }
    };

=begin
=item disable()

Remove the hooks from the interpreter.
This should only be called after attaching to an Instrument object.
eg,
    instr_obj = new ['Instrument']
    instr_obj.'attach'(probe)

You can dynamically attach and remove hooks dynamically.

=cut
=end

    method disable () {
        if !pir::defined__IP($!instr_obj) {
            pir::die('Probe has not been attached to an Instrument object.');
        }

        if $!is_enabled {
            if $!is_catchall {
                # Attach a catchall hook.
                $!instr_obj.remove_op_catchall(self);
            } else {
                # Attach a hook to each op in @!oplist.
                for @!oplist {
                    $!instr_obj.remove_op_hook(self, $_);
                }
            }

            $!is_enabled := 0;
        }
    };

=begin
=item get_op_list()

Returns the list of op numbers inspected by this probe.

=cut
=end

    method get_op_list () {
        @!oplist;
    }

=begin
=item get_op_todo_list()

Returns the list of items passed to inspect

=cut
=end

    method get_op_todo_list () {
        @!op_todo_list;
    }

    # Internal helper: Callback for loadlib events registered when the probe has
    #                  any outstanding ops in @!op_todo_list.
    sub loadlib_callback ($data) {
        # Simply disable and reenable the probe.
        my @list                              := @Instrument::Probe::loadlib_probelist;
        @Instrument::Probe::loadlib_probelist := ();
        for @list {
            $_.disable();
            $_.enable();
        }
    }
};

# vim: ft=perl6 expandtab shiftwidth=4:
