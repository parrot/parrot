/* ANSI-C code produced by gperf version 3.0.4 */
/* Command-line: gperf --output-file=tmp_namealias.c src/string/namealias_c.in  */
/* Computed positions: -k'1,14,$' */

#if !((' ' == 32) && ('!' == 33) && ('"' == 34) && ('#' == 35) \
      && ('%' == 37) && ('&' == 38) && ('\'' == 39) && ('(' == 40) \
      && (')' == 41) && ('*' == 42) && ('+' == 43) && (',' == 44) \
      && ('-' == 45) && ('.' == 46) && ('/' == 47) && ('0' == 48) \
      && ('1' == 49) && ('2' == 50) && ('3' == 51) && ('4' == 52) \
      && ('5' == 53) && ('6' == 54) && ('7' == 55) && ('8' == 56) \
      && ('9' == 57) && (':' == 58) && (';' == 59) && ('<' == 60) \
      && ('=' == 61) && ('>' == 62) && ('?' == 63) && ('A' == 65) \
      && ('B' == 66) && ('C' == 67) && ('D' == 68) && ('E' == 69) \
      && ('F' == 70) && ('G' == 71) && ('H' == 72) && ('I' == 73) \
      && ('J' == 74) && ('K' == 75) && ('L' == 76) && ('M' == 77) \
      && ('N' == 78) && ('O' == 79) && ('P' == 80) && ('Q' == 81) \
      && ('R' == 82) && ('S' == 83) && ('T' == 84) && ('U' == 85) \
      && ('V' == 86) && ('W' == 87) && ('X' == 88) && ('Y' == 89) \
      && ('Z' == 90) && ('[' == 91) && ('\\' == 92) && (']' == 93) \
      && ('^' == 94) && ('_' == 95) && ('a' == 97) && ('b' == 98) \
      && ('c' == 99) && ('d' == 100) && ('e' == 101) && ('f' == 102) \
      && ('g' == 103) && ('h' == 104) && ('i' == 105) && ('j' == 106) \
      && ('k' == 107) && ('l' == 108) && ('m' == 109) && ('n' == 110) \
      && ('o' == 111) && ('p' == 112) && ('q' == 113) && ('r' == 114) \
      && ('s' == 115) && ('t' == 116) && ('u' == 117) && ('v' == 118) \
      && ('w' == 119) && ('x' == 120) && ('y' == 121) && ('z' == 122) \
      && ('{' == 123) && ('|' == 124) && ('}' == 125) && ('~' == 126))
/* The character set is not based on ISO-646.  */
#  error "gperf generated tables don't work with this execution character set."
#endif


/*
  Copyright (C) 2014, Parrot Foundation.

=head1 NAME

src/string/namealias.c - namealias for ICU control characters

=head1 DESCRIPTION

Generated namealias hash for icu control characters

- perl -F'/;/' -alne'print "$F[10],\t0x$F[0]" if $F[1] eq "<control>" and $F[10]' \
    UnicodeData.txt >> src/string/namealias_c.in

- gperf --output-file=src/string/namealias.c src/string/namealias_c.in

- manual cleanup for inline and codingstd_tests. TODO: tools/build/namealias.pl

=over 4

=item C<struct Parrot_namealias>

Generated hash table with name and key.

=back

=head2 Functions

=over 4

=item C<static unsigned int Parrot_namealias_hash(register const char *str,
register unsigned int len)>

=item C<const struct Parrot_namealias * Parrot_namealias_lookup(register const
char *str, register unsigned int len)>

Generated lookup function used by the C<find_codepoint> op for name aliases not found
by some ICU versions.

=back

=cut

*/

#define PARROT_IN_CORE
#include <string.h>
#include "parrot/config.h"

/* HEADERIZER HFILE: include/parrot/namealias.h */
/* HEADERIZER STOP */

const struct Parrot_namealias *
Parrot_namealias_lookup(register const char *str, register unsigned int len);
struct Parrot_namealias { int name; const INTVAL codepoint; };

#define TOTAL_KEYWORDS 61
#define MIN_WORD_LENGTH 4
#define MAX_WORD_LENGTH 39
#define MIN_HASH_VALUE 4
#define MAX_HASH_VALUE 139
/* maximum key range = 136, duplicates = 0 */


