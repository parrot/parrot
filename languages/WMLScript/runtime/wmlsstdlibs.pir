# Copyright (C) 2006, The Perl Foundation.
# $Id: wmlsstdlib.pir 12840 2006-05-30 15:08:05Z coke $

=head1 NAME

runtime/wmlsstdlib.pir - WMLScript standard libraries
       
=head1 DESCRIPTION

See "WMLScript Standard Libraries Specification".

=over 4

=item * Lang : F<languages/WMLScript/runtime/wmlslang.pir>

=item * Float : F<languages/WMLScript/runtime/wmlsfloat.pir>

=item * String : F<languages/WMLScript/runtime/wmlsstring.pir>

=item * Console : F<languages/WMLScript/runtime/wmlsconsole.pir>

=back

=cut

.HLL "WMLScript", "wmls_group"

.sub _init :load :anon
#    print "_init (wmlsstdlibs.pir)\n"
    new $P0, .Hash
    $P1 = getLang()
    $P0[0] = $P1
    $P1 = getFloat()
    $P0[1] = $P1
    $P1 = getString()
    $P0[2] = $P1
    $P1 = getConsole()
    $P0[99] = $P1

    global "@stdlibs" = $P0
.end

.sub not_implemented
    .local pmc ex
    ex = new .Exception
    ex["_message"] =  "not implemented"
    throw ex
.end

=head2 Helpers

=over 4

=item C<find_lib>

helper for CALL_LIB* opcodes.

=cut

.sub find_lib
    .param int lindex
    .param int findex
    $P0 = global "@stdlibs"
    push_eh _handler
    $P1 = $P0[lindex]
    $P2 = $P1[findex]
    .return ($P2)
_handler:
    .const .Sub not_implemented = "not_implemented"
    .return (not_implemented)
.end

=item C<find_lib_url>

helper for CALL_URL* opcodes.

=cut

.sub find_lib_url
    .param string url
    .param string function
    .const .Sub not_implemented = "not_implemented"
    .return (not_implemented)
.end

=back        
        
=head1 AUTHORS

Francois Perrad.

=cut

