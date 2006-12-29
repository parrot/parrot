.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&fileevent'
    tcl_error 'wrong # args: should be "fileevent channelId event ?script?"'
.end
