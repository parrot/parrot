.namespace ['Crow']

.sub 'get_args'
    .param pmc    args

    .local string prog
    prog = shift args

    load_bytecode 'Getopt/Obj.pbc'

    .local pmc getopts
    getopts = new 'Getopt::Obj'
    getopts.'notOptStop'(1)

    getopts = push 'date|D=s'
    getopts = push 'help|h'
    getopts = push 'name|n=s'
    getopts = push 'nextdate|N=s'
    getopts = push 'version|v=s'

    .local pmc opts
    opts = getopts.'get_options'(args)

    $I0 = exists opts['help']
    if $I0 goto help
    .return (opts)

  help:
    .return 'help'(prog)
.end


.sub 'help'
    .param string prog

    .local pmc data
    data = new .Hash
    data['prog'] = prog

    .local string template
    template = <<'END_HELP'
@prog@ -- Make noise about the new Parrot release

  parrot @prog@ [OPTIONS]

  OPTIONS:
    --date     | -D DATE
        set the release date

    --help     | -h
        display this message

    --name     | -n
        set the name of the release

    --nextdate | -N
        set the date of the next scheduled release

    --version  | -v
        set the release version

END_HELP

    $S0 = 'process'(template, data)
    print $S0
    end
.end


.sub 'get_news'
    .param string version
    .local pmc newsfile
    .local string buf, news, start

    newsfile = open 'NEWS', '<'

    start    = 'New in 0.4.9'

    ## find the start of the news item for this version
    start    = concat 'New in ', version

  before:
    $I0 = newsfile.'eof'()
    if $I0 goto err_news
    buf      = readline newsfile
    $I0      = index buf, start
    if  $I0 != 0 goto before

  blank:
    buf      = readline newsfile
    $I0      = index buf, "\n"
    if  $I0 == 0 goto blank
    $I0      = index buf, "\r"
    if  $I0 == 0 goto blank
    news    .= buf

  item:
    buf      = readline newsfile
    $I0      = index buf, "\n"
    if  $I0 == 0 goto done
    $I0      = index buf, "\r"
    if  $I0 == 0 goto done
    news    .= buf
    goto item

  done:
    .return (news)

  err_news:
    $S0 = concat "error: can't find news on version ", version
    $S0 .= " in 'NEWS'\n"
    printerr $S0
.end


.sub 'process'
    .param string template
    .param pmc    data

    .local pmc    iter
    iter = new .Iterator, data

    .local string symbol, value

  it_loop:
    unless iter goto it_done
    $P0 = shift iter
    symbol = 'get_symbol'($P0)
    value  = iter[$P0]
      repl_loop:
        $I0 = index template, symbol
        if -1 == $I0 goto repl_done
        $I1 = length symbol
        substr template, $I0, $I1, value
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
# vim: expandtab shiftwidth=4:
