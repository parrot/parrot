# tokenizer
#   Input: string to be parsed on the stack (will be removed)
#  Output: stack contains number of tokens first,
#          then the tokens as seen right to left
#          ** leftmost on bottom **
# Quotes (single or double) are *preserved* so that
#     Foo "bar hlaghalg"
#   is two tokens, and the second is "bar hlaghalg"
# Consecutive non-alphabetic characters are each considered a token
#
# $Id$
# $Log$
# Revision 1.1  2003/03/09 23:08:58  clintp
# Re-organized the languages\BASIC area into two areas, one for the older
# interpreted GW-type BASIC and one for the newer compiled QB-like BASIC.
#
# Revision 1.4  2002/07/31 15:47:17  clintp
# Fixed errant pointer-copy instead of string-copy
#
# Revision 1.3  2002/06/16 21:23:28  clintp
# Floating Point BASIC
#
# Revision 1.2  2002/04/29 01:10:04  clintp
# Speed changes, new language features
#
# Revision 1.3  2002/04/23 12:38:44  Clinton
# Various bug fixes related to Eliza
#
# Revision 1.2  2002/03/31 05:13:44  Clinton
# Id Keywords
#
#
TOKENIZER:
	pushi
	pushs
	set I3, 0    # Inquote
	set I4, 0    # ALPHA
	set S0, ""   # Playground
	set S2, ""
	set S3, ""
	restore S2  # String to tokenize
	set I5, 0    # Stack pointer

TOKLOOP: length I0, S2
	eq I0, 0, ENDTOK
	set S1, ""
	substr S1, S2, 0, 1
	dec I0
	substr S2, S2, 1, I0

	eq I3, 0, NORMQ
	eq S1, S3, QUOTE
	branch CKQUOTED

NORMQ:  eq S1, "'", QUOTE
	eq S1, '"', QUOTE
	branch CKQUOTED

QUOTE:  ne I3, 0, EOTOK
	length I0,S0
	eq I0, 0, FINQUOT
	save S0  
	inc I5
FINQUOT:set I3, 1
	#set S3, S1
	clone S3, S1     # CAP
	set S0, S1
	branch TOKLOOP

EOTOK:  set I3, 0
	set S3, ""
	concat S0, S1
	savec S0   
	inc I5
	set S0, ""
	branch TOKLOOP
CKQUOTED:
	eq I3, 0, NOTQUOTED
	concat S0, S1
	branch TOKLOOP
NOTQUOTED:
	save S1
	bsr ISWHITE
	restore I2
	ne I2, 1, NOTSPACE  # Spaces will end a token
	length I0, S0
	eq I0, 0, TOKLOOP
	savec S0  
	inc I5
	set S0, ""
	branch TOKLOOP
NOTSPACE:
	save S1
	bsr ISALPHA
	restore I0
	length I1, S0
	ne I1, 0, NOTEMPTY
	set S0, S1
	set I4, I0
	branch TOKLOOP
NOTEMPTY:
	eq I4, 0, TOKCHANGED
	ne I0, I4, TOKCHANGED
	concat S0, S1
	branch TOKLOOP
TOKCHANGED:
	savec S0
	inc I5
	set S0, S1
	set I4, I0
	branch TOKLOOP
ENDTOK: length I0, S0
	eq I0, 0, TOKBAIL
	savec S0
	inc I5
TOKBAIL:save I5
	popi
	pops
	ret

