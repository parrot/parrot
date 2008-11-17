# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 TITLE

mysqltest.pir - Test NCI with mysqlclient

=head1 SYNOPSIS

A test for Mysql.pir module.

Compile Mysql.pbc before usage.

This is an initial version, be careful and not expect too much.

Connection data and query are hard coded, edit the file to change.

=cut

########################################################################

.sub main :main

    load_bytecode 'Mysql.pbc'
    .local pmc m
    m = new ['Mysql']

    .local pmc get_client_info

    print 'mysql client version: '
    get_client_info = get_global ['Mysql'], 'get_client_info'
    $S0 = get_client_info()
    say $S0
# Just a test of the error method
    $S0 = m.'error'()
    $I0 = bytelength $S0
    unless $I0 goto good
    say $S0
    exit 1
good:

    m.'connect'('localhost', 'parrot', 'baDworD', 'parrot')

    m.'query'('select * from hello;')

    .local pmc r
    r = m.'use_result'()
    .local pmc row
    .local int n
    n = r.'field_count'()
nextrow:
    row = r.'fetch_row'()
    $I0 = defined row
    unless $I0 goto finish
    #n = row
    $I0 = 0
    print "'"
nextcol:
    eq $I0, n, endrow
    $S0 = row [$I0]
    print $S0
    inc $I0
    eq $I0, n, endrow
    print "', '"
    goto nextcol
endrow:
    say "'"
    goto nextrow
finish:

    r.'free'()

# Testing prepared statement

    .local pmc stmt
    stmt = m.'prepare'('select * from hello where foo = ?')
    $I0 = stmt.'param_count'()
    print 'Param count: '
    say $I0

    $I0 = stmt.'close'()
    print 'Close result: '
    say $I0
.end

#-----------------------------------------------------------------------
# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
