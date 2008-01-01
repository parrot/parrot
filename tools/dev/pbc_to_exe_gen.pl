#! perl

# Copyright (C) 2008, The Perl Foundation.
# $Id$

use strict;
use warnings;

(my $compile  = shift) =~ s/\\\n/ /gm;

$compile = `$^X tools/dev/cc_flags.pl --return-only $compile`;
$compile =~ s/\s-I\.\S+//g;
my $template = do { local $/; <DATA> };

printf( $template, $compile );

__END__
#! parrot

.include 'library/config.pir'

.sub 'main' :main
    .param pmc    argv
    .local string infile
    .local string cfile
    .local string exefile
    .local string out

    (infile, cfile, exefile) = 'handle_args'(argv)
    $I0                      = length infile
    if $I0 goto open_outfile
    die "infile not specified"

  open_outfile:
    .local pmc outfh
    outfh = open cfile, '>'
    if outfh goto args_handled
    die "infile not specified"

  args_handled:
    .local pmc data
    data = 'generate_data'(infile)
    out  = 'program_code'(data)
    print outfh, out
    close outfh

    compile_file(cfile, exefile)
.end


.sub 'handle_args'
    .param pmc argv

    .local pmc args
    args   = argv

    .local int argc
    argc = args

    if argc == 2 goto proper_args
    .return ()

proper_args:
    .local string infile, cfile, exefile, exe

    $P0    = '_config'()
    exe    = $P0['exe']

    $P0    = shift args
    infile = shift args

    .local int infile_len
    infile_len  = length infile
    infile_len -= 3

    cfile       = substr infile, 0, infile_len
    cfile      .= 'c'

    dec infile_len
    exefile     = substr infile, 0, infile_len
    exefile    .= exe

    # substitute .c for .pbc
    # remove .c for executable

    # TODO this should complain about results/returns mismatch
    .return(infile, cfile, exefile)
.end


.sub 'generate_data'
    .param string infile

    .local pmc infh
               infh = open infile, '<'

    if infh goto file_open
    die "cannot open infile"

  file_open:
    # read the file one opcode at a time -- for simplicity. optimize later
    .local int buffer_size
    $P0 = _config()
    buffer_size = $P0['longsize']  # sizeof (opcode_t)

    .local string bytecode
                  bytecode = '    '
    .local int    size
                  size = 0
    .local pmc    data
                  data = new 'Hash'
    .local pmc    all_bytes
                  all_bytes = new 'ResizablePMCArray'
    .local int    at_eof
    .local int    string_length
    .local string byte_string
    .local int    byte

  loop:
    at_eof = infh.'eof'()
    if at_eof goto end_loop

    # read one byte at a time
    byte_string = read infh, 1
    string_length = length byte_string
    unless string_length goto end_loop

    # convert byte to integer
    byte = ord byte_string
    # convert integer to string
    $S0 = byte
    # add string for the byte
    bytecode .= $S0
    bytecode .= ",\n    "
    size += 1
    goto loop
  end_loop:

    data['BYTECODE'] = bytecode
    data['SIZE']     = size

    .return (data)
.end


.sub 'program_code'
    .param pmc    data
    .local string template, out

    template = 'pc_template'()
    out = 'merge_data'(template, data)

    .return (out)
.end


# template data functions
.sub 'pc_template'
    .local string out

    out = 'header'()

    $S0 = <<'END_PC'
int8_t program_code[] = {
@BYTECODE@
};

int bytecode_size = @SIZE@;

END_PC

    out .= $S0
    $S0  = 'body'()
    out .= $S0

    .return (out)
.end


.sub 'header'
    $S0 = <<'END_HEADER'
#include "parrot/parrot.h"
#include "parrot/embed.h"

#ifdef _MSC_VER
#   define int8_t signed__int8
#endif

END_HEADER
    .return ($S0)
.end


.sub 'body'
    $S0 = <<'END_BODY'
int main(int argc, const char *argv[])
{
    PackFile *pf;
    Parrot_Interp interp;

    Parrot_set_config_hash();

    interp = Parrot_new( NULL );

    if (!interp)
        return 1;

    pf = PackFile_new(interp, 0);

    if (!PackFile_unpack(interp, pf, (opcode_t *)program_code, bytecode_size))
        return 1;

    do_sub_pragmas(interp, pf->cur_cs, PBC_PBC, NULL);

    Parrot_loadbc(interp, pf);

    PackFile_fixup_subs(interp, PBC_MAIN, NULL);
    Parrot_runcode(interp, argc, argv);
    Parrot_destroy(interp);
    Parrot_exit(interp, 0);

    return 0;
}
END_BODY
    .return ($S0)
.end


# template merging functions
.sub 'merge_data'
    .param string template
    .param pmc    data

    .local pmc    iter
    iter = new 'Iterator', data

    .local string symbol, value

  it_loop:
    unless iter goto it_done
    $P0 = shift iter
    symbol = 'get_symbol'($P0)
    value  = iter[$P0]
      repl_loop:
        $I0 = index template, symbol
        if -1 == $I0 goto repl_done
        $I1 = length symbol
        substr template, $I0, $I1, value
        goto repl_loop
      repl_done:
    goto it_loop

  it_done:
    .return (template)
.end


.sub 'get_symbol'
    .param string var
    $S0 = '@'
    $S1 = concat $S0, var
    $S1 = concat $S1, $S0
    .return ($S1)
.end


# util functions
.sub 'compile_file'
    .param string cfile
    .param string exefile

    .local string compile
    compile  = '%s '
    compile .= cfile
    compile .= ' -o '
    compile .= exefile

    .local int status
    status = spawnw compile
    unless status goto compiled

    say compile
    die "compilation failed"

  compiled:
    print "Compiled: "
    say exefile
    .return()
.end

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
