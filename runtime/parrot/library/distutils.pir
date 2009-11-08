# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 NAME

distutils - DistUtils for Parrot

=head2 DESCRIPTION

=head2 EXTERNAL DEPENDENCIES

=over 4

=item prove

Perl5 and core module Test-Harness

=item pod2html

Perl5 and core module Pod-Html

=back

=head2 EXAMPLES

L<http://github.com/fperrad/parrot-MT19937/blob/master/setup.pir>

=cut

.sub '__onload' :load :init :anon
    $P0 = new 'Hash'
    set_global '%step', $P0
    .const 'Sub' build_pbc_pir = 'build_pbc_pir'
    register_step('build', build_pbc_pir)
    .const 'Sub' build_html_pod = 'build_html_pod'
    register_step_after('build', build_html_pod)
    .const 'Sub' clean_pbc_pir = 'clean_pbc_pir'
    register_step('clean', clean_pbc_pir)
    .const 'Sub' clean_html_pod = 'clean_html_pod'
    register_step_after('clean', clean_html_pod)
    .const 'Sub' install = 'install'
    register_step('install', install)
    .const 'Sub' test = 'test'
    register_step('test', test)
    .const 'Sub' uninstall = 'uninstall'
    register_step('uninstall', uninstall)
    .const 'Sub' usage = 'usage'
    register_step('usage', usage)
.end

=head3 Functions

=over 4

=item setup

Entry point.

=cut

.sub 'setup'
    .param pmc args :slurpy
    .param pmc kv :slurpy :named
    .local string cmd
    cmd = 'build'
    $I0 = args
    unless $I0 != 0 goto L1
    cmd = shift args
  L1:
    $I0 = run_step(cmd, kv :flat :named)
    if $I0 goto L2
    run_step('usage')
  L2:
.end

=item run_step

Call a step by its name.

=cut

.sub 'run_step'
    .param string name
    .param pmc kv :slurpy :named
    $P0 = get_global '%step'
    $I0 = exists $P0[name]
    if $I0 goto L1
    .return (0)
  L1:
    $P1 = $P0[name]
    $P2 = iter $P1
  L2:
    unless $P2 goto L3
    $P3 = shift $P2
    $P3(kv :flat :named)
    goto L2
  L3:
    .return (1)
.end

=item register_step

Register a step by its name

=cut

.sub 'register_step'
    .param string name
    .param pmc step
    $P0 = get_global '%step'
    $P1 = new 'ResizablePMCArray'
    unshift $P1, step
    $P0[name] = $P1
.end

=item register_step_after

Append a step

=cut

.sub 'register_step_after'
    .param string name
    .param pmc step
    $P0 = get_global '%step'
    $P1 = $P0[name]
    push $P1, step
.end

=item register_step_before

Insert a step

=cut

.sub 'register_step_before'
    .param string name
    .param pmc step
    $P0 = get_global '%step'
    $P1 = $P0[name]
    unshift $P1, step
.end

=back

=head3 Step usage

Display a helpful message

=over 4

=item usage

Overload the default message

=back

=cut

.sub 'usage'
    .param pmc kv :slurpy :named
    .local string msg
    msg = <<'USAGE'
    Default targets are :

        build:          Build the library.

        test:           Run the test suite.

        install:        Install the library.

        uninstall:      Uninstall the library.

        clean:          Basic cleaning up.

        help:           Print this help message.
USAGE
    $I0 = exists kv['usage']
    unless $I0 goto L1
    msg = kv['usage']
  L1:
    say msg
.end

=head3 Step build

=over 4

=item pbc_pir

hash

the key is the PBC pathname

the value is an array of pathname

the first item is the PIR source

the others items are just the dependencies

=cut

.sub 'build_pbc_pir'
    .param pmc kv :slurpy :named
    $I0 = exists kv['pbc_pir']
    unless $I0 goto L1
    $P0 = kv['pbc_pir']
    _build_pbc_pir($P0)
  L1:
.end

.sub '_build_pbc_pir' :anon
    .param pmc hash
    $P0 = iter hash
  L1:
    unless $P0 goto L2
    .local string pbc
    pbc = shift $P0
    .local pmc depends
    depends = $P0[pbc]
    $I0 = newer(pbc, depends)
    if $I0 goto L1
    .local string src
    src = shift depends
    .local string cmd
    cmd = get_parrot()
    cmd .= " -o "
    cmd .= pbc
    cmd .= " "
    cmd .= src
    system(cmd)
    goto L1
  L2:
.end

=item html_pod

hash

the key is the HTML pathname

the value is the POD pathname

=cut

.sub 'build_html_pod'
    .param pmc kv :slurpy :named
    $I0 = exists kv['html_pod']
    unless $I0 goto L1
    $P0 = kv['html_pod']
    _build_html_pod($P0)
  L1:
.end

