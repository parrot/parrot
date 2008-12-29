#! perl

# Copyright (C) 2008, The Perl Foundation.
# $Id$

use strict;
use warnings;

print do { local $/; <DATA> };

__END__
#! parrot

# DO NOT EDIT; your changes will be lost.
# This file was generated automatically by tools/dev/pbc_to_exe_gen.pl

=head1 TITLE

pbc_to_exe

=head2 SYNOPSIS

  pbc_to_exe my.pbc
  => my.exe

  pbc_to_exe my.pbc --install
  => installable_my.exe

Warning! With -install there must be no directory prefix in the first arg yet.

=cut

.include 'library/config.pir'

.sub 'main' :main
    .param pmc    argv
    .local string infile
    .local string cfile
    .local string objfile
    .local string exefile
    .local string out

    (infile, cfile, objfile, exefile) = 'handle_args'(argv)
    $I0                               = length infile
    if $I0 goto open_outfile
    die "infile not specified"

  open_outfile:
    .local pmc outfh
    outfh = open cfile, 'w'
    if outfh goto args_handled
    die "infile not specified"

  args_handled:
    .local pmc data
    data = 'generate_data'(infile)
    out  = 'program_code'(data)
    print outfh, out
    close outfh

    'compile_file'(cfile, objfile)
    'link_file'(objfile, exefile)
.end


.sub 'handle_args'
    .param pmc argv

    .local pmc args
    args   = argv

    .local int argc
    argc = args

    if argc == 2 goto proper_args
    if argc == 3 goto check_install
    .return ()

check_install:
    .local string infile, install

    $P0    = shift args
    infile = shift args
    install = shift args
    if install == '--install' goto proper_install
    .return ()

proper_install:
    .local string cfile, objfile, obj, exefile, exe

    $P0    = '_config'()
    obj    = $P0['o']
    exe    = $P0['exe']

    .local int infile_len
    infile_len  = length infile
    infile_len -= 3

    cfile       = substr infile, 0, infile_len
    cfile      .= 'c'

    dec infile_len
    objfile     = substr infile, 0, infile_len
    exefile     = 'installable_'
    exefile    .= objfile
    exefile    .= exe
    objfile    .= obj
    .return(infile, cfile, objfile, exefile)

proper_args:
    .local string infile, cfile, objfile, obj, exefile, exe

    $P0    = '_config'()
    obj    = $P0['o']
    exe    = $P0['exe']

    $P0    = shift args
    infile = shift args

    .local int infile_len
    infile_len  = length infile
    infile_len -= 3

    cfile       = substr infile, 0, infile_len
    cfile      .= 'c'

    dec infile_len
    objfile     = substr infile, 0, infile_len
    objfile    .= obj
    exefile     = substr infile, 0, infile_len
    exefile    .= exe

    # substitute .c for .pbc
    # remove .c for executable

    # TODO this should complain about results/returns mismatch
    .return(infile, cfile, objfile, exefile)
.end


.sub 'generate_data'
    .param string infile

    .local pmc infh
               infh = open infile, 'r'

    if infh goto file_open
    die "cannot open infile"

  file_open:
    # read the file one opcode at a time -- for simplicity. optimize later
    .local int buffer_size
    $P0 = _config()
    buffer_size = $P0['longsize']  # sizeof (opcode_t)

    .local string bytecode
                  bytecode = ''
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
    .local int    bytes_per_line
                  bytes_per_line=64


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
    bytecode .= ','
    size += 1
    $I0 = size % bytes_per_line
    if $I0 != 0 goto loop
    bytecode .= "\n"
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
const Parrot_UInt1 program_code[] = {
@BYTECODE@
};

const int bytecode_size = @SIZE@;

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

END_HEADER
    .return ($S0)
.end


.sub 'body'
    $S0 = <<'END_BODY'
