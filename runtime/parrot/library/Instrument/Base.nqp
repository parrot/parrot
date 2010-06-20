#! nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=begin

=head1 NAME
    
runtime/parrot/library/Instrument/Base.nqp - Abstract class for the Instruments library

=head1 SYNOPSIS
    
    Abstract class for the Instruments library.

=cut

=end

class Instrument::Base {
    has $!instr_obj;
    has $!identifier;
    has $!is_enabled;
    has $!callback;
    has $!finalize;
    has $!data;
    our $id_count;

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
        
        if !pir::defined__IP($id_count) {
            $id_count := 0;
        }
        
        my $id := $id_count++;
        $!identifier := "Instrument-" ~ $id;
        
        self._self_init();
        
        return self;
    };

=begin

=item _self_init ()

Private method to perform additional initialisation.
Stub method for abstract base class.

=cut

=end

    method _self_init () {
        die("Abstract class Instrument::Base cannot be instantiated.");
    };

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

=item set_data(data)

Sets the data attribute.

=cut

=end   

    method set_data ($data) {
        $!data := $data;
    };

=begin
=item _on_attach()

Private method that is called on attaching to the Instrument dynpmc.
Stub method. To be implemented by child classes.

=cut
=end

    method _on_attach () {
        die("Method _on_attach is unimplemented for abstract class Instrument::Base.");
    };

=begin
=item enable()

Stub method. To be implemented by child classes.

=cut
=end

    method enable () {
        die("Method enable is unimplemented for abstract class Instrument::Base.");
    };

=begin
=item disable()

Stub method. To be implemented by child classes.

=cut
=end

    method disable () {
        die("Method disable is unimplemented for abstract class Instrument::Base.");
    };

    # Helper sub: returns the Sub PMC object of a given sub name.
    sub get_sub_obj ($sub) {
        if !pir::defined__IP($sub) {
            die('$sub is not defined.');
        }

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
            die('Type of $sub is not "Sub" but ' ~ $type ~ ' instead.');
        }

        return $sub;
    };
};

# vim: ft=perl6 expandtab shiftwidth=4:
