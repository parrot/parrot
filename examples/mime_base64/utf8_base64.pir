#!./parrot
# Copyright (C) 2012, Parrot Foundation.

=head1 NAME

examples/mime_base64/utf_base64.pir - Conformant MIME::Base64 utf8 handling

=head1 SYNOPSIS

    % ./parrot examples/mime_base64/utf_base64.pir

=head1 DESCRIPTION

Compare conformant coreutils C<base64> and F<examples/mime_base64/utf_base64.pl>
against ours.
See L<https://github.com/parrot/parrot/issues/814>

=cut

.sub main :main
    load_bytecode 'MIME/Base64.pbc'

    .local pmc enc_sub
    enc_sub = get_global [ "MIME"; "Base64" ], 'encode_base64'

    .local string result_encode
    # GH 814
    result_encode = enc_sub(utf8:"\x{a2}")
    say   "encode:   utf8:\"\\x{a2}\""
    say   "expected: wqI="
    print "result:   "
    say result_encode

    # GH 813
    result_encode = enc_sub(utf8:"\x{203e}")
    say   "encode:   utf8:\"\\x{203e}\""
    say   "expected: 4oC+"
    print "result:   "
    say result_encode
    
.end

=head1 AUTHOR

ronaldxs

=head1 SEE ALSO

F<examples/mime_base64/utf8_base64.pl>,

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
