#!parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

.sub 'main' :main
    .param pmc argv
    $S0  = shift argv
    .local int argc
    argc = elements argv
    if argc > 0 goto L1
    help()
    end
  L1:
    .local pmc opts
    opts = _parse_opts(argv)
    $I0 = exists opts['help']
    unless $I0 goto L2
    help()
    end
  L2:
    .tailcall do(opts, argv)
.end

.sub 'help' :anon
    say <<"HELP"
parrot t/harness.pir [options] [testfiles]
    --core-tests
    --runcore-tests
    --code-tests
    --archive  ... create a TAP archive of the test run
    --send-to-smolder ... send the TAP archive to the Parrot Smolder server
HELP
.end

.sub '_parse_opts' :anon
    .param pmc argv
    load_bytecode 'Getopt/Obj.pbc'
    $P0 = new ['Getopt';'Obj']
    $P0.'notOptStop'(1)
    push $P0, 'gc-debug'
    push $P0, 'core-tests'
    push $P0, 'runcore-tests'
    push $P0, 'code-tests'
    push $P0, 'run-exec'
    push $P0, 'archive'
    push $P0, 'send-to-smolder'
    push $P0, 'help|h'
    $P1 = $P0.'get_options'(argv)
    .return ($P1)
.end

.sub 'do' :anon
    .param pmc opts
    .param pmc files
    set_test_prog_args(opts)
    load_bytecode 'TAP/Harness.pbc'
    .local pmc options, env, harness, aggregate
    options = new 'Hash'
    env = new 'Env'
    $I0 = exists env['HARNESS_VERBOSE']
    unless $I0 goto L1
    $S0 = env['HARNESS_VERBOSE']
    options['verbosity'] = $S0
  L1:
    $I0 = exists opts['archive']
    if $I0 goto L2
    harness = new ['TAP';'Harness']
    options['directives'] = 1
    goto L3
  L2:
    harness = new ['TAP';'Harness';'Archive']
    harness.'archive'('parrot_test_run.tar.gz')
    options['merge'] = 1
    .local pmc env_data
    env_data = collect_test_environment_data()
    harness.'extra_props'(env_data)
    $P0 = split ' ', 'myconfig config_lib.pir'
    harness.'extra_files'($P0)
  L3:
    harness.'process_args'(options)
    $P0 = _get_tests(opts, files)
    aggregate = harness.'runtests'($P0)
    $I0 = exists opts['send-to-smolder']
    unless $I0 goto L4
    .tailcall send_archive_to_smolder(env_data)
  L4:
    $I0 = aggregate.'all_passed'()
    $I0 = not $I0
    exit $I0
.end

.sub 'set_test_prog_args' :anon
    .param pmc opts
    $S0 = ''
    $I0 = exists opts['gc-debug']
    unless $I0 goto L1
    $S0 .= ' --gc-debug'
  L1:
    $I0 = exists opts['run-exec']
    unless $I0 goto L2
    $S0 .= ' --run-exec'
  L2:
    $S0 = substr $S0, 1
    $P0 = new 'Env'
    $P0['TEST_PROG_ARGS'] = $S0
.end

.sub '_get_tests' :anon
    .param pmc opts
    .param pmc files
    .local int nb
    $I0 = opts['code-tests']
    unless $I0 goto L1
    .const string developing_tests = 't/distro/file_metadata.t t/codingstd/*.t'
    files = glob(developing_tests)
    goto L2
  L1:
    nb = elements files
    unless nb == 0 goto L2
    files = _get_common_tests(opts)
  L2:
    nb = elements files
    # currently, FixedStringArray hasn't the method sort.
    # see TT #1356
    $P0 = new 'FixedPMCArray'
    set $P0, nb
    $I0 = 0
    $P1 = iter files
  L3:
    unless $P1 goto L4
    $S0 = shift $P1
    $P2 = split "\\", $S0
    $S0 = join "/", $P2
    $P2 = box $S0
    $P0[$I0] = $P2
    inc $I0
    goto L3
  L4:
    $P0.'sort'()
    .return ($P0)
