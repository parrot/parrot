# $Id$

=head1 NAME

z3.pir - z3 bytecode compiler

=head1 DESCRIPTION

Compile z3 to PIR and run it.

=head1 TODO 

=over 4

=item clear attributes to PMCNULL

=item fix missing attribute err mess

=item implement super()

=item clarify attribute inheritance

=back

=cut

.sub main :main
  .param pmc argv

  load_bytecode "Getopt/Obj.pbc"

  .local pmc    zm, zc, ini, opt_spec, opts
  .local string file

  # Specification of command line arguments.
  .local pmc getopts
  getopts = new "Getopt::Obj"
  push getopts, "debug"

  $S0 = shift argv	# the program
  .local pmc opt
  opt = getopts."get_options"(argv)

  load_bytecode "z3main.pir"
  ini = global "zm_init"
  zc = ini()
  file = argv[0]
  zm = zc."instantiate"(file, opts)
  zm."stats"()
  zm."translate"()
.end
