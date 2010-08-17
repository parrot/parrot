# Copyright (C) 2007-2009, Parrot Foundation.
# $Id$

.namespace ['Crow']

.sub 'get_args'
    .param pmc    args

    .local string prog
    prog = shift args

    load_bytecode 'Getopt/Obj.pbc'

    .local pmc getopts
    getopts = new ['Getopt';'Obj']
    getopts.'notOptStop'(1)

    push getopts, 'help|h'
    push getopts, 'type|t=s'

    .local pmc opts
    opts = getopts.'get_options'(args)

    $I0 = exists opts['help']
    if $I0 goto help
    .return (opts)

  help:
    .tailcall 'help'(prog)
.end


.sub 'help'
    .param string prog

    .local pmc data
    data = new 'Hash'
    data['prog'] = prog

    .local string template
    template = <<'END_HELP'
@prog@ -- Make noise about the new Parrot release

  parrot @prog@ [OPTIONS]

  OPTIONS:
    --help     | -h
        display this message

    --type     | -t  TYPE
        select the type of message you want to generate
        there are three valid types: text, html, and bugday

END_HELP

    $S0 = 'process'(template, data)
    print $S0
    end
.end


.sub 'get_news'
    .param string version

    .local pmc newsfile
    .local string buf, news, start

    newsfile = new ['FileHandle']
    newsfile.'open'('NEWS', 'r')

    ## find the start of the news item for this version
    start    = concat 'New in ', version

  before:
    $I0 = newsfile.'eof'()
    if $I0 goto err_news
    buf      = newsfile.'readline'()
    $I0      = index buf, start
    if  $I0 != 0 goto before

  blank:
    buf      = newsfile.'readline'()
    $I0      = index buf, "\n"
    if  $I0 == 0 goto blank
    $I0      = index buf, "\r"
    if  $I0 == 0 goto blank
    news    .= buf

  item:
    buf      = newsfile.'readline'()
    $I0      = index buf, "\n"
    if  $I0 == 0 goto done
    $I0      = index buf, "\r"
    if  $I0 == 0 goto done
    news    .= buf
    goto item

  done:
    .return (news)

  err_news:
    $P0 = new 'Exception'
    $S0 = concat "error: can't find news on version ", version
    $S0 .= " in 'NEWS'\n"
    $P0 = $S0
    throw $P0
.end


.sub 'process'
    .param string template
    .param pmc    data

    .local pmc    it
    it = iter data

    .local string symbol, value

  it_loop:
    unless it goto it_done
    $P0 = shift it
    symbol = 'get_symbol'($P0)
    value  = it[$P0]
      repl_loop:
        $I0 = index template, symbol
        if -1 == $I0 goto repl_done
        $I1 = length symbol
        template = replace template, $I0, $I1, value
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

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