static unsigned int
Parrot_namealias_hash(register const char *str, register unsigned int len)
{
  static const unsigned char asso_values[] =
    {
      140, 140, 140, 140, 140, 140, 140, 140, 140, 140,
      140, 140, 140, 140, 140, 140, 140, 140, 140, 140,
      140, 140, 140, 140, 140, 140, 140, 140, 140, 140,
      140, 140, 140, 140, 140, 140, 140, 140, 140, 140,
      140,  30, 140, 140, 140, 140, 140, 140, 140, 140,
      140, 140, 140, 140, 140, 140, 140, 140, 140, 140,
      140, 140, 140, 140, 140,  30,   0,  55,   5,   0,
        5,  45, 140,  35, 140,  40,   0,  40,  35,  15,
       55, 140,   5,   0,  15,  10, 140,   5, 140,   0,
      140, 140, 140, 140, 140, 140, 140, 140, 140, 140,
      140, 140, 140, 140, 140, 140, 140, 140, 140, 140,
      140, 140, 140, 140, 140, 140, 140, 140, 140, 140,
      140, 140, 140, 140, 140, 140, 140, 140, 140, 140,
      140, 140, 140, 140, 140, 140, 140, 140, 140, 140,
      140, 140, 140, 140, 140, 140, 140, 140, 140, 140,
      140, 140, 140, 140, 140, 140, 140, 140, 140, 140,
      140, 140, 140, 140, 140, 140, 140, 140, 140, 140,
      140, 140, 140, 140, 140, 140, 140, 140, 140, 140,
      140, 140, 140, 140, 140, 140, 140, 140, 140, 140,
      140, 140, 140, 140, 140, 140, 140, 140, 140, 140,
      140, 140, 140, 140, 140, 140, 140, 140, 140, 140,
      140, 140, 140, 140, 140, 140, 140, 140, 140, 140,
      140, 140, 140, 140, 140, 140, 140, 140, 140, 140,
      140, 140, 140, 140, 140, 140, 140, 140, 140, 140,
      140, 140, 140, 140, 140, 140, 140, 140, 140, 140,
      140, 140, 140, 140, 140, 140
    };
  register int hval = len;

  switch (hval)
    {
      default:
        hval += asso_values[(unsigned char)str[13]];
      /*FALLTHROUGH*/
      case 13:
      case 12:
      case 11:
      case 10:
      case 9:
      case 8:
      case 7:
      case 6:
      case 5:
      case 4:
      case 3:
      case 2:
      case 1:
        hval += asso_values[(unsigned char)str[0]];
        break;
    }
  return hval + asso_values[(unsigned char)str[len - 1]];
}

