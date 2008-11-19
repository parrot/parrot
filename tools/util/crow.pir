#! ./parrot
# Copyright (C) 2007-2008, The Perl Foundation.
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


.sub 'main' :main
    .param pmc    args

    load_bytecode 'Crow.pir' # TODO s/pir/pbc/

    .local pmc exports, curr_namespace, test_namespace
    curr_namespace = get_namespace
    test_namespace = get_namespace ['Crow']
    exports = split ' ', 'get_news get_args process'
    test_namespace.'export_to'(curr_namespace, exports)

    .local pmc opts
    opts = get_args(args)

    unless null opts goto got_opts
    opts = new 'Hash'
  got_opts:

    .local pmc templates
    templates = 'get_json'('tools/util/templates.json')

    .local string template, type
    type = opts['type']
    'infix://='(type, 'text')

    template = 'get_template'(templates, type)

    .local pmc data
    data = 'get_json'('tools/util/release.json')

    .local string version
    version = data['release.version']

    $S0 = concat type, '.news'
    $I0 = templates[$S0]
    if $I0 goto get_news
    data['NEWS'] = ''
    goto process
  get_news:
    $S0 = 'get_news'(version)
    data['NEWS'] = $S0


  process:
    .local string result
    result = process(template, data)
    say result
.end


.sub 'get_json'
    .param string filename

    load_bytecode 'Config/JSON.pir'

     .local pmc exports, curr_namespace, test_namespace
    curr_namespace = get_namespace
    test_namespace = get_namespace [ 'Config';'JSON' ]
    exports = split ' ', 'ReadConfig'
    test_namespace.'export_to'(curr_namespace, exports)

    .local pmc result
    result = ReadConfig(filename)

    .return (result)
.end


.sub 'get_template'
    .param pmc templates
    .param string type

    $S0 = concat type, '.text'
    $S1 = templates[$S0]
    .return ($S1)
.end


.sub 'infix://='
    .param pmc    a
    .param pmc    b

    if null a goto agg_undefined
    $I0 = defined a
    if $I0 goto return
    assign a, b

  return:
    .return ()

  agg_undefined:
    $P0 = new 'Exception'
    $P0 = "cannot assign to Null PMC!"
    throw $P0
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