int main(int argc, char *argv[])
{
    PackFile     *pf;
    Parrot_Interp interp;

    Parrot_set_config_hash();

    interp = Parrot_new( NULL );

    if (!interp)
        return 1;

    Parrot_set_executable_name(interp, string_from_cstring(interp, argv[0], 0));
    Parrot_set_flag(interp, PARROT_DESTROY_FLAG);

    pf = PackFile_new(interp, 0);

    if (!PackFile_unpack(interp, pf, (const opcode_t *)program_code, bytecode_size))
        return 1;

    do_sub_pragmas(interp, pf->cur_cs, PBC_PBC, NULL);

    Parrot_loadbc(interp, pf);

    PackFile_fixup_subs(interp, PBC_MAIN, NULL);
    Parrot_runcode(interp, argc, argv);
    Parrot_destroy(interp);
    Parrot_exit(interp, 0);
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
    .param string objfile
    .param int install :optional

    $P0 = '_config'()
    .local string cc, ccflags, cc_o_out, osname, build_dir, slash
    cc        = $P0['cc']
    ccflags   = $P0['ccflags']
    cc_o_out  = $P0['cc_o_out']
    osname    = $P0['osname']
    build_dir = $P0['build_dir']
    slash     = $P0['slash']

    .local string includedir, pathquote
    includedir = concat build_dir, slash
    includedir = concat includedir, 'include'
    pathquote  = ''
    unless osname == 'MSWin32' goto not_windows
    pathquote  = '"'
  not_windows:

    .local string compile
    compile  = cc
    compile .= ' '
    compile .= cc_o_out
    compile .= objfile
    compile .= ' -I'
    compile .= pathquote
    compile .= includedir
    compile .= pathquote
    compile .= ' '
    compile .= ccflags
    compile .= ' -c '
    compile .= cfile

    say compile
    .local int status
    status = spawnw compile
    unless status goto compiled

    die "compilation failed"

  compiled:
    print "Compiled: "
    say objfile
    .return()
.end

.sub 'link_file'
    .param string objfile
    .param string exefile
    .param int install :optional

    $P0 = '_config'()
    .local string cc, ld, link_dynamic, linkflags, ld_out, libparrot, libs, o
    .local string rpath, osname, build_dir, slash, icushared
    cc           = $P0['cc']
    ld           = $P0['ld']
    link_dynamic = $P0['link_dynamic']
    linkflags    = $P0['linkflags']
    ld_out       = $P0['ld_out']
    libparrot    = $P0['libparrot_ldflags']
    libs         = $P0['libs']
    o            = $P0['o']
    rpath        = $P0['rpath_blib']
    osname       = $P0['osname']
    build_dir    = $P0['build_dir']
    slash        = $P0['slash']
    icushared    = $P0['icu_shared']

    .local string config, pathquote, exeprefix
    exeprefix = substr exefile, 0, 12
    config     = concat build_dir, slash
    config    .= 'src'
    config    .= slash
    if exeprefix == 'installable_' goto config_install
    config    .= 'parrot_config'
    goto config_cont
 config_install:
    config    .= 'install_config'
 config_cont:
    config    .= o
    pathquote  = ''
    unless osname == 'MSWin32' goto not_windows
    pathquote  = '"'
  not_windows:

    .local string link
    link  = ld
    link .= ' '
    link .= ld_out
    link .= exefile
    link .= ' '
    link .= pathquote
    link .= objfile
    link .= pathquote
    link .= ' '
    link .= config
    link .= ' '
    link .= rpath
    link .= ' '
    link .= libparrot
    link .= ' '
    link .= link_dynamic
    link .= ' '
    link .= linkflags
    link .= ' '
    link .= libs
    link .= ' '
    link .= icushared

    say link
    .local int status
    status = spawnw link
    unless status goto check_manifest

    die "linking failed"

  check_manifest:
    # Check if there is a MSVC app manifest
    .local pmc file
    file = new 'File'
    .local string manifest_file_name
    manifest_file_name  = exefile
    manifest_file_name .= '.manifest'
    .local pmc manifest_exists
    manifest_exists = file.'exists'( manifest_file_name )
    unless manifest_exists goto linked

  embed_manifest:
    # MSVC app manifest exists, embed it
    .local string embed_manifest
    embed_manifest  = 'mt.exe -nologo -manifest '
    embed_manifest .= manifest_file_name
    embed_manifest .= ' -outputresource:'
    embed_manifest .= exefile
    embed_manifest .= ';1'

    say embed_manifest
    .local int embed_manifest_status
    embed_manifest_status = spawnw embed_manifest
    unless embed_manifest_status goto linked
    die 'manifest embedding failed'

  linked:
    print "Linked: "
    say exefile
    .return()
.end


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
