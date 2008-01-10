HAI 1.2
  VISIBLE "1..3"

  WIN
  O RLY?
    YA RLY
      VISIBLE "ok 1"
    NO WAI
      VISIBLE "nok 1"
  OIC

  FAIL
  O RLY?
    YA RLY
      VISIBLE "nok 2"
    NO WAI
      VISIBLE "ok 2"
  OIC

  FAIL
  O RLY?
    YA RLY
      VISIBLE "nok 3"
    MEBBE FAIL
      VISIBLE "nok 3"
    MEBBE WIN
      VISIBLE "ok 3"
    NO WAI
      VISIBLE "nok 3"
  OIC

  BTW vim: set filetype=lolcode :
KTHXBYE
