## $Id$

=head1 NAME

main.pir -- code for running TAP Parser from command line

=head1 DESCRIPTION

See TAP.pir for a synopsis.

=head1 Functions

=over 4

=item C<main(PMC args)>

Handles program control when the TAP.pbc file is executed
directly from the Parrot command line.  It calls all of
the submodule :load routines, then processes commands from
the file specified on the command line or standard input.

The --target= command line option allows the compilation
to display a parse tree or abstract syntax tree in lieu of
executing program statements.

=cut

.namespace [ 'TAP' ]

.sub 'main' :main
    .param pmc args
    $P0 = find_global 'TAP', '__onload'
    $P0()
    $P0 = find_global 'TAP::Grammar', '__onload'
    $P0()
#    $P0 = find_global 'TAP::PAST', '__onload'
#    $P0()
#    $P0 = find_global 'TAP::POST', '__onload'
#    $P0()

    load_bytecode 'dumper.pbc'
    load_bytecode 'PGE/Dumper.pbc'
    load_bytecode 'Getopt/Obj.pbc'

    .local pmc getopts, opts
    .local string arg0
    arg0 = shift args
    getopts = new 'Getopt::Obj'
    getopts.'notOptStop'(1)
    push getopts, 'target=s'
    push getopts, 'dump|d'
    push getopts, 'help|h'
    push getopts, 'trace|t'
    opts = getopts.'get_options'(args)

    $S0 = opts['help']
    if $S0 goto usage

    .local string dump
    dump = opts['dump']

    .local string target
    target = opts['target']

    .local int istrace
    $S0 = opts['trace']
    istrace = isne $S0, ''

    .local pmc tap
    tap = compreg 'TAP'

    $I0 = elements args
    if $I0 > 0 goto file_arg

    .local pmc stdin
    stdin = getstdin
    push stdin, 'utf8'
    # enable interactive readline if possible
    $I0 = stdin.'set_readline_interactive'(1)

  stmt_loop:
    .local string stmt
    stmt = stdin.'readline'('TAP> ')
    unless stmt goto end
    bsr tap_eval
    goto stmt_loop

  file_arg:
    .local string filename
    filename = args[1]
    $P0 = open filename, '<'
    unless $P0 goto err_no_file
    push $P0, 'utf8'
    stmt = read $P0, 65535
    close $P0
    bsr tap_eval
    goto end

  tap_eval:
    $I0 = find_charset 'iso-8859-1'
    trans_charset stmt, $I0
    $P0 = tap(stmt, 'target' => target, 'dump' => dump)
    if target == 'PIR' goto dump_pir
    if target goto dump_object
    trace istrace
    $P0()
    trace 0
    ret
  dump_pir:
    print $P0
    ret
  dump_object:
    '_dumper'($P0, target)
    ret

  err_no_file:
    print 'Cannot open file '
    print filename
    print "\n"
    end

  usage:
    print "usage: TAP.pbc [--dump] [--target=OUT] [file]\n"

  end:
.end

=back

=head1 LICENSE

Copyright (C) 2006, The Perl Foundation.

This is free software; you may redistribute it and/or modify
it under the same terms as Parrot.

=cut

## vim: expandtab sw=4
