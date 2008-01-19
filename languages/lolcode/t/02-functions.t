HAI 1.2
  VISIBLE "1..9"

  OBTW
    Function names in this file conform to RFC 3092.
    http://www.faqs.org/rfcs/rfc3092.html
  TLDR

  BTW SANITY CHECK
  HOW DUZ I foo
    VISIBLE "ok 1"
  IF U SAY SO

  foo

  BTW FUNCTIONS SHOULD RETURN IT
  HOW DUZ I bar
    "ok 3"
    VISIBLE "ok 2"
  IF U SAY SO

  VISIBLE bar

  BTW FUNCTIONS SHOULD ONLY BE EVALUATED ONCE
  HOW DUZ I baz
    "ok 5"
    VISIBLE "ok 4"
  IF U SAY SO

  I HAS A RESULT ITZ baz

  VISIBLE RESULT

  BTW VARIABLES SHOULD BE LOCAL TO A FUNCTION
  HOW DUZ I qux
    I HAS A VAR ITZ "nok 7"
    VISIBLE "ok 6"
  IF U SAY SO

  I HAS A VAR ITZ "ok 7"
  qux
  VISIBLE VAR

  BTW IT SHOULD ALSO BE LOCAL TO A FUNCTION
  HOW DUZ I quux
    "nok 9"
    VISIBLE "ok 8"
  IF U SAY SO

  "ok 9"
  VAR R quux
  VISIBLE IT

  BTW vim: set filetype=lolcode :
KTHXBYE
