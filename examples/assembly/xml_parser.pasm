# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/assembly/xml_parser.pasm - Simple XML Parser

=head1 SYNOPSIS

    % ./parrot examples/assembly/xml_parser.pasm examples/assembly/small.xml

Note that this example currently seems to be broken:

    Couldn't open small.xml
    
=head1 DESCRIPTION

This is a rudimentary XML-ish parser in PASM. It currently handles only
well-formed XML, doesn't throw errors, etc...
 
Limitations:

=over 4

=item * validation? check for well formedness? Dream on.

=item * elements like C<&lt;> aren't handled yet

=item * bugs-a-plenty, I'm sure.

=back

This is more of a proof-of-concept than anything else. Try putting this
in a file:

    <xml version='1.0'>
    <top>
    <inner foo='bar' narf='poit'>
    <junk>Hello</junk>
    <empty/>
    </inner>
    </top>

And see what it does.  :)

See the notes near the C<read()> for IO problem notes.

Register Usage:

    S0, S1, S2, S5 -- Temporary Registers
    S7             -- Current token in procintags()
    S10            -- HACK for broken I/O
    S11            -- Character being processed
    I0, I1, I2     -- Temporary Registers
    I7             -- Type of current element
    I8             -- "In Quotes" flag
    I13            -- Type of the last token

The stack is used all to hell.  :)

Data is stored on the stack in type/value pairs:
 
      -1 ""  (uninitialized slot)
       0 Element Name
       1 Attribute Name
       2 Attribute Value
       5 Close of Element (no data)
       6 Close of Element, also start (no data)
      99 Data associated with this element
    1000 (no data) sentinel for the bottom of the stack

=cut

# A functions-first kinda guy
	branch MAIN

# Test for alphabeticness (7-bit ASCII only)
#  Input: (1-char) String on stack
# Output: 0 or 1 (integer) on stack
# Ex:	save "<"
#	bsr ISALPHA
#	restore I2  # False!
#
ISALPHA:
	restore S1

	ge S1, "A", UPPER
	branch NONUP
UPPER:  le S1, "Z", ALPHA

NONUP:
	ge S1, "a", LOWER
	branch NONLOW
LOWER:  le S1, "z", ALPHA

NONLOW:
        ge S1, "0", NUMBER
        branch NONUM
NUMBER: le S1, "9", ALPHA

NONUM:  eq S1, "_", ALPHA

        # Not A-Z0-9_
	set I1, 0
	branch LEAVE_ISALPHA

ALPHA:  set I1, 1

LEAVE_ISALPHA:
	save I1
	ret


# Fetch a character from the filehandle
# Inputs: (Supposedly a file somewhere...)
# Outputs: 1 character from the filehandle
#
# **** BUG BUG BUG *****  TEMPORARY ROUTINE
# For now Parrot's I/O seems completely b0rk3n
#    instead, just pull characters off "S10" which
#    contains the XML to be processed.  Trying to perform
#    a read loop with everything else going on smashes the
#    user stack.  Sometimes.
# **** BUG BUG BUG *****  TEMPORARY ROUTINE

FETCH:  length I1, S10
        ne I1, 0, GETCHAR
        branch EOF

GETCHAR:
        substr S1, S10, 0, 1
        length I1, S10
        dec I1
        substr S10, S10, 1, I1
        gt I1, 0, NOINIT
        branch EOF

NOINIT: save S1
        ret

EOF:    end


# Process the internal bits of tags.  The processor is really, really
# crude.  For example the first word-thing is the element.  The next
# word-thing is an attribute name, and the next word-thing is the value.
# Lather, rinse, repeat.
#
# Quoted things are obeyed.  Because of a string handling SNAFU in either
# the assembler or Parrot, your attributes have to be *SINGLE* quoted for
# now.
#
PROCINTAG:
	restore S1           # Character we're processing
	restore I7           # Type of thing last on the stack

	ne I7, 1000, NOTEOS
	save 1000
	set S7, ""
	branch QUOTECHECK
NOTEOS: restore S7	     # Get element from stack

QUOTECHECK:
	ne S1, "'", NOQUOTE
	eq I8, 1, UNSET
	set I8, 1
	branch NOQUOTE
UNSET:
	set I8, 0
NOQUOTE:

	ne I13, -1, NOTEND	  # End tag?
	ne S1, "/", NOTEND
	save ""
	save 5			  # CLOSER
	branch EPITE

NOTEND:
	eq I13, -1, NOTBEGEND
	ne S1, "/", NOTBEGEND
	eq I8, 1,   NOTBEGEND	  # start/end tag <foo/>
	save S7
	save I7
	save S7
	save 6			  # OPENCLOSER
	branch EPITE

NOTBEGEND:
	save S1
	bsr ISALPHA		  # isalpha()
	restore I2
	eq I2, 1, PROCALPHA       # If it *was* alpha or
	eq I8, 1, PROCALPHA       # we were in a quote, goto PROCALPHA
	save S7
	save I7
	eq I7, -1, NOSTART
	save ""
	save -1

NOSTART:
	ne I13, 2, NOTVAL   # VALUE
	set I13, 0

NOTVAL:
	branch EPITE

PROCALPHA:
	ne I7, -1, PART2
	eq I8, 1, FOUNDONE
	eq I2, 1, FOUNDONE
	branch PART2

FOUNDONE:
	set I7, I13
	inc I7
	le I7, 2, NOFLOW
	set I7, 2