struct stringpool_t
  {
    char stringpool_str4[sizeof ("BELL")];
    char stringpool_str6[sizeof ("ESCAPE")];
    char stringpool_str7[sizeof ("ENQUIRY")];
    char stringpool_str9[sizeof ("BACKSPACE")];
    char stringpool_str10[sizeof ("SUBSTITUTE")];
    char stringpool_str11[sizeof ("DELETE")];
    char stringpool_str18[sizeof ("SET TRANSMIT STATE")];
    char stringpool_str20[sizeof ("BREAK PERMITTED HERE")];
    char stringpool_str21[sizeof ("SYNCHRONOUS IDLE")];
    char stringpool_str23[sizeof ("DEVICE CONTROL ONE")];
    char stringpool_str24[sizeof ("SHIFT OUT")];
    char stringpool_str25[sizeof ("DEVICE CONTROL THREE")];
    char stringpool_str26[sizeof ("END OF TEXT")];
    char stringpool_str28[sizeof ("START OF TEXT")];
    char stringpool_str29[sizeof ("DEVICE CONTROL FOUR")];
    char stringpool_str32[sizeof ("REVERSE LINE FEED")];
    char stringpool_str33[sizeof ("SINGLE SHIFT THREE")];
    char stringpool_str38[sizeof ("DEVICE CONTROL TWO")];
    char stringpool_str39[sizeof ("NULL")];
    char stringpool_str41[sizeof ("ACKNOWLEDGE")];
    char stringpool_str43[sizeof ("SHIFT IN")];
    char stringpool_str46[sizeof ("SINGLE SHIFT TWO")];
    char stringpool_str47[sizeof ("SINGLE CHARACTER INTRODUCER")];
    char stringpool_str48[sizeof ("NO BREAK HERE")];
    char stringpool_str49[sizeof ("LINE TABULATION SET")];
    char stringpool_str50[sizeof ("END OF SELECTED AREA")];
    char stringpool_str51[sizeof ("DATA LINK ESCAPE")];
    char stringpool_str52[sizeof ("STRING TERMINATOR")];
    char stringpool_str53[sizeof ("END OF MEDIUM")];
    char stringpool_str54[sizeof ("END OF GUARDED AREA")];
    char stringpool_str56[sizeof ("START OF GUARDED AREA")];
    char stringpool_str59[sizeof ("OPERATING SYSTEM COMMAND")];
    char stringpool_str60[sizeof ("INFORMATION SEPARATOR ONE")];
    char stringpool_str61[sizeof ("CANCEL")];
    char stringpool_str62[sizeof ("INFORMATION SEPARATOR THREE")];
    char stringpool_str65[sizeof ("LINE TABULATION")];
    char stringpool_str66[sizeof ("INFORMATION SEPARATOR FOUR")];
    char stringpool_str67[sizeof ("APPLICATION PROGRAM COMMAND")];
    char stringpool_str70[sizeof ("NEGATIVE ACKNOWLEDGE")];
    char stringpool_str71[sizeof ("DEVICE CONTROL STRING")];
    char stringpool_str74[sizeof ("LINE FEED (LF)")];
    char stringpool_str75[sizeof ("INFORMATION SEPARATOR TWO")];
    char stringpool_str79[sizeof ("FORM FEED (FF)")];
    char stringpool_str80[sizeof ("NEXT LINE (NEL)")];
    char stringpool_str81[sizeof ("PARTIAL LINE BACKWARD")];
    char stringpool_str85[sizeof ("PARTIAL LINE FORWARD")];
    char stringpool_str89[sizeof ("END OF TRANSMISSION")];
    char stringpool_str90[sizeof ("PRIVATE USE TWO")];
    char stringpool_str91[sizeof ("CANCEL CHARACTER")];
    char stringpool_str95[sizeof ("START OF STRING")];
    char stringpool_str96[sizeof ("START OF HEADING")];
    char stringpool_str100[sizeof ("END OF TRANSMISSION BLOCK")];
    char stringpool_str104[sizeof ("CHARACTER TABULATION SET")];
    char stringpool_str105[sizeof ("PRIVATE USE ONE")];
    char stringpool_str107[sizeof ("START OF SELECTED AREA")];
    char stringpool_str110[sizeof ("CARRIAGE RETURN (CR)")];
    char stringpool_str115[sizeof ("PRIVACY MESSAGE")];
    char stringpool_str120[sizeof ("CHARACTER TABULATION")];
    char stringpool_str122[sizeof ("CONTROL SEQUENCE INTRODUCER")];
    char stringpool_str135[sizeof ("MESSAGE WAITING")];
    char stringpool_str139[sizeof ("CHARACTER TABULATION WITH JUSTIFICATION")];
  };
static const struct stringpool_t stringpool_contents =
  {
    "BELL",
    "ESCAPE",
    "ENQUIRY",
    "BACKSPACE",
    "SUBSTITUTE",
    "DELETE",
    "SET TRANSMIT STATE",
    "BREAK PERMITTED HERE",
    "SYNCHRONOUS IDLE",
    "DEVICE CONTROL ONE",
    "SHIFT OUT",
    "DEVICE CONTROL THREE",
    "END OF TEXT",
    "START OF TEXT",
    "DEVICE CONTROL FOUR",
    "REVERSE LINE FEED",
    "SINGLE SHIFT THREE",
    "DEVICE CONTROL TWO",
    "NULL",
    "ACKNOWLEDGE",
    "SHIFT IN",
    "SINGLE SHIFT TWO",
    "SINGLE CHARACTER INTRODUCER",
    "NO BREAK HERE",
    "LINE TABULATION SET",
    "END OF SELECTED AREA",
    "DATA LINK ESCAPE",
    "STRING TERMINATOR",
    "END OF MEDIUM",
    "END OF GUARDED AREA",
    "START OF GUARDED AREA",
    "OPERATING SYSTEM COMMAND",
    "INFORMATION SEPARATOR ONE",
    "CANCEL",
    "INFORMATION SEPARATOR THREE",
    "LINE TABULATION",
    "INFORMATION SEPARATOR FOUR",
    "APPLICATION PROGRAM COMMAND",
    "NEGATIVE ACKNOWLEDGE",
    "DEVICE CONTROL STRING",
    "LINE FEED (LF)",
    "INFORMATION SEPARATOR TWO",
    "FORM FEED (FF)",
    "NEXT LINE (NEL)",
    "PARTIAL LINE BACKWARD",
    "PARTIAL LINE FORWARD",
    "END OF TRANSMISSION",
    "PRIVATE USE TWO",
    "CANCEL CHARACTER",
    "START OF STRING",
    "START OF HEADING",
    "END OF TRANSMISSION BLOCK",
    "CHARACTER TABULATION SET",
    "PRIVATE USE ONE",
    "START OF SELECTED AREA",
    "CARRIAGE RETURN (CR)",
    "PRIVACY MESSAGE",
    "CHARACTER TABULATION",
    "CONTROL SEQUENCE INTRODUCER",
    "MESSAGE WAITING",
    "CHARACTER TABULATION WITH JUSTIFICATION"
  };
