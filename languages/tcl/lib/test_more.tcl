#
# Analog to perl's Test::More
#
# At the moment, this is *much* weaker testing harness than the one that
# comes with tcl. However, it's very good for partcl in the short term.

# RT#40713: put this in a namespace to avoid global pollution

# get listing of all the tests we can't run.
source lib/skipped_tests.tcl

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
        set special_reason [concat {expand}[lindex $special 1]]
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

        if {$type ne "todo"} {
            set formatted_value [join [split $value "\n"] "\n# "]
            set formatted_expected [join [split $expected "\n"] "\n# "]
            diag "\n#     Failed test #$very_bad_global_variable_test_num\n#      got : '$formatted_value'\n# expected : '$formatted_expected'"
        }
        return 0
    }
}

# RT#40714: Need to handle the case where we expect an exception.
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

# RT#40720: hacks to help avoid translating the actual tcl tests, until 
# we actually support tcltest.

# A placeholder that simulates the real tcltest's exported test proc.
proc test {num description args} {
    global skipped_tests
    global abort_after
    set full_desc "$num $description"

    set should_skip [dict filter $skipped_tests script {K V} {
        set val [lsearch -exact $V $num]
        expr {$val != -1}
    }]

    set reason [dict keys $should_skip]

    if {[string length $reason]} {
        pass $full_desc [list SKIP $reason]
    } elseif {[llength $args] == 2} {
        eval_is [lindex $args 0] [lindex $args 1] $full_desc
    } elseif {[llength $args] == 3} {
        # XXX : we're just skipping the constraint here...
        eval_is [lindex $args 1] [lindex $args 2] $full_desc
    } else {
        # Skip test if too many or two few args.
        pass $full_desc [list SKIP {can't deal with this version of test yet}]
    }

    if {! [catch {set abort $abort_after($num)}]} {
       plan no_plan
       exit 0
    }
}

# RT#40717: hacks to allow compilation of tests.

# Constraints are like skip conditions that
# can be specified by a particular invocation to test. Since we're ingoring
# all the option params to test, we'll ignore this one too, and execute tests
# when we shouldn't.

proc testConstraint     {args} {return 0}
proc temporaryDirectory {args} {return 0}
proc makeFile           {args} {return 0}
proc removeFile         {args} {return 0}
proc bytestring         {args} {return 0}
proc customMatch        {args} {return 0}
proc testinfocmdcount   {args} {return 0}
proc interpreter        {args} {return 0}
proc interp             {args} {return 0}
proc safeInterp         {args} {return 0}
proc pid                {args} {return 0}
proc child              {args} {return 0}
proc child-trusted      {args} {return 0}
proc makeDirectory      {args} {return 0}
proc removeDirectory    {args} {return 0}
proc testobj            {args} {return 0}
proc testsetplatform    {args} {return 0}
proc testevalex         {cmd}  { uplevel {expand}$cmd }

namespace eval tcltest  {
    set verbose 0
    proc temporaryDirectory {args} {return 0}
} 
