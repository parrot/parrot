HAI 1.2
  VISIBLE "1..14"

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

  4
  O RLY?
    YA RLY
      VISIBLE "ok " IT
    NO WAI
      VISIBLE "nok 4"
  OIC

  0
  O RLY?
    YA RLY
      VISIBLE "nok 5"
    NO WAI
      VISIBLE "ok 5"
  OIC

  "ok 6"
  O RLY?
    YA RLY
      VISIBLE IT
    NO WAI
      VISIBLE "nok 6"
  OIC

  ""
  O RLY?
    YA RLY
      VISIBLE "nok 7"
    NO WAI
      VISIBLE "ok " IT "7"
  OIC

  "ok 8"
  O RLY?
    YA RLY
      VISIBLE IT
    MEBBE "nok 8"
      VISIBLE "nok 8"
    NO WAI
      VISIBLE "nok 8"
  OIC

  I HAS A CHEEZBURGER ITZ FAIL
  CHEEZBURGER
  O RLY?
    YA RLY
      VISIBLE "nok 9"
    NO WAI
      VISIBLE "ok 9"
  OIC

  CHEEZBURGER R "ok 10"
  CHEEZBURGER
  O RLY?
    YA RLY
      VISIBLE IT
    NO WAI
      VISIBLE "nok 10"
  OIC

  WIN
  O RLY?
    YA RLY
      "ok 11"
      VISIBLE IT
    NO WAI
      "nok 11"
      VISIBLE IT
  OIC

  "ok 12"

  IT
  O RLY?
    YA RLY
      VISIBLE IT
      "ok 13"
    NO WAI
      VISIBLE "nok 12"
      "nok 12"
  OIC

  IT
  O RLY?
    YA RLY
      VISIBLE IT
    NO WAI
      VISIBLE "nok 13"
  OIC

  FAIL
  O RLY?
    YA RLY
      VISIBLE "nok 14"
    NO WAI
      "ok 14"
      O RLY?
        YA RLY
	  IT
          O RLY?
            YA RLY
              VISIBLE IT
            NO WAI
              VISIBLE "nok 14"
          OIC
        NO WAI
          VISIBLE "nok 14"
      OIC
  OIC

  BTW vim: set filetype=lolcode :
KTHXBYE
