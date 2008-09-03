require 'test'
plan 3

ok "foo" =~ /oo/, 'basic regex matching'

a = /a+/
ok "bar" =~ a, 'save a regex in a variable'

# We only have Perl 6 Rules right now.  No pcre.
b = /^ <[abc]>+ $/
ok "abacabba" =~ b, 'slightly more complex regex'
