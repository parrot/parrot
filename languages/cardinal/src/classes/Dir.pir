# Copyright (C) 2001-2008, The Perl Foundation.
# $Id$

=head1 TITLE

Dir - Cardinal Dir class

=head1 DESCRIPTION

=head2 Functions

=over

=item onload()

Perform initializations and create the Dir class

=cut

.namespace ['Dir']

.sub 'onload' :anon :init :load
    .local pmc cardinalmeta
    $P0 = get_hll_global ['CardinalObject'], '!CARDINALMETA'
    cardinalmeta = $P0.'new_class'('Dir', 'parent'=>'CardinalObject', 'attr'=>'!umask')
.end

#.sub 'new' :method
# .param string dir
# print "Dir.new"
# print " param="
# say dir
 #opendir dir
#.end

.sub 'get_bool' :vtable
        .return(1)
.end

#.sub 'get_string_keyed' :vtable
#        .return ('Dir')
#.end

.sub 'get_string' :vtable
   $S0 = 'Dir'
   .return ($S0)
.end

.sub 'chdir' :method
        .param string new_dir
        .param pmc block :named('!BLOCK') :optional
        .param int has_block :opt_flag
        .local pmc os
        .local string old_dir

        if has_block goto with_block
        goto no_block

        with_block:
            os = new 'OS'
            old_dir = os.'cwd'()
            os.'chdir'(new_dir)
            $P0 = block()
            os.'chdir'(old_dir)
            goto done
       no_block:
            $P0 = new 'CardinalInteger'
            $P0 = 0
            os = new 'OS'
            os.'chdir'(new_dir)
            goto done

       done:
            .return ($P0)
.end

.sub 'pwd' :method
        .local pmc os
        .local pmc pwd
        pwd = new 'CardinalString'
        os = new 'OS'
        pwd = os.'cwd'()
        .return (pwd)
.end

.sub 'getwd' :method
        .tailcall self.'pwd'()
.end

.sub 'chroot' :method
        .local pmc os
        .local pmc status
        status = new 'CardinalInteger'
        os = new 'OS'
        status = os.'cwd'()
        .return (status)
.end

.sub 'mkdir' :method
        .param string path
        .param string mode :optional
        .param int mode_flag :opt_flag
        .local pmc os

        os = new 'OS'
        if mode_flag goto make
        goto no_mode

        no_mode:
            mode = ''
            goto make
        make:
            os.'mkdir'(path, mode)
.end

.sub 'unlink' :method
        .tailcall self.'rmdir'()
.end

.sub 'delete' :method
        .tailcall self.'rmdir'()
.end

.sub 'rmdir' :method
        .param string path
        .local pmc os
        os = new 'OS'
        os.'rm'(path)
        $P0 = new 'CardinalInteger'
        $P0 = 0
        .return ($P0)
.end

.sub 'entries' :method
        .param string path
        .local pmc os
        .local pmc list
        os = new 'OS'
        list = new 'CardinalArray'
        $P0 =  os.'readdir'(path)
        $P1 = new 'Iterator', $P0
        loop:
            unless $P1 goto loop_end
            $P2 = shift $P1
            list.'push'($P2)
            goto loop
        loop_end:

        .return (list)
.end

.sub 'foreach' :method
        .param string path
        .param pmc block :named('!BLOCK')
        .local pmc names
        names = self.'entries'(path)
        $P0 = new 'Iterator', names
        loop:
            unless $P0 goto loop_end
            $P1 = shift $P0
            block($P1)
            goto loop
        loop_end:

        $P2 = new 'NilClass'
        .return ($P2)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
