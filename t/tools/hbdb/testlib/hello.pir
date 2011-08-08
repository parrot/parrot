#! parrot

.sub 'main' :main
    say "Starting at line 4"
    say "About to call foo()"
    foo()
    say "Back in main() at line 7"
    say "About to quit"
.end

.sub 'foo'
    say "This is foo() at line 12"
    say "About to call bar()"
    bar()
.end

.sub 'bar'
    say "This is bar() at line 18"
    say "About to call baz()"
    baz()
.end

.sub 'baz'
    say "This is baz() at line 24"
    say "About to return to main()"
.end

