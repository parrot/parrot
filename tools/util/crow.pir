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

    template = 'template'(type)

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
    load_bytecode 'Config/JSON.pir'
    .local pmc reader

    reader = get_global ['Config';'JSON'], 'ReadConfig'

    data = reader('tools/util/release.json')

    # get data from NEWS
    $S0 = data['release.version']
    $S1 = get_news($S0)
    data['NEWS'] = $S1

    .return (data)
.end


.sub 'template'
    .param string type     :optional
    .param int    has_type :opt_flag

## TODO move util funcs to new library
#    load_bytecode 'PMC/Utils.pir'
#    .local pmc exports, curr_namespace, test_namespace
#    curr_namespace = get_namespace
#    test_namespace = get_namespace ['PMC';'Utils']
#    exports = "index://="
#    test_namespace.export_to(curr_namespace, exports)

    # default to email
    'infix://='(type, 'email')

    .local pmc templates
    templates = new .Hash

    ## email
    $S0 = <<'EOT_EMAIL'
On behalf of the Parrot team, I'm proud to announce Parrot @release.version@
"@release.name@." Parrot (@web.root@) is a virtual machine aimed
at running all dynamic languages.

Parrot @release.version@ can be obtained via CPAN (soon), or follow the
download instructions at @web.root@@web.source@.
For those who would like to develop on Parrot, or help develop
Parrot itself, we recommend using Subversion or SVK on the
source code repository to get the latest and best Parrot code.

Parrot @release.version@ News:
@NEWS@

Thanks to all our contributors for making this possible, and our
sponsors for supporting this project.

Enjoy!

EOT_EMAIL
    templates['email'] = $S0

    ## bugday
    $S0 = <<'EOT_BUGDAY'
Bug Day

On @bugday.day@, @bugday.date@, please join us on IRC in #parrot
(irc.perl.org) to work on closing out as many RT (https://rt.perl.org/
rt3/) tickets as possible in the parrot queue. This will help us get
ready for the next release of parrot: @release.version@, scheduled for @release.day@,
@release.date@. You'll find C, parrot assembly, perl, documentation,
and plenty of tasks to go around. Core developers will be available
most of the day (starting at around 10am GMT) to answer questions.

No experience with parrot necessary.

--From: @wiki.root@@wiki.bugday@--
There's a milestone ticket here:

@rt.root@@rt.tracking@

Which contains all the tickets I'd like to see resolved in @version@. If
you just want to view the unresolved tickets, you can use this saved
search:

@rt.saved_search@

If you've got something you're working on that you think you'll be
getting done before the release, please
- add a ticket for it (if necessary);
- add it as a dependency for this ticket

Thanks in advance for your patches and commits. ^_^

... Speaking of patches, we should also get through as many of these
(accept or reject) as possible.

@web.openpatches@
EOT_BUGDAY

    templates['bugday'] = $S0

    ## return template
    $S0 = templates[type]
    .return ($S0)
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
