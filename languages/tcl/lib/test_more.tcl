#
# Analog to perl's Test::More
#
# We can't currently run tcltest.tcl, but this gives us a mock version that
# lets us at least run tcl test files; it also gives us TAP output for our
# parrot-focused tests.

proc skip_all {} {
    puts 1..0
}

proc plan {number} {
    if {$number eq "no_plan"} {
        global very_bad_global_variable_test_num
        puts 1..$very_bad_global_variable_test_num
    } {
        puts 1..$number
    }
}

set very_bad_global_variable_test_num 0

# The special argument, if passed, should be a two element list, e.g.
# {TODO "message"}

proc is {value expected {description ""} {special {}}}  {
    global very_bad_global_variable_test_num
    incr  very_bad_global_variable_test_num

    set num $very_bad_global_variable_test_num
    set type ""

    if {[llength $special] == 2} {
        set type [string toupper [lindex $special 0]]
        if {$type eq "TODO"} {
            global env
            set normal [array get env PARTCL_DEVTEST]
            if {$normal ne {}} {
                set type ""
                set special ""
            }
        }
        set special_reason [concat {*}[lindex $special 1]]
        set description [regsub -all # $description {\#}]
        set description " - $description # $type $special_reason"
    } else {
        if  {$description ne ""} {
            set description " - $description"
        }
    }

    if {$value eq $expected} {
        puts "ok $num$description"
        return 1
    } {
        puts "not ok $num$description"

        if {$type ne "TODO"} {
            set formatted_value [join [split $value "\n"] "\n# "]
            set formatted_expected [join [split $expected "\n"] "\n# "]
            diag "\n#     Failed test #$very_bad_global_variable_test_num\n#      got : '$formatted_value'\n# expected : '$formatted_expected'"
        }
        return 0
    }
}

proc eval_is {code expected {description ""} {special {}}}  {
    global very_bad_global_variable_test_num
    # The one case where skip actually means "don't do that"
    if {[llength $special] == 2} {
        set boolean [string compare -nocase [lindex $special 0] skip]
        if {! $boolean} {
            global very_bad_global_variable_test_num
            incr  very_bad_global_variable_test_num
            puts "ok $very_bad_global_variable_test_num # $special"
            return 1
        }
    }
    catch {uplevel #0 $code} actual
    is $actual $expected $description $special
}

proc ok {value {description ""} {special {}}}  {
    is $value 1 $description $special
}

proc not_ok {value {description ""} {special {}}} {
    set value [expr !$value]
    ok $value $description $special
}

proc pass {{description ""} {special ""}} {
  ok 1 $description $special
}

proc like {value regexp {description ""}} {
   if ([regexp $regexp $value]) {
     pass $description
   } else {
     is "STRING: $value" "REGEXP: $regexp" $description
   }
}

proc isnt {code expected {description ""} {special {}}}  {
    set code     "\"\[eval {$code}\]\""
    set expected "\"$expected\""

    cmp_ok $code ne $expected $description $special
}

proc cmp_ok {left op right {description ""} {special {}}} {
    ok "expr {$left $op $right}" $description $special
}

proc fail {{description ""} {special ""}} {
  is "something else: $description" {something} $description $special
}

proc diag {diagnostic} {
  puts stderr "# $diagnostic"
}
