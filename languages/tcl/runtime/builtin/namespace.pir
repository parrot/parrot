=head2 [namespace]

Parrot has its own namespaces which Tcl is only a part of. So, in the top
level parrot namespace, C<Tcl> refers to the top of the Tcl namespace.

To refer back to something in another parrot namespace, use the special
C<parrot> namespace inside Tcl - this should be an alias back to parrot's
real top level namespace.

=cut

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&namespace'
   .param pmc argv :slurpy

  .local pmc retval

  $I3 = argv
  unless $I3 goto no_args

  .local string subcommand_name
  subcommand_name = shift argv
  .local pmc subcommand_proc
  null subcommand_proc

  .get_from_HLL(subcommand_proc, '_tcl';'helpers';'namespace', subcommand_name)
  if_null subcommand_proc, bad_args
  .return subcommand_proc(argv)

bad_args:
  $S0 = 'bad option "'
  $S0 .= subcommand_name
  $S0 .= '": must be children, code, current, delete, eval, exists, export, forget, import, inscope, origin, parent, qualifiers, tail, or which'
  .throw ($S0)

no_args:
  .throw ('wrong # args: should be "namespace subcommand ?arg ...?"')

.end

.HLL '_Tcl', ''
.namespace [ 'helpers'; 'namespace' ]

# TODO: hey, this is cheating!
.sub 'current'
  .param pmc argv

  .local int argc
  argc = argv
  if argc goto bad_args

  .return('::')

bad_args:
  .throw ('wrong # args: should be "namespace current"')

.end

.sub 'delete'
  .param pmc argv

  .local int argc
  argc = argv
  if argc !=0  goto not_done

  # No arg delete does nothing.
  .return('')

not_done:
  .throw ('XXX')
.end

.sub "exists"
  .param pmc argv

  .local int argc
  argc = argv
  if argc != 1 goto bad_args

  .local pmc p6rule, colons, split, name
  p6rule = compreg "PGE::P6Regex"
  colons = p6rule('\:\:+')
  .get_from_HLL(split, 'parrot'; 'PGE::Util', 'split')
  name = argv[0]

  $P0 = split(colons, name)
  $I0 = elements $P0
  if $I0 == 0 goto relative

  $S0 = $P0[0]
  if $S0 != "" goto relative
  $P1 = pop $P0
  goto get

relative:

get:
  $P0 = get_namespace $P0
  if null $P0 goto doesnt_exist
  .return(1)
  
doesnt_exist:
  .return(0)

bad_args:
  .throw('wrong # args: should be "namespace exists name"' )
.end

.sub 'qualifiers'
  .param pmc argv
  
  .local int argc
  argc = argv
  if argc != 1 goto bad_args

  load_bytecode 'PGE.pbc'
  .local pmc p6r,match
  p6r = compreg 'PGE::P6Regex'
  match = p6r("(.*)\\:\\:+<-[:]>*$$")

  $S0 = argv[0]
  $P0 = match($S0)
  unless $P0 goto WHOLE
  $P1 = $P0[0]
  $S1 = $P1
  .return ($S1)

WHOLE:
  $S0 = argv[0]
  .return($S0)

  bad_args:
  .throw ('wrong # args: should be "namespace qualifiers string"')

.end

.sub 'tail'
  .param pmc argv
  
  .local int argc
  argc = argv
  if argc != 1 goto bad_args

  load_bytecode 'PGE.pbc'
  .local pmc p6r,match
  p6r= compreg 'PGE::P6Regex'
  match = p6r("\\:\\:+(<-[:]>)$$")

  $S0 = argv[0]
  $P0 = match($S0)
  unless $P0 goto WHOLE

  $P2 = $P0[0]
  
  $S1 = $P2
  .return ($S1)

WHOLE:
  $P0 = argv[0]
  .return($P0)

bad_args:
  .throw ('wrong # args: should be "namespace tail string"')

.end

.sub 'eval'
  .param pmc argv
  
  .local int argc
  argc = elements argv
  if argc < 4 goto bad_args

bad_args:
  .throw('wrong # args: should be "namespace eval name arg ?arg...?"')  
.end

.sub 'export'
.end

.sub 'children'
.end

.sub 'code'
.end

.sub 'export'
.end

.sub 'forget'
.end

.sub 'import'
.end

.sub 'inscope'
.end

.sub 'origin'
.end

.sub 'parent'
.end

.sub 'which'
.end
