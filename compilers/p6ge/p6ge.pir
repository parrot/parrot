=head1 TITLE

p6ge.pir - main module for the Perl 6 Grammar Engine

=head1 SYNOPSIS

    ...
    .local pmc p6gec
    loadbytecode "p6ge.pir"
    p6gec = global "_p6ge_compile"
    ...
    rule = p6gec("^(From|To):")
    match = rule($S0)
    ...

=head1 DESCRIPTION

This module contains the routines and constants necessary to
use the Perl 6 Grammar Engine.

=head1 FUNCTIONS

=over 4

=cut

.sub __onload @LOAD
    newclass $P0, "P6GEMatch"
    addattribute $P0, ".target"            # string to be matched
    addattribute $P0, ".rulecor"           # match coroutine
    addattribute $P0, ".state"             # result of the match
    addattribute $P0, ".rephash"           # repeats hash (key=groupid)
    addattribute $P0, ".caphash"           # captures hash (key=groupid)
.end

=item sub = _p6ge_compile( pattern )

=item (sub, pir) = _p6ge_compile( pattern )

Compiles a string containing a pattern into a subroutine that can
be used to match strings containing the pattern.  The first form
simply returns a subroutine; the second form also returns a string
containing the intermediate PIR code that was generated to produce
the subroutine.

=cut

.sub _p6ge_compile
    .param string pattern
    .local pmc p6gec
    .local string pir
    .local pmc rulesub
    loadlib $P0, "p6ge"                    # load p6ge.so
    dlfunc p6gec, $P0, "p6ge_p6rule_pir", "tt"  # find the p6ge compiler
    
    pir = p6gec(pattern)                   # compile to PIR
    compreg $P0, "PIR"                     # get the PIR compiler
    rulesub = compile $P0, pir             # compile rule's PIR to a sub
    .return(rulesub, pir)               
.end


.namespace [ "P6GEMatch" ]

.sub _init method
    .param string target
    .param pmc rulecor
    .local pmc state, rephash, caphash
    $P0 = new .PerlString                  # set .target
    $P0 = target
    classoffset $I0, self, "P6GEMatch"       
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
    classoffset $I0, self, "P6GEMatch"
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
    classoffset $I0, self, "P6GEMatch"
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
    classoffset $I0, self, "P6GEMatch"
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
Patches and suggestions should be sent to the Perl 6 compiler list.

=head1 COPYRIGHT

Copyright (c) 2004, The Perl Foundation.

=cut
