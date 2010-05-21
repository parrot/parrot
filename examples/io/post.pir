#!parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

.include 'iglobals.pasm'

.sub 'send_archive_to_smolder' :main
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
    push contents, 'username'
    push contents, 'parrot-autobot'
    push contents, 'password'
    push contents, 'squ@wk'
    push contents, 'comments'
    push contents, "EXPERIMENTAL LWP.pir"
    push contents, 'report_file'
    $P0 = new 'FixedStringArray'
    set $P0, 1
    $P0[0] = 'parrot_test_run.tar.gz'
    push contents, $P0
    load_bytecode 'LWP.pir'
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

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
