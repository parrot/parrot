=head1 TITLE

rulec.pir - The PGE rules compiler

=head2 Description

This program takes a set of rules and/or a grammar written
in Perl 6 rules format, and compiles it into the pir code
needed to executes those rules.  This pir code is then suitable
for inclusion or compilation into other larger programs.

=cut

.sub "main" :main
    .param pmc args
    .local string arg0
    .local string filename
    .local string opt
    .local string source
    .local pmc fh
    .local string pir, onload

    load_bytecode "PGE.pbc"
    load_bytecode "PGE/Text.pir"
    load_bytecode "PGE/Util.pir"

    $I0 = args
    if $I0 != 2 goto usage

    arg0 = shift args
    filename = shift args
    fh = open filename, "<"
    unless fh goto err_no_file
    source = read fh, 65535
    close fh

    $P0 = compreg "PGE::P6Grammar"
    (pir, onload) = $P0(source)
    print onload
    print pir
    goto end

  usage:
    print "usage: "
    print arg0
    print " file.pge\n"
    goto end

  err_no_file:
    print arg0
    print ": unable to open "
    print filename
    print "\n"

  end:
.end
