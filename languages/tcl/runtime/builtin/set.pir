###
# [set]

.HLL 'Tcl', 'tcl_group'
.namespace [ '' ]

.sub "&set"
  .param pmc argv :slurpy

  .local int len, argc  
  argc = argv

  .local pmc retval
 
  if argc == 0 goto error
  if argc > 2 goto error

  .local string name
  name = argv[0] 
  if argc == 2 goto setting
  if argc == 1 goto getting

getting:
  .local pmc read
  .get_from_HLL(read ,'_tcl', '__read')
  .return read(name)

setting:
  .local pmc set
  .get_from_HLL(set ,'_tcl', '__set')

  .local pmc value
  value = argv[1]
  .return set(name,value)

error:
  .throw ("wrong # args: should be \"set varName ?newValue?\"")

.end
