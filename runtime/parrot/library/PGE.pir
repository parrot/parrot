=head1 TITLE

PGE.pir - main module for the Parrot Grammar Engine

=head1 SYNOPSIS

    ...
    .local pmc pgec
    loadbytecode "pge.pir"
    pgec = global "_pge_compile"
    ...
    rule = pgec("^(From|To):")
    match = rule($S0)
    ...

=head1 DESCRIPTION

This module contains the routines and constants necessary to
use the Parrot Grammar Engine.

=head1 FUNCTIONS

=over 4

=cut

.sub __onload @LOAD
    newclass $P0, "PGE::Match"
    addattribute $P0, ".target"            # string to be matched
    addattribute $P0, ".rulecor"           # match coroutine
    addattribute $P0, ".state"             # result of the match
    addattribute $P0, ".rephash"           # repeats hash (key=groupid)
    addattribute $P0, ".caphash"           # captures hash (key=groupid)
.end

.namespace [ "PGE" ]

=item rulesub = p6rule( pattern )

=item (rulesub, pir) = p6rule( pattern )

Compiles a string containing a pattern into a subroutine that can
be used to match strings containing the pattern.  The first form
simply returns a subroutine; the second form also returns a string
containing the intermediate PIR code that was generated to produce
the subroutine.

=cut

.sub p6rule
    .param string pattern
    .local pmc pgec
    .local string pir
    .local pmc rulesub

    loadlib $P0, "pge"                    # load pge.so
    dlfunc pgec, $P0, "pge_p6rule_pir", "tt"  # find the pge compiler

  compile:
    pir = pgec(pattern)                   # compile to PIR
    compreg $P0, "PIR"                     # get the PIR compiler
    rulesub = compile $P0, pir             # compile rule's PIR to a sub
    .return(rulesub, pir)               
.end

=item rulesub = p5re( pattern )

=item (rulesub, pir) = p5re( pattern )

Compiles a string containing a pattern into a subroutine that can
be used to match strings containing the pattern.  The first form
simply returns a subroutine; the second form also returns a string
containing the intermediate PIR code that was generated to produce
the subroutine.

=cut

.sub p5re
    .param string pattern
    .local pmc pgec
    .local string pir
    .local pmc rulesub

    loadlib $P0, "pge"                    # load pge.so
    dlfunc pgec, $P0, "pge_p5re_pir", "tt"  # find the pge compiler

  compile:
    pir = pgec(pattern)                   # compile to PIR
    compreg $P0, "PIR"                     # get the PIR compiler
    rulesub = compile $P0, pir             # compile rule's PIR to a sub
    .return(rulesub, pir)               
.end

=item rulesub = pge_glob( pattern )

=item (rulesub, pir) = pge_glob( pattern )

Compiles a string containing a glob pattern into a subroutine that can
be used to match strings containing the pattern.  The first form
simply returns a subroutine; the second form also returns a string
containing the intermediate PIR code that was generated to produce
the subroutine.

=cut

.sub glob
    .param string pattern
    .local pmc pgec
    .local string pir
    .local pmc rulesub

    loadlib $P0, "pge"                    # load pge.so
    dlfunc pgec, $P0, "pge_glob_pir", "tt"  # find the pge compiler

  compile:
    pir = pgec(pattern)                   # compile to PIR
    compreg $P0, "PIR"                     # get the PIR compiler
    rulesub = compile $P0, pir             # compile rule's PIR to a sub
    .return(rulesub, pir)               
.end

.sub set_trace
    .param int istraced
    .local pmc pge_set_trace
    loadlib $P0, "pge"                    # load pge.so
    dlfunc $P1, $P0, "pge_set_trace", "vi"  # find the pge compiler
    $P1(istraced)
.end

.namespace [ "PGE::Match" ]

.sub "new"
    .param string target
    .param pmc rule_coro

    .local pmc self
    find_type $I0, "PGE::Match"
    new self, $I0
    self."_init"(target, rule_coro)

    .return(self)
.end

.sub _init method
    .param string target
    .param pmc rulecor
    .local pmc state, rephash, caphash
    
    $P0 = new .PerlString                  # set .target
    $P0 = target
    classoffset $I0, self, "PGE::Match"       
    setattribute self, $I0, $P0              
    inc $I0                                # set .rulecor
    setattribute self, $I0, rulecor               
    state = new .PerlInt                   # set .state attribute
    state = -1
    inc $I0
    setattribute self, $I0, state         
    rephash = new .PerlHash                # set .rep hash
    inc $I0
    setattribute self, $I0, rephash
    caphash = new .PerlHash                # set .capture hash
    inc $I0
    setattribute self, $I0, caphash
.end

.sub __get_bool method
    classoffset $I0, self, "PGE::Match"
    $I0 += 2
    getattribute $P0, self, $I0            # ".status"
    $I1 = $P0
    .return($I1)
.end

.sub _next method
    .local pmc target
    .local pmc rulecor
    .local pmc status
    .local string target_s
    .local int target_len
    .local int pos
    classoffset $I0, self, "PGE::Match"
    getattribute target, self, $I0         # ".target" string to match
    inc $I0
    getattribute rulecor, self, $I0        # ".rulecor" coroutine
    inc $I0
    getattribute status, self, $I0         # ".status"
    if status == 0 goto next_end           # already failed, so fail
    target_s = target
    target_len = length target_s
    pos = 0
    (pos) = rulecor(self, target_s, pos, target_len) 
    if pos < 0 goto next_fail
    status = 1
    goto next_end
  next_fail:
    status = 0
  next_end:
    .return(pos)
.end

.sub _print method
    .local pmc target
    .local pmc caphash
    .local pmc capiter
    .local pmc caparray
    .local pmc groupiter
    .local string gname
    classoffset $I0, self, "PGE::Match"
    getattribute target, self, $I0         # ".target" string
    $I0 += 4
    getattribute caphash, self, $I0        # ".capture" hash

    new groupiter, .Iterator, caphash
    set groupiter, 0                       # XXX: .ITERATE_FROM_START == 0
  group_loop:
    unless groupiter goto key_end
    shift gname, groupiter
    print "  $"
    print gname
    print ":"
    caparray = caphash[gname]
    new capiter, .Iterator, caparray
    set capiter, 0
  cap_loop:
    unless capiter goto cap_end
    shift $I1, capiter
    shift $I2, capiter
    $I3 = $I2 - $I1
    substr $S1, target, $I1, $I3
    print " <"
    print $S1
    print " @ "
    print $I1
    print ">"
    goto cap_loop
  cap_end:
    print "\n"
    goto group_loop
  key_end:
.end

=back

=head1 AUTHOR

Patrick Michaud (pmichaud@pobox.com) is the author and maintainer.
Patches and suggestions should be sent to the Perl 6 compiler list
(perl6-compiler@perl.org).

=head1 COPYRIGHT

Copyright (c) 2004, The Perl Foundation.

=cut
