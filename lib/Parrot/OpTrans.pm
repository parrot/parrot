# Copyright: 2002 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::OpTrans - Transform Ops to C Code 

=head1 DESCRIPTION

C<Parrot::OpTrans> is the abstract superclass for the Parrot op to C
transforms. Each transform contains various bits of information needed
to generate the C code, and creates a different type of run loop. The
methods defined here supply various default values and behaviour common
to all transforms.

The subclass hierarchy is as follows:

    OpTrans
       |_________________________
       |           |             |
       C         CGoto       Compiled
       |           |
    CPrederef      |
       | |         |
       | |_________|
       |           |
    CSwitch       CGP

=head2 Class Methods

=over 4

=cut

use strict;
#use warnings;

package Parrot::OpTrans;

=item C<new()>

Returns a new instance.

=cut

sub new
{ 
    return bless { }, shift; 
}

=back

=head2 Instance Methods

=over 4

=item C<prefix()>

Returns the default 'C<Parrot_>' prefix.

Used by C<Parrot::Op>'s C<func_name()> to individuate op function names.

=cut

sub prefix 
{ 
    return 'Parrot_'; 
}

=item C<suffix()>

Implemented in subclasses to return a suffix with which to individuate
variable names. This default implementation returns an empty string.

=cut

sub suffix 
{ 
    return ''; 
}

=item C<defines()>

Implemented in subclasses to return the C C<#define> macros required.

=item C<opsarraytype()>

Returns the type for the array of opcodes. By default here it's an array
C<opcode_t>, but the prederef runops core uses an array of C<void*> to
do its clever tricks.

=cut

sub opsarraytype 
{ 
    return 'opcode_t' 
};

=item C<core_type()>

Implemented in subclasses to return the type of core created by the
transform. This default implementation raises an exception indicating
that the core type is missing. See the C<Parrot_Run_core_t> C<enum> in
F<include/parrot/interpreter.h> for a list of the core types.

=cut

sub core_type 
{
    my $self = shift;
    
    die ref($self) . " doesn't have core_type()";
}

=item C<core_prefix()>

Implemented in subclasses to return a short prefix indicating the core
type used to individuate core function names.

=item C<run_core_func_decl($base)>

Optionally implemented in subclasses to return the C code for the run
core function declaration. C<$base> is the name of the main ops file minus
the .ops extension.

=item C<ops_addr_decl($base_suffix)>

Optionally implemented in subclasses to return the C code for the ops
address declaration. C<$base_suffix> is the name of the main ops file minus
the .ops extension with C<suffix()> and an underscore appended.

=item C<run_core_func_decl($base)>

Optionally implemented in subclasses to return the C code for the run
core function declaration. C<$base> is the same as for
C<run_core_func_decl()>.

=item C<run_core_func_start()>

Implemented in subclasses, if C<run_core_func_decl()> is implemented, to
return the C code prior to the run core function.

=item C<run_core_after_addr_table($base_suffix)>

Optionally implemented in subclasses to return the run core C code for
section after the address table. C<$base_suffix> is the same as for 
C<ops_addr_decl()>.

=item C<run_core_finish($base)>

Implemented in subclasses to return the C code following the run core
function. C<$base> is the same as for C<run_core_func_decl()>.

=item C<init_func_init1($base)>

Optionally implemented in subclasses to return the C code for the core's
init function. C<$base> is the same as for C<run_core_func_decl()>.

=item C<init_set_dispatch($base_suffix)>

Optionally implemented in subclasses to return the C code for
initializing the dispatch mechanism within the core's init function.
C<$base_suffix> is the same as for C<ops_addr_decl()>.

=back

B<Macro Substitutions>

The following methods are called by C<Parrot::OpFile> to perform ops
file macro substitutions.

=over

=item C<access_arg($type, $value, $op)>

Implemented in subclasses to return the C code for the specified op
argument type and value. C<$op> is an instance of C<Parrot::Op>.

=item C<gen_goto($where)>

The various C<goto_I<X>> methods below call this method with the return
value of an C<expr_I<X>> method (implemented in subclass).

=cut

sub gen_goto 
{
    my ($self, $where_str) = @_;

    return "return $where_str";
}

=item C<restart_address($address)>

Implemented in subclasses to return the C code for C<restart
ADDRESS($address)>.

=item C<restart_offset($offset)>

Implemented in subclasses to return the C code for C<restart
OFFSET($offset)>.

=item C<goto_address($address)>

Transforms the C<goto ADDRESS($address)> macro in an ops file into the
relevant C code.

=cut

sub goto_address 
{
    my $self = shift;

    return $self->gen_goto($self->expr_address(@_));
}

=item C<goto_offset($offset)>

Transforms the C<goto OFFSET($offset)> macro in an ops file into the
relevant C code.

=cut

sub goto_offset 
{
    my $self = shift;

    return $self->gen_goto($self->expr_offset(@_));
}

=item C<goto_pop()>

Transforms the C<goto POP($address)> macro in an ops file into the
relevant C code.

=cut

sub goto_pop 
{
    my ($self) = @_;

    return $self->gen_goto($self->expr_pop(@_));
}

=item C<expr_offset($offset)>

Implemented in subclasses to return the C code for C<OFFSET($offset)>.
Called by C<goto_offset()>.

=item C<expr_address($address)>

Implemented in subclasses to return the C code for C<ADDRESS($address)>.
Called by C<goto_address()>.

=back

=head1 SEE ALSO

=over 4

=item C<Parrot::OpTrans::C>

=item C<Parrot::OpTrans::CGP>

=item C<Parrot::OpTrans::CGoto>

=item C<Parrot::OpTrans::CPrederef>

=item C<Parrot::OpTrans::CSwitch>

=item C<Parrot::OpTrans::Compiled>

=back

=cut

1;

