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

  .local pmc    zm, zc, ini, opt_spec, opts
  .local string file

  opt_spec = new ResizableStringArray
  push opt_spec, "debug"
  $S0 = shift argv	# the program
  load_bytecode "Getopt/Long.pbc"
  .local pmc get_options
  find_global get_options, "Getopt::Long", "get_options"
  opts = get_options(argv, opt_spec)

  load_bytecode "z3main.pir"
  ini = global "zm_init"
  zc = ini()
  file = argv[0]
  zm = zc."instantiate"(file, opts)
  zm."stats"()
  zm."translate"()
.end
