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
    # TODO verify success
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


