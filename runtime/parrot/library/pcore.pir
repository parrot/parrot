# create/export some useful but rarely used methods

# TODO podify & beautify & doc

.sub _init :load
    create_lexenv()
    # more to come probably
.end

# provide Sub.get_lexenv() method
.sub create_lexenv :anon
    .const .Sub le = "do_lexenv"
    # export it into Sub namespace
    store_global "Sub", "get_lexenv", le
.end

# implementation Sub.get_lexenv :method
.sub do_lexenv :anon :method
    .local pmc env, pad
    env = new .ResizablePMCArray
    # push this pad and outies
loop:
    pad = self."get_lexpad"()
    push env, pad
    self = self."get_outer"()
    if null self goto done
    goto loop
done:
    .return (env)
.end
