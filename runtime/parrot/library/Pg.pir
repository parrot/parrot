# Copyright (C) 2006, The Perl Foundation.
# $Id: pg.t 14701 2006-09-24 18:11:28Z leo $

=head1 NAME

Pg.pir - OO interface to libgp

=head1 SYNOPSIS

  .local pmc pg, conn, res
  pg = getclass 'Pg'
  conn = pg.'connectdb'('dbname = db')
  res = conn.'exec'('SELECT * from tab')
  # TODO

=head1 DESCRIPTION

The Pg library provides an OO interface to libpg functions.

See F<libpg> for details.

=cut

## TODO generate includes from libpq-fe.h
## .include 'postgres.pasm'

.const int CONNECTION_OK = 0

.sub __load :load
    .local pmc cl
    load_bytecode "postgres.pir"         # TODO .pbc
    cl = newclass 'Pg'       # Pg connection constructor

    # XXX the hasa 'con' is suboptimal
    cl = newclass ['Pg'; 'Conn']  # Pg connection class
    addattribute cl, 'con'
.end

=head2 Connection Construction

=over

=item Pg::connectdb('var=val var=val ...')

A class method that returns a new connection object.

=back

=cut

.namespace ['Pg']

.sub connectdb :method
    .param string args
    .local pmc con, connectdb, o_con
    connectdb = get_global 'PQconnectdb' 
    con = connectdb(args)
    $I0 = find_type ['Pg';'Conn']
    o_con = new  $I0, con
    # verify success
    .local int ok
    ok = o_con.'status'()
    if ok == CONNECTION_OK goto is_ok
    con = new .Undef
    o_con.'__init'(con)
is_ok:
    .return (o_con)
.end

.namespace ['Pg'; 'Conn']

=head2 Connection Methods

=over

=item __init(con)

Takes a C<PGconn> structure as argument and returns a Pg;Conn object.

=cut

.sub __init :method
    .param pmc con
    setattribute self, 'con', con
.end

.sub __get_bool :method
    .local pmc con
    con = getattribute self, 'con'
    $I0 = typeof con
    $I1 = isne $I0, .Undef
    .return ($I1)
.end

=item status()

Return the connection status.

=cut

.sub 'status' :method
    .local pmc con, st
    con = getattribute self, 'con'
    st = get_root_global ['parrot';'Pg'], 'PQstatus'
    $I0 = st(con)
    .return ($I0)
.end

=item finish()

Finish the connection. The connection attribute is set to .undef
thereafter and inaccessible then.

=cut

.sub 'finish' :method
    .local pmc con, finish
    con = getattribute self, 'con'
    # XXX this really is looking ugly
    # XXX and what happens if Pg is loaded from another HLL?
    finish = get_root_global ['parrot';'Pg'], 'PQfinish'
    finish(con)
    con = new .Undef
    setattribute self, 'con', con
.end


