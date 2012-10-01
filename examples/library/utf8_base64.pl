#! perl
# Copyright (C) 2012, Parrot Foundation.

=head1 NAME

examples/mime_base64/utf_base64.pl - Conformant MIME::Base64 utf8 handling

=head1 SYNOPSIS

    % perl examples/mime_base64/utf_base64.pl

=head1 DESCRIPTION

Compare conformant coreutils C<base64> and F<examples/mime_base64/utf_base64.pl>
against parrots.
See L<https://github.com/parrot/parrot/issues/814>

Note: Unicode stored as MIME::Base64 is inherently endian-dependent.

=cut

use strict;
use warnings;
use MIME::Base64 qw(encode_base64 decode_base64);
use Encode qw(encode);

my $encoded = encode_base64(encode("UTF-8", "\x{a2}"));
print  "encode:   utf-8:\"\\x{a2}\"  - ", encode("UTF-8", "\x{a2}"), "\n";
print  "expected: wqI=\n";
print  "result:   $encoded\n";
print  "decode:   ",decode_base64("wqI="),"\n\n"; # 302 242

my $encoded = encode_base64(encode("UTF-8", "\x{203e}"));
print  "encode:   utf-8:\"\\x{203e}\"  -> ",encode("UTF-8", "\x{203e}"),"\n";
print  "expected: 4oC+\n";
print  "result:   $encoded\n"; # 342 200 276
print  "decode:   ",decode_base64("4oC+"),"\n";

for ([qq(a2)],[qq(c2a2)],[qw(203e)],[qw(3e 20)],[qw(1000)],[qw(00c7)],[qw(00ff 0000)]){
    $s = pack "H*",@{$_};
    printf "0x%s\t=> %s", join("",@{$_}), encode_base64($s);
}

=head1 AUTHORS

ronaldxs, Reini Urban

=head1 SEE ALSO

F<examples/mime_base64/utf8_base64.pir>,

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