.sub '_build_html_pod' :anon
    .param pmc hash
    $P0 = iter hash
  L1:
    unless $P0 goto L2
    .local string html, pod
    html = shift $P0
    pod = $P0[html]
    $I0 = newer(html, pod)
    if $I0 goto L1
    .local string cmd
    cmd = "pod2html --infile "
    cmd .= pod
    cmd .= " --outfile "
    cmd .= html
    system(cmd)
    unlink("pod2htmd.tmp")
    unlink("pod2htmi.tmp")
    goto L1
  L2:
.end

=back

=head3 Step clean

=over 4

=item pbc_pir

=cut

.sub 'clean_pbc_pir'
    .param pmc kv :slurpy :named
    $I0 = exists kv['pbc_pir']
    unless $I0 goto L1
    $P0 = kv['pbc_pir']
    _clean_key($P0)
  L1:
.end

=item html_pod

=cut

.sub 'clean_html_pod'
    .param pmc kv :slurpy :named
    $I0 = exists kv['html_pod']
    unless $I0 goto L1
    $P0 = kv['html_pod']
    _clean_key($P0)
  L1:
.end

.sub '_clean_key' :anon
    .param pmc hash
    $P0 = iter hash
  L1:
     unless $P0 goto L2
     $S0 = shift $P0
     unlink($S0)
     goto L1
  L2:
.end

=back

=head3 Step test

=over 4

=item prove_exec

option --exec of prove

=item prove_files

the default value is "t/*.t"

=back

=cut

.sub 'test'
    .param pmc kv :slurpy :named
    run_step('build', kv :flat :named)
    .local string cmd
    cmd = "prove"
    $I0 = exists kv['prove_exec']
    unless $I0 goto L1
    cmd .= " --exec="
    $S0 = kv['prove_exec']
    cmd .= $S0
  L1:
    cmd .= " "
    $S0 = "t/*.t" # default
    $I0 = exists kv['prove_files']
    unless $I0 goto L2
    $S0 = kv['prove_files']
  L2:
    cmd .= $S0
    system(cmd)
.end

=head3 Step install

=over 4

=item inst_bin

array of pathname

=item inst_dynext

array of pathname

=item inst_inc

array of pathname

=item inst_lang

array of pathname

=item inst_lib

array of pathname

=back

=cut

.sub 'install'
    .param pmc kv :slurpy :named
    $I0 = exists kv['inst_bin']
    unless $I0 goto L1
    $P0 = kv['inst_bin']
    _install_bin($P0)
  L1:
    $I0 = exists kv['inst_dynext']
    unless $I0 goto L2
    $P0 = kv['inst_dynext']
    _install_lib("dynext", $P0)
  L2:
    $I0 = exists kv['inst_inc']
    unless $I0 goto L3
    $P0 = kv['inst_inc']
    _install_lib("include", $P0)
  L3:
    $I0 = exists kv['inst_lang']
    unless $I0 goto L4
    $P0 = kv['inst_lang']
    _install_lib("languages", $P0)
  L4:
    $I0 = exists kv['inst_lib']
    unless $I0 goto L5
    $P0 = kv['inst_lib']
    _install_lib("library", $P0)
  L5:
.end

.sub '_install_bin' :anon
    .param pmc array
    $S1 = get_bindir()
    $S1 .= "/"
    $P0 = iter array
  L1:
    unless $P0 goto L2
    $S0 = shift $P0
    $S2 = $S1 . $S0
    cp($S0, $S2)
    goto L1
  L2:
.end

.sub '_install_lib' :anon
    .param string dirname
    .param pmc array
    $S1 = get_libdir()
    $S1 .= "/"
    $S1 .= dirname
    $S1 .= "/"
    $P0 = iter array
  L1:
    unless $P0 goto L2
    $S0 = shift $P0
    $S2 = $S1 . $S0
    cp($S0, $S2)
    goto L1
  L2:
.end

=head3 Step uninstall

Same options as install.

=cut

.sub 'uninstall'
    .param pmc kv :slurpy :named
    $I0 = exists kv['inst_bin']
    unless $I0 goto L1
    $P0 = kv['inst_bin']
    _uninstall_bin($P0)
  L1:
    $I0 = exists kv['inst_dynext']
    unless $I0 goto L2
    $P0 = kv['inst_dynext']
    _uninstall_lib("dynext", $P0)
  L2:
    $I0 = exists kv['inst_inc']
    unless $I0 goto L3
    $P0 = kv['inst_inc']
    _uninstall_lib("include", $P0)
  L3:
    $I0 = exists kv['inst_lang']
    unless $I0 goto L4
    $P0 = kv['inst_lang']
    _uninstall_lib("languages", $P0)
  L4:
    $I0 = exists kv['inst_lib']
    unless $I0 goto L5
    $P0 = kv['inst_lib']
    _uninstall_lib("library", $P0)
  L5:
.end

