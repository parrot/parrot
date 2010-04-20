# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

Tapir

=head1 DESCRIPTION

Tapir is a PIR-based TAP (Test Anything Protocol) Harness

It eats test output (i.e. is a TAP consumer) and tells humans if the
test suite passed, and if not, which kind of pretty colors of smoke
came out. It is mostly equivalent to 'prove' from Perl 5.

=head1 SYNOPSIS

  ./tapir t/*.t

=head2 OPTIONS

Usage:

  tapir [OPTIONS] <files>

=head3 Boolean options

 -v,  --verbose         Print all test lines.
 -s,  --shuffle         Run the tests in random order.
 -f,  --failures        Show failed tests.
 -o,  --comments        Show comments.
      --ignore-exit     Ignore exit status from test scripts.
 -m,  --merge           Merge test scripts' STDERR with their STDOUT.
      --reverse         Run the tests in reverse order.
 -q,  --quiet           Suppress some test output while running tests.
 -Q,  --QUIET           Only print summary results.
      --directives      Only show results with TODO or SKIP directives.
      --normalize       Normalize TAP output in verbose output
 -h,  --help            Display this help
 -V,  --version         Display the version

=head3 Options that take arguments

 -e,  --exec            Interpreter to run the tests ('' for compiled
                        tests.)
 -a,  --archive         Store the resulting TAP in an archive file.

=cut


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

 tapir [options] [files]

Boolean options:

 -v,  --verbose         Print all test lines.
 -s,  --shuffle         Run the tests in random order.
 -f,  --failures        Show failed tests.
 -o,  --comments        Show comments.
      --ignore-exit     Ignore exit status from test scripts.
 -m,  --merge           Merge test scripts' STDERR with their STDOUT.
      --reverse         Run the tests in reverse order.
 -q,  --quiet           Suppress some test output while running tests.
 -Q,  --QUIET           Only print summary results.
      --directives      Only show results with TODO or SKIP directives.
      --normalize       Normalize TAP output in verbose output
 -h,  --help            Display this help
 -V,  --version         Display the version

Options that take arguments:

 -e,  --exec            Interpreter to run the tests ('' for compiled
                        tests.)
 -a,  --archive         Store the resulting TAP in an archive file.
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
    push getopts, 'failures|f'
    push getopts, 'comments|o'
    push getopts, 'directives'
    push getopts, 'ignore-exit'
    push getopts, 'reverse'
    push getopts, 'merge|m'
    push getopts, 'shuffle|s'
    push getopts, 'version|V'
    push getopts, 'help|h'
    opts = getopts.'get_options'(argv)
    .return(opts)
.end

.sub 'do' :anon
    .param pmc opts
    .param pmc files
    load_bytecode 'TAP/Harness.pbc'
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
    $P0 = _get_tests(opts, files)
    aggregate = harness.'runtests'($P0)
    $I0 = aggregate.'has_errors'()
    exit $I0
.end

.sub '_get_tests' :anon
    .param pmc opts
    .param pmc files
    .local int nb
    nb = elements files
    # currently, FixedStringArray hasn't the method sort.
    # see TT #1356
    $P0 = new 'FixedPMCArray'
    set $P0, nb
    $I0 = 0
    $P1 = iter files
  L1:
    unless $P1 goto L2
    $S0 = shift $P1
    $P2 = split "\\", $S0
    $S0 = join "/", $P2
    $P2 = box $S0
    $P0[$I0] = $P2
    inc $I0
    goto L1
  L2:
    $I0 = exists opts['shuffle']
    unless $I0 goto L3
    $P0 = _shuffle($P0)
    goto L4
  L3:
    $P0.'sort'()
    $I0 = exists opts['reverse']
    unless $I0 goto L4
    $P0 = _reverse($P0)
  L4:
    .return ($P0)
.end

.sub '_reverse' :anon
    .param pmc array
    .local int nb
    nb = elements array
    $P0 = new 'FixedPMCArray'
    set $P0, nb
    $I0 = 0
    $I1 = nb - 1
  L1:
    unless $I0 < nb goto L2
    $P1 = array[$I0]
    $P0[$I1] = $P1
    inc $I0
    dec $I1
    goto L1
  L2:
    .return ($P0)
.end

.sub '_shuffle' :anon
    .param pmc array
    load_bytecode 'Math/Rand.pbc'
    .local pmc rand
    rand = get_global [ 'Math'; 'Rand' ], 'rand'
    .local pmc srand
    srand = get_global [ 'Math'; 'Rand' ], 'srand'
    $I0 = time
    srand($I0)
    .local int i, j
    i = elements array
  L1:
    unless i > 0 goto L2
    $I0 = rand()
    j = $I0 % i
    dec i
    $P1 = array[i]
    $P2 = array[j]
    array[i] = $P2
    array[j] = $P1
    goto L1
  L2:
    .return (array)
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
