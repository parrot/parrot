rule quoted_symbol {
    <'"'> <!["]>* <'"'>
}
rule letter { <[A-Za-z_]> }
rule digit { \d }
rule identifier {
    <letter> [<letter>
    | <digit>]*
}
rule expression;
rule factor :w {
    <identifier>
    | <quoted_symbol>
    | <'('> <expression> <')'>
    | <'['> <expression> <']'>
    | <'{'> <expression> <'}'>
    }

rule term :w {
    <factor>*
    }

rule expression :w {
    <term> [<'|'> <term>]*
    }

rule Rule :w {
    <identifier> <'::='> <expression>
    }

rule syntax :w {
    <Rule>+
    }

my $which = @ARGS[0];
for @ARGS[1..@ARGS - 1] -> $str {
    my $no;
    if $which =~ /^r/ { $no = $str !~ m:w/^ <Rule> $/ }
    elsif $which =~ /^e/ { $no = $str !~ m:w/^ <expression> $/ }
    elsif $which =~ /^t/ { $no = $str !~ m:w/^ <term> $/ }
    elsif $which =~ /^f/ { $no = $str !~ m:w/^ <factor> $/ }
    elsif $which =~ /^s/ { $no = $str !~ m:w/^ <syntax> $/ }
    else { $no = 1 }
    print "no " if $no;
    print "match\n";
}
