.sub __init_compiler :load
  loadlib $P0, "match_group"
  .const .Sub $P1 =  "_compile_regex"
  compreg "regex", $P1
.end

.sub _compile_regex
  .param string code

  .local int uniq
  .local string pirfile
  .local string pir_data
  .local string cmdline

  uniq = time
  pirfile = "/tmp/regex-"
  $S0 = uniq
  pirfile = concat $S0
  pirfile = concat ".pir"
  
  cmdline = "regex.pl --sub-name=_regex -o "
  cmdline = concat pirfile
  cmdline = concat " '"
  cmdline = concat code
  cmdline = concat "'"

  $I0 = spawnw cmdline
  unless $I0 goto pir_to_pbc
  print "Failed to compile to .pir file.\n"
#  invoke P1

pir_to_pbc:
  pir_data = _readfile(pirfile)
  $P0 = compreg "PIR"
  $P1 = compile $P0, pir_data

#  $P0 = compreg "FILE"
#  $P1 = $P0(pirfile)
#  $P1 = compile $P0, pirfile

  $P1 = find_global "_regex"
  .return($P1)
.end

.sub _readfile
        .param string filename
        .local pmc file
        .local string result
        .local string buffer
        result = ""
        file = open filename, "<"
loop:   buffer = read file, 65536
        $I0 = length buffer
        le $I0, 0, done
        result = concat buffer
        goto loop
done:   .return(result)
.end