#define stringpool ((const char *) &stringpool_contents)

const struct Parrot_namealias *
Parrot_namealias_lookup(register const char *str, register unsigned int len)
{
  static const struct Parrot_namealias wordlist[] =
    {
      {-1, 0}, {-1, 0}, {-1, 0}, {-1, 0},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str4,	0x0007},
      {-1, 0},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str6,	0x001B},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str7,	0x0005},
      {-1, 0},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str9,	0x0008},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str10,	0x001A},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str11,	0x007F},
      {-1, 0}, {-1, 0}, {-1, 0}, {-1, 0}, {-1, 0}, {-1, 0},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str18,	0x0093},
      {-1, 0},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str20,	0x0082},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str21,	0x0016},
      {-1, 0},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str23,	0x0011},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str24,	0x000E},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str25,	0x0013},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str26,	0x0003},
      {-1, 0},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str28,	0x0002},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str29,	0x0014},
      {-1, 0}, {-1, 0},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str32,	0x008D},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str33,	0x008F},
      {-1, 0}, {-1, 0}, {-1, 0}, {-1, 0},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str38,	0x0012},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str39,	0x0000},
      {-1, 0},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str41,	0x0006},
      {-1, 0},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str43,	0x000F},
      {-1, 0}, {-1, 0},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str46,	0x008E},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str47,	0x009A},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str48,	0x0083},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str49,	0x008A},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str50,	0x0087},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str51,	0x0010},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str52,	0x009C},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str53,	0x0019},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str54,	0x0097},
      {-1, 0},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str56,	0x0096},
      {-1, 0}, {-1, 0},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str59,	0x009D},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str60,	0x001F},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str61,	0x0018},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str62,	0x001D},
      {-1, 0}, {-1, 0},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str65,	0x000B},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str66,	0x001C},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str67,	0x009F},
      {-1, 0}, {-1, 0},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str70,	0x0015},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str71,	0x0090},
      {-1, 0}, {-1, 0},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str74,	0x000A},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str75,	0x001E},
      {-1, 0}, {-1, 0}, {-1, 0},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str79,	0x000C},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str80,	0x0085},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str81,	0x008C},
      {-1, 0}, {-1, 0}, {-1, 0},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str85,	0x008B},
      {-1, 0}, {-1, 0}, {-1, 0},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str89,	0x0004},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str90,	0x0092},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str91,	0x0094},
      {-1, 0}, {-1, 0}, {-1, 0},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str95,	0x0098},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str96,	0x0001},
      {-1, 0}, {-1, 0}, {-1, 0},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str100,	0x0017},
      {-1, 0}, {-1, 0}, {-1, 0},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str104,	0x0088},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str105,	0x0091},
      {-1, 0},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str107,	0x0086},
      {-1, 0}, {-1, 0},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str110,	0x000D},
      {-1, 0}, {-1, 0}, {-1, 0}, {-1, 0},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str115,	0x009E},
      {-1, 0}, {-1, 0}, {-1, 0}, {-1, 0},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str120,	0x0009},
      {-1, 0},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str122,	0x009B},
      {-1, 0}, {-1, 0}, {-1, 0}, {-1, 0}, {-1, 0}, {-1, 0}, {-1, 0}, {-1, 0}, {-1, 0},
      {-1, 0}, {-1, 0}, {-1, 0},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str135,	0x0095},
      {-1, 0}, {-1, 0}, {-1, 0},
      {(int)(long)&((struct stringpool_t *)0)->stringpool_str139,	0x0089}
    };

  if (len <= MAX_WORD_LENGTH && len >= MIN_WORD_LENGTH)
    {
      register int key = Parrot_namealias_hash(str, len);

      if (key <= MAX_HASH_VALUE && key >= 0)
        {
          register int o = wordlist[key].name;
          if (o >= 0)
            {
              register const char *s = o + stringpool;

              if (*str == *s && !strcmp(str + 1, s + 1))
                return &wordlist[key];
            }
        }
    }
  return 0;
}


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