.end

.sub '_get_common_tests' :anon
    .param pmc opts
    .const string runcore_tests = <<'TEST'
t/compilers/imcc/*/*.t
t/op/*.t
t/pmc/*.t
t/oo/*.t
t/native_pbc/*.t
t/dynpmc/*.t
t/dynoplibs/*.t
TEST
    .const string core_tests = <<'TEST'
t/src/*.t
t/run/*.t
t/perl/*.t
TEST
    .const string library_tests = <<'TEST'
t/compilers/pct/*.t
t/compilers/pge/*.t
t/compilers/pge/p5regex/*.t
t/compilers/pge/perl6regex/*.t
t/compilers/tge/*.t
t/library/*.t
t/tools/*.t
t/profiling/*.t
TEST
    .const string configure_tests = <<'TEST'
t/configure/*.t
t/steps/*.t
t/postconfigure/*.t
TEST
    $S0 = runcore_tests
    $I0 = exists opts['runcore-tests']
    if $I0 goto L1
    $S0 .= core_tests
    $I0 = exists opts['core-tests']
    if $I0 goto L1
    $S0 .= library_tests
    $S0 .= configure_tests
  L1:
    $P0 = split "\n", $S0
    $S0 = join ' ', $P0
    $P0 = glob($S0)
    .return ($P0)
.end

.include 'iglobals.pasm'

.sub 'collect_test_environment_data' :anon
    .local pmc config, env
    $P0 = getinterp
    config = $P0[.IGLOBALS_CONFIG_HASH]
    env = new 'Env'
    $P0 = new 'Hash'
    .local string arch
    arch = config['cpuarch']
    $P0['Architecture'] = arch
    $S0 = _get_compiler_version(config)
    $P0['Compiler'] = $S0
    .local string devel
    devel = config['DEVEL']
    $P0['DEVEL'] = devel
    .local string optimize
    optimize = 'none'
    $I0 = exists config['optimize']
    unless $I0 goto L1
    optimize = config['optimize']
  L1:
    $P0['Optimize'] = optimize
    .local string osname
    osname = config['osname']
    $P0['Platform'] = osname
    .local string version
    version = config['VERSION']
    $P0['Version'] = version
    .local string submitter
    submitter = _get_submitter(config, env)
    $P0['Submitter'] = submitter
    _add_subversion_info($P0)
    .return ($P0)
.end

.sub '_get_compiler_version' :anon
    .param pmc config
    $S0 = config['cc']
    $I0 = index $S0, 'gcc'
    unless $I0 >= 0 goto L1
    $I0 = exists config['gccversion']
    unless $I0 goto L1
    $S0 .= ' '
    $S1 = config['gccversion']
    $S0 .= $S1
    .return ($S0)
  L1:
    $I0 = index $S0, 'cl'
    unless $I0 >= 0 goto L2
    $I0 = exists config['msvcversion']
    unless $I0 goto L2
    $S0 .= ' '
    $S1 = config['msvcversion']
    $S0 .= $S1
    .return ($S0)
  L2:
    $I0 = exists config['gccversion']
    unless $I0 goto L3
    $S0 .= ' (gcc '
    $S1 = config['gccversion']
    $S0 .= $S1
    $S0 .= ')'
    .return ($S0)
  L3:
    $I0 = exists config['msvcversion']
    unless $I0 goto L4
    $S0 .= ' (msvc '
    $S1 = config['msvcversion']
    $S0 .= $S1
    $S0 .= ')'
    .return ($S0)
  L4:
    .return ($S0)
.end

.sub '_get_submitter' :anon
    .param pmc config
    .param pmc env
    $I0 = exists env['SMOLDER_SUBMITTER']
    unless $I0 goto L1
    $S0 = env['SMOLDER_SUBMITTER']
    .return ($S0)
  L1:
    .local string me
    $I0 = exists config['win32']
    unless $I0 goto L2
    me = env['USERNAME']
    goto L3
  L2:
    me = env['LOGNAME']
  L3:
    $S0 = me . '@unknown'
    .return ($S0)
.end

.include 'cclass.pasm'

.sub '_add_subversion_info' :anon
    .param pmc hash
    $I0 = file_exists('.svn')
    unless $I0 goto L1
    $P0 = new 'FileHandle'
    $P0.'open'('svn info', 'pr')
    $S0 = $P0.'readall'()
    $P0.'close'()
    $I0 = length $S0
    $S1 = 'trunk'
    $I1 = index $S0, '/branches/'
    unless $I1 >= 0 goto L2
    $I1 += 10
    $I2 = find_cclass .CCLASS_WHITESPACE, $S0, $I1, $I0
    $I3 = $I2 - $I1
    $S1 = substr $S0, $I1, $I3
  L2:
    hash['Branch'] = $S1
    $P0.'open'('svn status', 'pr')
    $P1 = new 'ResizableStringArray'
  L3:
    $S0 = $P0.'readline'()
    if $S0 == '' goto L4
    $I0 = index $S0, 'M'
    unless $I0 == 0 goto L3
    $S0 = chomp($S0)
    $I0 = length $S0
    $I0 = find_not_cclass .CCLASS_WHITESPACE, $S0, 2, $I0
    $S0 = substr $S0, $I0
    push $P1, $S0
    goto L3
  L4:
    $P0.'close'()
    $I0 = elements $P1
    unless $I0 != 0 goto L1
    $S0 = hash['DEVEL']
    $S0 .= ' '
    $S1 = $I0
    $S0 .= $S1
    $S0 .= ' mods'
    hash['DEVEL'] = $S0
    $S0 = join ' ', $P1
    hash['Modifications'] = $S0
  L1:
    .return (hash)
.end

.sub 'send_archive_to_smolder' :anon
    .param pmc env_data
    .local pmc config
    $P0 = getinterp
    config = $P0[.IGLOBALS_CONFIG_HASH]
    .local pmc contents
    contents = new 'ResizablePMCArray' # by couple
    push contents, 'architecture'
    $S0 = config['cpuarch']
    push contents, $S0
    push contents, 'platform'
    $S0 = config['osname']
    push contents, $S0
    push contents, 'revision'
    $S0 = config['revision']
    push contents, $S0
    push contents, 'tags'
    $S0 = _get_tags(env_data)
    push contents, $S0
    push contents, 'username'
    push contents, 'parrot-autobot'
    push contents, 'password'
    push contents, 'squ@wk'
    push contents, 'comments'
    push contents, "EXPERIMENTAL t/harness.pir with LWP.pir"
    push contents, 'report_file'
    $P0 = new 'FixedStringArray'
    set $P0, 1
    $P0[0] = 'parrot_test_run.tar.gz'
    push contents, $P0
    load_bytecode 'LWP/UserAgent.pir'
    .const string url = 'http://smolder.plusthree.com/app/projects/process_add_report/8'
    .local pmc ua, response
    ua = new ['LWP';'UserAgent']
    ua.'env_proxy'()
    ua.'show_progress'(1)
    response = ua.'post'(url, contents :flat, 'form-data' :named('Content-Type'), 'close' :named('Connection'))
    $I0 = response.'code'()
    unless $I0 == 302 goto L1
    $S0 = response.'content'()
    say $S0
  L1:
.end

.sub '_get_tags' :anon
    .param pmc env_data
    $P0 = split ' ', 'Architecture Compiler Platform Version'
    $P1 = new 'ResizableStringArray'
  L1:
    unless $P0 goto L2
    $S0 = shift $P0
    $S1 = env_data[$S0]
    push $P1, $S1
    goto L1
  L2:
    $S0 = join ', ', $P1
    .return ($S0)
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
