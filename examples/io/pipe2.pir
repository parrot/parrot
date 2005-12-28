.sub main :main
    .param pmc argv
    .local int argc
    argc = argv
    .local string cmd
    cmd = "/bin/ls"
    if argc < 2 goto no_cmd
    cmd = argv[1]
no_cmd:
    .local pmc pipe
    pipe = open cmd, "-|"
    .local string buffer
    $S0 = pop pipe	# pop buf layer
lp:
    buffer = read pipe, 200
    print buffer
    if pipe goto lp
.end

