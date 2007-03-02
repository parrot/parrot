#! ./parrot
# Copyright (C) 2007, The Perl Foundation.
# $Id$

=head1 TITLE

crow.pir -- Make noise about the new Parrot release

=head1 DESCRIPTION

This utility is used to help Release Managers format announcement messages.
It uses a *very* simple and fast templating system, described in the related
module, L<runtime/parrot/library/Crow.pir>.

=head1 SYNOPSIS

  # see
  % parrot tools/util/crow.pir --help

=cut


.include 'hllmacros.pir'


.sub 'main' :main
    .param pmc    args

load_bytecode 'dumper.pir'
.local pmc dumper
dumper = find_global '_dumper'
#dumper(args)

    load_bytecode 'Crow.pir' # TODO s/pbc/pir/

    .local pmc _
    .IMPORT( ['Crow'], 'get_args', _ )
    .IMPORT( ['Crow'], 'get_news', _ )
    .IMPORT( ['Crow'], 'process', _ )

    .local pmc opts
    opts = get_args(args)

    unless null opts goto got_opts
    opts = new .Hash
  got_opts:

#dumper(opts)

    .local string template
    template = 'template'('email')

    .local pmc data
    data = 'my_data'(opts)

    $S1 = process(template, data)
    print $S1
.end


.sub 'my_data'
    .param pmc indata     :optional
    .param int has_indata :opt_flag

    .local pmc data

    if has_indata goto init
    data = new .Hash
    goto assign
  init:
    data = indata

  assign:
    $P0 = data['version']
    'infix://='($P0, '0.4.9')

trace 1
    $P0 = data['name']
    'infix://='($P0, 'Socorro')
trace 0

    $P0 = data['web.root']
    'infix://='($P0, 'http://parrotcode.org')

    $P0 = data['web.source']
    'infix://='($P0, 'http://parrotcode.org/source')

    $P0 = data['date']
    'infix://='($P0, '22 February 2007')

    $P0 = data['nextdate']
    'infix://='($P0, 'xx March 2007')

    # get data from NEWS
    $S0 = data['version']
    $S1 = get_news($S0)
    data['NEWS'] = $S1

    .return (data)
.end


.sub 'infix://='
    .param pmc    a
    .param pmc    b

    $I0 = defined a
    if $I0 goto OP_end
    a = new .Undef
    assign a, b

  OP_end:
.end


.sub 'template'
    .param string type     :optional
    .param int    has_type :opt_flag

# TODO process the type arg

    $S0 = <<'EOT'
On behalf of the Parrot team, I'm proud to announce Parrot @version@
"@name@." Parrot (@web.root@) is a virtual machine aimed
at running all dynamic languages.

Parrot @version@ can be obtained via CPAN (soon), or follow the
download instructions at @web.source@.
For those who would like to develop on Parrot, or help develop
Parrot itself, we recommend using Subversion or SVK on the
source code repository to get the latest and best Parrot code.

Parrot @version@ News:
@NEWS@

Thanks to all our contributors for making this possible, and our
sponsors for supporting this project.

Enjoy!

EOT
    .return ($S0)
.end

