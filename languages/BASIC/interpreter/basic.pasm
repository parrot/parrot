# Encode/Decode BASIC instructions and dispatch them
#
# Global Resources
#     I20 - Immediate Mode/Run Mode flag  =1 RUN  =0 IM
#     I22 - Please stop running flag
#     I23 - Program counter
#     I24 - Random number generator seed
#     I26 - Line number for last READ
#     I27 - Item number for last READ
#
# $Id$
# $Log$
# Revision 1.2  2004/02/29 13:18:54  leo
# release 0.1.0 preparation
# * new utility to fix version and fingerprint
# * fix line endings - reported by Mitchell N Charity
# * misc release related files updated
# * update native PBC to new version, fingerprint
#
# Revision 1.1  2003/03/09 23:08:58  clintp
# Re-organized the languages\BASIC area into two areas, one for the older
# interpreted GW-type BASIC and one for the newer compiled QB-like BASIC.
#
# Revision 1.7  2002/06/16 21:23:28  clintp
# Floating Point BASIC
#
# Revision 1.6  2002/06/01 18:23:01  clintp
# For new assembler
#
# Revision 1.5  2002/05/25 01:34:17  clintp
# Fixed trace
#
# Revision 1.4  2002/05/22 17:54:21  clintp
# Removed unneeded code, refactored
#
# Revision 1.3  2002/05/22 17:22:22  clintp
# Uses PerlHash for speed
#
# Revision 1.2  2002/04/29 01:10:04  clintp
# Speed changes, new language features
#
# Revision 1.8  2002/04/23 12:38:44  Clinton
# Various bug fixes related to Eliza
#
# Revision 1.6  2002/04/19 00:51:38  Clinton
# Fixed line-endings
#
# Revision 1.5  2002/04/15 21:22:32  Clinton
# Added quick lookups for FOR/NEXT GOSUB/RETURN
#
# Revision 1.1  2002/04/11 01:25:59  jgoff
# Adding clintp's BASIC interpreter.
#
# Revision 1.4  2002/04/07 04:10:07  Clinton
# Can't remember
#
# Revision 1.3  2002/04/01 22:16:54  Clinton
# Added DUMP copcode, protection for random seed
#
# Revision 1.2  2002/03/31 05:13:52  Clinton
# Id Keywords
#

#
# runline -- executes a BASIC instruction
#  Inputs: Code line text on stack
# Outputs: 0 everything peachy !=0 Error
#
RUNLINE:
	pushi
	pushs

	set I4, -1
	bsr TOKENIZER
	bsr REVERSESTACK

RUN_INSERT:
	restore I5   # Depth
	# This is the insertion point
	#   for "IF"
	eq I20, 0, NOLINE
	dec I5
	bsr ATOI
	restore I4

NOLINE: restore S0
	save S0
	save I5  # New Depth
	save I4  # Line number
	set I22, 0 # Error flag
	eq I25, 0, LOAD_TABLE

	print "Running "
	print I4 
	print " "
	print S0
	print "\n"


LOAD_TABLE:
	# Table of all keywords
	ne S0, "LOAD", NOT_LOAD
	bsr I_LOAD
	branch ENDLINE

NOT_LOAD:
	ne S0, "REM", NOTREM
	bsr I_REM
	branch ENDLINE

NOTREM: ne S0, "PRINT", NOTPRINT
	bsr I_PRINT
	branch ENDLINE

NOTPRINT: ne S0, "LET", NOTLET
	bsr I_LET
	branch ENDLINE

NOTLET: ne S0, "DIM", NOTDIM
	bsr I_DIM
	branch ENDLINE

NOTDIM: ne S0, "GOTO", NOTGOTO
	bsr I_GOTO
	branch ENDLINE

NOTGOTO: ne S0, "GO", NOTGO_TO
	bsr I_GOTO
	branch ENDLINE

NOTGO_TO: ne S0, "IF", NOTIF
	bsr I_IF
	branch ENDLINE

NOTIF: ne S0, "FOR", NOTFOR
	bsr I_FOR
	branch ENDLINE

NOTFOR: ne S0, "NEXT", NOTNEXT
	bsr I_NEXT
	branch ENDLINE

NOTNEXT: ne S0, "GOSUB", NOTGOSUB
	bsr I_GOSUB
	branch ENDLINE

NOTGOSUB: ne S0, "RETURN", NOTRETURN
	bsr I_RETURN
	branch ENDLINE

NOTRETURN:ne S0, "LIST", NOTLIST
	bsr I_LIST
	branch ENDLINE

NOTLIST: ne S0, "END", NOTEND
	bsr I_END
	branch ENDLINE

NOTEND: ne S0, "RUN", NOTRUN
	bsr I_RUN
	branch ENDLINE

NOTRUN: ne S0, "QUIT", NOT_QUIT
	end

NOT_QUIT: ne S0, "NEW", NOT_NEW
	bsr I_NEW
	branch ENDLINE

NOT_NEW: ne S0, "INPUT", NOT_INPUT
	bsr I_INPUT
	branch ENDLINE

NOT_INPUT: ne S0, "RESTORE", NOT_RESTORE
	bsr I_RESTORE
	branch ENDLINE

NOT_RESTORE: ne S0, "DATA", NOT_DATA
	bsr I_DATA
	branch ENDLINE

NOT_DATA: ne S0, "READ", NOT_READ
	bsr I_READ
	branch ENDLINE

NOT_READ: ne S0, "DUMP", NOT_DUMP
	bsr I_DUMP
	branch ENDLINE

NOT_DUMP: ne S0, "ON", NOT_ON
	bsr I_ON
	branch ENDLINE

NOT_ON: ne S0, "TRACE", NOT_TRACE
	bsr I_TRACE
	branch ENDLINE

NOT_TRACE:
	noop
	

RUN_ILL_INSTRUCTION:
	restore I4
	bsr CLEAR
	restore I0  # Dummy
	print "BAD KEYWORD at line "

	save I4
	bsr ITOA
	restore S31   # Convert for puts
	print S31

	print "\n"
	save 1
	ret

ENDLINE:ne I22, 0, LINEERR
	save 0  # No errors
	branch NOERR
LINEERR:save I22
NOERR:  
	save I23
	save I25
	save I26
	save I27
	save I20
	save I24
	save I28
	popi
	pops
	restore I28
	restore I24
	restore I20
	restore I27
	restore I26
	restore I25
	restore I23
	ret
