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


.sub 'main' :main
    .param pmc    args

    load_bytecode 'Crow.pir' # TODO s/pir/pbc/

    .local pmc exports, curr_namespace, test_namespace
    curr_namespace = get_namespace
    test_namespace = get_namespace [ 'Crow' ]
    exports = split " ", "get_args get_news process"
    test_namespace.export_to(curr_namespace, exports)

    .local pmc opts
    opts = get_args(args)

    unless null opts goto got_opts
    opts = new .Hash
  got_opts:

    .local string template, type
    type = opts['type']
    'infix://='(type, 'email')

    template = 'get_template'(type)

    .local pmc data
    data = 'get_data'()

    $S1 = process(template, data)
    print $S1
.end


.sub 'get_data'
    load_bytecode 'Config/JSON.pir'
    .local pmc reader
    reader = get_global ['Config';'JSON'], 'ReadConfig'

    .local pmc data
    data = reader('tools/util/release.json')

    # get data from NEWS
    $S0 = data['release.version']
    $S1 = get_news($S0)
    data['NEWS'] = $S1

    .return (data)
.end


.sub 'get_template'
    .param string type

    load_bytecode 'Config/JSON.pir'
    .local pmc reader
    reader = get_global ['Config';'JSON'], 'ReadConfig'

    .local pmc templates
    templates = reader('tools/util/templates.json')

    ## return template
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
    $P0 = new .Exception
    $P0['_message'] = "cannot assign to Null PMC!"
    throw $P0
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
