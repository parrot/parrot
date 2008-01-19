HAI 1.2
  VISIBLE "1..16"

  BTW SANITY CHECK
  WIN
  O RLY?
    YA RLY
      VISIBLE "ok 1"
    NO WAI
      VISIBLE "nok 1"
  OIC

  BTW ANOTHER SANITY CHECK
  FAIL
  O RLY?
    YA RLY
      VISIBLE "nok 2"
    NO WAI
      VISIBLE "ok 2"
  OIC

  BTW DON'T BLINDLY EVALUATE THE SECOND BLOCK AFTER FAIL
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

  BTW BARE EXPRESSION SHOULD SET IT EVEN IF PART OF O RLY?
  4
  O RLY?
    YA RLY
      VISIBLE "ok " IT
    NO WAI
      VISIBLE "nok 4"
  OIC

  BTW ZERO IS FAIL
  0
  O RLY?
    YA RLY
      VISIBLE "nok 5"
    NO WAI
      VISIBLE "ok 5"
  OIC

  BTW NON-EMPTY YARN IS WIN
  "ok 6"
  O RLY?
    YA RLY
      VISIBLE IT
    NO WAI
      VISIBLE "nok 6"
  OIC

  BTW EMPTY YARN IS FAIL
  ""
  O RLY?
    YA RLY
      VISIBLE "nok 7"
    NO WAI
      VISIBLE "ok " IT "7"
  OIC

  BTW IGNORE MEBBE AFTER WIN
  "ok 8"
  O RLY?
    YA RLY
      VISIBLE IT
    MEBBE "nok 8"
      VISIBLE "nok 8"
    NO WAI
      VISIBLE "nok 8"
  OIC

  BTW VARIABLES CAN BE USED WITH O RLY?
  I HAS A CHEEZBURGER ITZ FAIL
  CHEEZBURGER
  O RLY?
    YA RLY
      VISIBLE "nok 9"
    NO WAI
      VISIBLE "ok 9"
  OIC

  BTW MORE FUN WITH VARIABLEs
  CHEEZBURGER R "ok 10"
  CHEEZBURGER
  O RLY?
    YA RLY
      VISIBLE IT
    NO WAI
      VISIBLE "nok 10"
  OIC

  BTW BARE EXPRESSIONS IN o RLY? CHANGE VALUE OF IT
  WIN
  O RLY?
    YA RLY
      "ok 11"
      VISIBLE IT
    NO WAI
      "nok 11"
      VISIBLE IT
  OIC

  BTW CHECK PROPER HANDLING OF IT
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
  BTW KEEP THESE TESTS TOGETHER
  IT
  O RLY?
    YA RLY
      VISIBLE IT
    NO WAI
      VISIBLE "nok 13"
  OIC

  BTW NESTED O RLY?
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

  BTW O RLY? SHOULD ONLY CALL A FUNCTION ONCE WHEN SETTING IT
  HOW DUZ I ReturnWin
    VISIBLE "ok 15"
    "ok 16"
  IF U SAY SO

  ReturnWin
  O RLY?
    YA RLY
      VISIBLE IT
    NO WAI
      VISIBLE "nok 16"
  OIC

  BTW vim: set filetype=lolcode :
KTHXBYE
