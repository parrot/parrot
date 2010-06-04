#! nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=begin

=head1 NAME
    
runtime/parrot/library/Instrument/Probe.nqp - Helper class to automate inserting and removing hooks from the interpreter.

=head1 SYNOPSIS
    
    ## In PIR.
    
    # Create a probe that will be called whenever the
    #  specified ops are encountered.
    probe = new ['Instrument';'Probe']
    probe.'inspect'('lt')
    probe.'inspect'('gt')
    probe.'set_callback'('specific_callback')
    probe.'set_finalize'('specific_finalize')
    
    # Create a catchall probe which will be called for
    #  each op.
    probe = new ['Instrument';'Probe']
    probe.'make_catchall'()
    probe.'set_callback'('catchall_callback')
    probe.'set_finalize'('catchall_finalize')

=cut

=end

class Instrument::Probe {
    has $!instr_obj;
    has $!identifier;
    has $!is_enabled;
    has $!is_catchall;
    has $!callback;
    has $!finalize;
    has $!oplist;
    our $id_count;

=begin

=item set_callback(sub) or set_callback('sub')

Set the sub callback to be called when the desired op is
encountered. sub can be passed by name or reference through a 
Sub PMC object.

=cut

=end

    method set_callback ($sub) {
        $!callback := get_sub_obj($sub);
    };

=begin

=item set_finalize(sub) or set_finalize('sub')

Set the sub callback to be called at the end of execution.
sub can be passed by name or reference through a Sub PMC object.
Sub will only be called if the probe is enabled at the end of execution.

=cut

=end

    method set_finalize ($sub) {
        $!finalize := get_sub_obj($sub);
    };
    
=begin
=item make_catchall()

Set this probe to catch all ops.

=cut
=end
    
    method make_catchall () {
        $!is_catchall := 1;
    }

=begin
=item inspect(op)

Add op to the list of ops that this probe's callback will be called on.
op can be identified by op number, op short name and op full name.
A list of ops can also be passed, eg. in NQP, $p.inspect(['gt','lt']);

If a non-existant op is found, a warning message is printed out.

TODO: A problem will be dynops. Since we are checking ops before
      the code is even loaded, ops that exists in dynop libs are
      considered non-existent. Create a deferred list that the 
      instrument pmc will run before the first opcode is executed.

=cut
=end

    method inspect ($op) {
        if pir::does__IPS($op, 'array') {
            # $op is a list.
            for $op {
                self.inspect($_);
            }
        } else {
            # $op is singular.
            my $type := pir::typeof__PP($op);
            if !pir::defined__IP($!oplist) {
                $!oplist := Q:PIR { %r = new ['ResizablePMCArray'] };
            }

            if $type eq 'Integer' {
                # $op = op number.
                $!oplist.push($op);
            } else {
                my $oplib := Q:PIR { %r = new ['OpLib'] };
                
                # Lookup the op.
                my $op_ret;
                my $op_num;
                
                $op_ret := $oplib.op_family($op);
                if pir::defined__IP($op_ret) {
                    # $op = short name.
                    for $op_ret {
                        $op_num := pir::set__IP($_);
                        $!oplist.push($op_num);
                    }
                } else {
                    # $op = long name.
                    $op_ret := pir::set_p_p_k__PPP($oplib, $op);
                    $op_num := pir::set__IP($op_ret);
                    $!oplist.push($op_num);
                }
            }
        }
        CATCH { say('Warning: Op ' ~ $op ~ ' does not exist.'); return; }
    };

=begin
=item enable()

Inserts the hooks into the interpreter.
This should only be called after attaching to an Instrument object.
eg,
    instr_obj = new ['Instrument']
    instr_obj.'attach'(probe)
    
Additionally, attach will call this method automatically.

=cut
=end

    method enable () {
        if !pir::defined__IP($!identifier) { $!identifier := get_id(); }
        if !pir::defined__IP($!instr_obj) {
            pir::die('Probe has not been attached to an Instrument object.');
        }
        
        if !$!is_enabled {
            if $!is_catchall {
                # Attach a catchall hook.
                $!instr_obj.insert_op_catchall($!identifier, $!callback);
            } else {
                # Attach a hook to each op in @!oplist.
                for $!oplist {
                    $!instr_obj.insert_op_hook($!identifier, $_, $!callback);
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
        if !pir::defined__IP($!identifier) { $!identifier := get_id(); }
        if !pir::defined__IP($!instr_obj) {
            pir::die('Probe has not been attached to an Instrument object.');
        }
        
        if $!is_enabled {
            if $!is_catchall {
                # Attach a catchall hook.
                $!instr_obj.remove_op_catchall($!identifier, $!callback);
            } else {
                # Attach a hook to each op in @!oplist.
                for $!oplist {
                    $!instr_obj.remove_op_hook($!identifier, $_, $!callback);
                }
            }
            
            $!is_enabled := 0;
        }
    };

    # Helper sub: returns the next available probe id.
    sub get_id () {
        if !$id_count { $id_count := 0; }
        my $id := $id_count++;
        return "Probe-" ~ $id;
    };
    
    # Helper sub: returns the Sub PMC object of a given sub name.
    sub get_sub_obj ($sub) {
        my $type := pir::typeof__PP($sub);
        
        if ($type eq 'String') {
            my $lookup;
            
            # Lookup the sub in the 3 namespaces.
            $lookup := pir::get_global__PS($sub);
            if !pir::defined__IP($lookup) {
                $lookup := pir::get_hll_global__PS($sub);
            }
            if !pir::defined__IP($lookup) {
                $lookup := pir::get_root_global__PS($sub);
            }
            
            if !pir::defined__IP($lookup) {
                pir::die('Could not find sub ' ~ $sub ~ ' in the namespaces.');
            }
            
            $sub := $lookup;
        }
        
        # Ensure that $sub is of type 'Sub'.
        $type := pir::typeof__PP($sub);
        if $type ne 'Sub' {
            pir::die('Type of $sub is not "Sub" but ' ~ $type ~ ' instead.');
        }
        
        return $sub;
    };

};

# vim: ft=perl6 expandtab shiftwidth=4:
