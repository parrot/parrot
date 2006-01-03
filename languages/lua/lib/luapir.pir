# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id: luapir.pir $

=head1 NAME

lib/luapir.pir - Lua PIR Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

.namespace [ "Lua" ]
.HLL "Lua", "lua_group"


=item C<argerror (extramsg)>

=cut

.sub argerror
    .param string extramsg
    error(extramsg)
.end

=item C<checkany (arg)>

=cut

.sub checkany
    .param pmc arg
    $I0 = defined arg
    if $I0, L1
    argerror("value expected")
L1:
.end

=item C<checknumber (arg)>

=cut

.sub checknumber
    .param pmc arg
    .local float val
    val = arg
    # TODO
    .return (val)
.end

=item C<checkstring (arg)>

=cut

.sub checkstring
    .param pmc arg
    .local string val
    val = arg
    # TODO
    .return (val)
.end

=item C<error (message)>

=cut

.sub error
    .param string message
    .local pmc ex
    ex = new .Exception
    ex["_message"] =  message
    throw ex
.end

=item C<not_implemented ()>

=cut

.sub not_implemented
    .local pmc ex
    ex = new .Exception
    ex["_message"] =  "not implemented"
    throw ex
.end

=item C<optint (arg)>

=cut

.sub optint
    .param pmc arg
    .param int default
    if_null arg, L0
    $I0 = isa arg, "LuaNil"
    if $I0, L0
    $I1 = checknumber(arg)
    .return ($I1)
L0:
    .return (default)
.end

=item C<optstring (arg)>

=cut

.sub optstring
    .param pmc arg
    .param string default
    if_null arg, L0
    $I0 = isa arg, "LuaNil"
    if $I0, L0
    $S0 = arg
    .return ($S0)
L0:
    .return (default)
.end

#.sub tostring
#    .param pmc arg
#    .local string str
#    str = get_repr arg
##    str = get_string arg
##    str = arg.get_string()
#    .return (str)
#.end

=back

=head1 AUTHORS

Francois Perrad

=cut

