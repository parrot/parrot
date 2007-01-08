
set nick     jane
set server   irc.perl.org
set channels [list #parrot]

source irc.tcl

proc privmsg {who target msg} {
    set first [string wordstart $msg 0]
    set last  [string wordend   $msg 0]

    if {[string range $msg $first [expr {$last-1}]] ne "expr"} return

    set expr [string range $msg $last end-1]
    if {[string first \[ $expr] != -1} return

    puts "expr: '$expr'"
    if {$target eq $::nick} {set target $who}
    if { [catch {$::cxn privmsg $target "$who: [expr $expr]"} err] } {
        $::cxn privmsg $target "$who: $err"
    }
}

set cxn [irc::connection]

# event handlers
$cxn registerevent PRIVMSG {::privmsg [who] [target] [msg]}
$cxn registerevent defaultevent {puts "(event) [header]: [msg]"}

$cxn connect $server
$cxn user $nick localhost domain www.tcl.tk
$cxn nick $nick
foreach channel $channels {
    $cxn join $channel
}

# event loop
vwait ::exit
