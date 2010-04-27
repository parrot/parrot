
# Copyright (C) 2010, Parrot Foundation.
# $Id$

class ProfTest::Want is Hash;

method new() { die('...'); }

method accepts() { 1; }

method goal() { 0; }


class ProfTest::Want::Goal;

method new() { self; }

method goal() { 1; }

method get_str() { 'Goal' };



class ProfTest::Want::Any is ProfTest::Want;

method new(@except?) {
    self<except> := @except;
    self;
}

method accepts(%prof_line) {
    for self<except> -> $except_type {
        if $except_type eq %prof_line<type>{
            return 0;
        }
    }
    return 1;
}

method get_str() {
    my $str := 'Any(';
    if self<except> {
        $str := $str ~ 'except(' ~ join(',', self<except>) ~ '),';
    }
    $str := $str ~ ')';
    $str;
}



class ProfTest::Want::Version is ProfTest::Want;

method new($version?) {
    self<version> := $version;
    self;
}

method accepts(%prof_line) {
    if %prof_line<type> eq 'VERSION' {
        return 1;
    }
}

method get_str() {
    my $str := 'Version(';
    if self<version> {
        $str := $str ~ 'version(' ~ self<version> ~ ')';
    }
    $str := $str ~ ')';
    $str;
}



class ProfTest::Want::CLI is ProfTest::Want;

method new() { self }

method accepts(%prof_line) {
    if %prof_line<type> eq 'CLI' {
        return 1;
    }
}

method get_str() { "CLI()" }



class ProfTest::Want::EndOfRunloop is ProfTest::Want;

method new() { self; }

method accepts(%prof_line) {
    if %prof_line<type> eq 'END_OF_RUNLOOP' {
        return 1;
    }
}

method get_str() { 'EndOfRunloop()' }



class ProfTest::Want::Op is ProfTest::Want;

method new($name, $line?) {
    self<name> := $name;
    if $line {
        self<line> := $line;
    }
    self;
}

method accepts(%prof_line) {
    if %prof_line<type> eq 'OP' {
        if self<name> ne %prof_line<op> {
            return 0;
        }
        if self<line> && self<line> != %prof_line<line> {
            return 0;
        }
        return 1;
    }
    return 0;
}

method get_str() {
    my $str := 'Op(' ~ self<name>;
    if self<line> {
        $str := $str ~ ', :line(' ~ self<line> ~ ')';
    }
    $str := $str ~ ')';
    $str;
}



class ProfTest::Want::CS is ProfTest::Want;

method new(:$ns?, :$slurp_until?) {
    self<ns> := $ns;
    if $slurp_until {
        self<slurp_until> := $slurp_until;
    }
    self<found_cs> := 0;
    self;
}

method accepts(%prof_line) {
    if self<found_cs> && self<slurp_until> {
        if pir::downcase__SS(%prof_line<type>) ne self<slurp_until> {
            return 1;
        }
        return 0;
    }
    elsif %prof_line<type> eq 'CS' {
        if !self<ns> {
            self<found_cs> := 1;
            return 1;
        }
        if %prof_line<ns> eq self<ns> {
            self<found_cs> := 1;
            return 1;
        }
    }
    return 0;
}

method get_str() {
    my $str := 'CS(';
    if self<ns> {
        $str := $str ~ ':ns(' ~ self<ns> ~ ')';
    }
    if self<slurp_until> {
        $str := $str ~ ', :slurp_until(' ~ self<slurp_until> ~ ')';
    }
    $str := $str ~ ')';
    $str;
}


# Local Variables:
#   mode: perl6
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=perl
