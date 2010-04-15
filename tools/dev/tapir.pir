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
    $S0 = opts['help']
    unless $S0 goto L2
    help()
    end
  L2:
    $S0 = opts['version']
    unless $S0 goto L3
    version()
    end
  L3:
    .tailcall do(opts, argv)
.end

.sub 'version' :anon
    say "Tapir 0.1.0"
.end

.sub 'help' :anon
    say <<"HELP"

Tapir is a TAP test harness, you can use Tapir like this:

        ./tapir t/*.t

Currently supported arguments:
    -v                  Print the output of each test file
    --verbose

    -q
    -quiet

    -Q
    -QUIET

    -normalize

    -a
    --archive=file

    -e
    --exec=program      Use a given program to execute test scripts
                        i.e. ./tapir --exec=perl t/*.t to run Perl tests

    -V
    --version           Print out the current Tapir version

    -h
    --help              This message
HELP
.end

.sub '_parse_opts' :anon
    .param pmc argv
    .local pmc getopts, opts
    load_bytecode 'Getopt/Obj.pbc'
    getopts = new ['Getopt';'Obj']
    getopts.'notOptStop'(1)
    push getopts, 'exec|e:s'
    push getopts, 'archive|a:s'
    push getopts, 'verbose|v'
    push getopts, 'quiet|q'
    push getopts, 'QUIET|Q'
    push getopts, 'normalize'
    push getopts, 'version|V'
    push getopts, 'help|h'
    opts = getopts.'get_options'(argv)
    .return(opts)
.end

.sub 'do' :anon
    .param pmc opts
    .param pmc files
    load_bytecode 'TAP/Harness.pir'
    .local pmc harness, aggregate
    $I0 = exists opts['archive']
    if $I0 goto L1
    harness = new ['TAP';'Harness']
    goto L2
  L1:
    harness = new ['TAP';'Harness';'Archive']
    $S0 = opts['archive']
    harness.'archive'($S0)
  L2:
    harness.'process_args'(opts)
    aggregate = harness.'runtests'(files)
    $I0 = aggregate.'has_errors'()
    exit $I0
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
