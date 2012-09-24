#! /usr/bin/perl
use strict;
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