NOFLOW:
	set S7, ""
	eq I8, 1, FINALPUSH
	set S7, S1
	branch FINALPUSH

PART2:
	eq I7, -1, FINALPUSH
	eq I2, 1, APPEND
	eq I8, 1, APPEND
	branch FINALPUSH

APPEND:
	concat S7, S1

FINALPUSH:
	eq I7, 1000, EPIT
	save S7
	save I7
EPIT:
	set I13, I7
EPITE:
	ret


# Decide if this is the beginning of a start tag
# or the beginning of a start/end tag
#    Peeks at the top thing on the stack to figure
#    out what a > means.  This way both the start and end
#    callbacks get called for <foo/>
DECIDE:
        restore I1
	save I1
	ne I1, 5, NOTCLOSER
	branch ENDTAG

NOTCLOSER:
	ne I1, 6, NOTOPENCLOSER
	bsr STARTTAG
	branch ENDTAG

NOTOPENCLOSER:
	branch STARTTAG



# #######################
# USER CALLBACKS ARE HERE


# The start callback is called after the start tag
# is finally processed.  You MUST LEAVE the type 0
# element on the stack when you're done processing!
#
# This sample simply prints the element name and the
#    attribute/value pairs.

STARTTAG:
	set S0, ""
CRAWL:
	restore I1
	eq I1, 1000, NOTATEOSERR
	set S2, ""
	restore S2
	branch NOTATEOSHERE

NOTATEOSERR:  # Should never happen
	print "ERROR ERRROR ERROR ERROR\n"
	print I1
	print "\n"
	end

NOTATEOSHERE:
	ne I1, 0, NOTSELEM
	print "Start "		# All done w/attrib
	print S2
	print S0
	print "\n"
	save S2
	save I1
	branch ENDSTART

NOTSELEM:  			 # Process attribs on stack
	ne I1, 1, NOTATTRIB
	set S5, S0
	set S0, " "
	concat S0, S2
	concat S0, "="
	concat S0, S5
	branch CRAWL

NOTATTRIB:
	ne I1, 2, NOTVALUE
	set S5, S0
	set S0, S2
	concat S0, S5

NOTVALUE:
	branch CRAWL

ENDSTART:
	ret


# This is a sample "end element" handler.
#
# A good "end element" handler will possibly print the
#   data that's been acumulated on the stack, etc..
# At the very least it should remove everthing on the stack
#   back to /and including/ the element itself (type 0).

ENDTAG:
	restore I1
	restore S2
CLEAN:
	restore I1
	ne I1, 1000, NOTATEOS
	save 1000
	branch ENDENDTAG
NOTATEOS:
	restore S1
	ne I1, 0, NOTELEM
	print "Close "
	print S2
	print "\n"
	branch ENDENDTAG
NOTELEM:
	ne I1, 99, ENDENDTAG
	print "Data "
	print S1
	print "\n"
	branch CLEAN

ENDENDTAG:
	ret

# The character handler is called with the character
#   on the stack.  Please to be pulling it off.  Thank you.
# Normally char handlers accumulate CDATA seen in the elements.
#   Not necessary.  That's handled elsewhere.  In *fact* the top
#   of the stack at this point contains the data accumulated so far.

CHAR:   restore S0
	ret

#   END USER CALLBACKS
# #######################

#
# Main Body
#
MAIN:
	# For now, this is the XML that's going to get parsed.
	# When the read() stuff gets fixed, this can be read from
	#    a file as it's being processed.  For now, slurp it.
	# SMALL FILES ONLY.  SMALL.  SMALL.  SMALL.  Parrots I/O
	# GC does not play nice with read().
	set S10, ""
	open P0, "small.xml", "<"
	if P0, READ
	print "Couldn't open small.xml\n"
	exit 1
READ:
	set S0, ""
	read S0, P0, 32768
	length I1, S0
	eq I1, 0, CLOSE
	concat S10, S0
	branch READ

CLOSE:
	close P0
	save 1000     # EOS marker

LOOP:   bsr FETCH
	restore S11
	length I0, S11
	eq I0, 0, BAIL

        ne S11, "<", NOTLESS   # if (char eq "<")
	set I12, 1
	set I13, -1  # Uninit
	restore I1
	save I1
	eq I1, 1000, SSTART
        ne I1, -1  , SSTART
        branch EOPEN
SSTART:
	save ""
	save -1
EOPEN:	branch CHARP


NOTLESS:			# if (char eq ">")
        ne S11, ">", NOTGREATER
	set I12, 0
	bsr DECIDE
        branch CHARP


NOTGREATER:

	ne I12, 0, CHARP        # if (! intag)
	restore I1
	ne I1, 1000, DATAC
	save 1000		# Push EOS back on
	branch CHARP

DATAC:
	ne I1, 99, NOTDATAC
	restore S1
	concat S1, S11	        # Append data.
	save S1
	save 99

	save S11
	bsr CHAR

	branch CHARP

NOTDATAC:
	save I1
	eq S1, "\n", CHARP
	save S11
	save 99

	save S11
	bsr CHAR		# Callback for char()

	branch CHARP

CHARP:
	ne I12, 1, CHARPE
	save S11
	bsr PROCINTAG
CHARPE:
	branch LOOP


BAIL:
	close P0
	end

=head1 SEE ALSO

F<examples/assembly/small.xml>.

=head1 HISTORY

    (First Parrot Assembler Program)
    Clinton A. Pierce  3/13/2002
    clintp@geeksalad.org
    Freely Redistributable

=cut