.sub '_uninstall_bin' :anon
    .param pmc array
    $S1 = get_bindir()
    $S1 .= "/"
    $P0 = iter array
  L1:
    unless $P0 goto L2
    $S0 = shift $P0
    $S2 = $S1 . $S0
    unlink($S2)
    goto L1
  L2:
.end

.sub '_uninstall_lib' :anon
    .param string dirname
    .param pmc array
    $S1 = get_libdir()
    $S1 .= "/"
    $S1 .= dirname
    $S1 .= "/"
    $P0 = iter array
  L1:
    unless $P0 goto L2
    $S0 = shift $P0
    $S2 = $S1 . $S0
    unlink($S2)
    goto L1
  L2:
.end

=head3 Configuration Helpers

=over 4

=item get_config

Return the whole config

=cut

.include 'iglobals.pasm'

.sub 'get_config'
    $P0 = getinterp
    $P1 = $P0[.IGLOBALS_CONFIG_HASH]
    .return ($P1)
.end

=item get_bindir

=cut

.sub 'get_bindir'
    $P0 = get_config()
    $S0 = $P0['bindir']
    .return ($S0)
.end

=item get_libdir

=cut

.sub 'get_libdir'
    $P0 = get_config()
    $S0 = $P0['libdir']
    $S1 = $P0['versiondir']
    $S0 .= $S1
    .return ($S0)
.end

=item get_parrot

=cut

.sub 'get_parrot'
    $P0 = get_config()
    $S0 = $P0['bindir']
    $S0 .= '/parrot'
    $S1 = $P0['exe']
    $S0 .= $S1
    .return ($S0)
.end

=back

=head3 OS Utilities

=over 4

=item system

=cut

.sub 'system'
    .param string cmd
    say cmd
    $I0 = spawnw cmd
.end

.include 'stat.pasm'

.sub 'file_exists'
    .param string filename
    $I0 = stat filename, .STAT_EXISTS
    .return ($I0)
.end

=item newer

=cut

.sub 'newer' :multi(string, pmc)
    .param string target
    .param pmc depends
    $I0 = stat target, .STAT_EXISTS
    if $I0 goto L1
    .return (0)
  L1:
    $I0 = stat target, .STAT_MODIFYTIME
    $P0 = iter depends
  L2:
    unless $P0 goto L3
    $S0 = shift $P0
    $I1 = stat $S0, .STAT_MODIFYTIME
    if $I1 < $I0 goto L2
    .return (0)
  L3:
    .return (1)
.end

.sub 'newer' :multi(string, string)
    .param string target
    .param string depend
    $I0 = stat target, .STAT_EXISTS
    if $I0 goto L1
    .return (0)
  L1:
    $I1 = stat target, .STAT_MODIFYTIME
    $I2 = stat depend, .STAT_MODIFYTIME
    $I0 = $I1 > $I2
    .return ($I0)
.end

=item mkpath

=cut

.sub 'mkpath'
    .param string pathname
    $I1 = 1
  L1:
    $I1 = index pathname, '/', $I1
    if $I1 < 0 goto L2
    $S0 = substr pathname, 0, $I1
    inc $I1
    $I0 = stat $S0, .STAT_EXISTS
    if $I0 goto L1
    mkdir($S0)
    goto L1
  L2:
    $I0 = stat pathname, .STAT_EXISTS
    if $I0 goto L3
    mkdir(pathname)
  L3:
.end

=item mkdir

=cut

.sub 'mkdir'
    .param string dirname
    print "mkdir "
    say dirname
    $P0 = new 'OS'
    $I1 = 0o775
    $P0.'mkdir'(dirname, $I1)
.end

=item cp

=cut

.sub 'cp'
    .param string src
    .param string dst
    $I1 = 1
  L1:
    $I1 = index dst, '/', $I1
    if $I1 < 0 goto L2
    $S0 = substr dst, 0, $I1
    inc $I1
    $I0 = stat $S0, .STAT_EXISTS
    if $I0 goto L1
    mkdir($S0)
    goto L1
  L2:
    $I0 = newer(dst, src)
    if $I0 goto L3
    print "cp "
    print src
    print " "
    say dst
    $P0 = new 'FileHandle'
    $S0 = $P0.'readall'(src)
    $P0.'open'(dst, 'w')
    $P0.'puts'($S0)
    $P0.'close'()
  L3:
.end

=item unlink

=cut

.sub 'unlink'
    .param string filename
    $I0 = stat filename, .STAT_EXISTS
    if $I0 goto L1
    .return ()
  L1:
    print "unlink "
    say filename
    new $P0, 'OS'
    push_eh _handler
    $P0.'rm'(filename)
    pop_eh
  _handler:
    .return ()
.end

=back

=head2 SEE ALSO

See: L<http://docs.python.org/distutils/>

=head1 AUTHOR

Francois Perrad

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
