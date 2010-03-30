
# Copyright (C) 2010, Parrot Foundation.
# $Id$

class ProfTest::Matcher is Hash;

method new(*@wants) {
    self<wants> := ();
    for @wants -> $want {
        self<wants>.push($want);
        self.say("pushed a thing:"~$want.get_str);
    }
    self<wants>.push(
        ProfTest::Want::Goal.new()
    );
    self;
}

method matches($profile) {

    my @backtracks := ();
    my $line_idx   := 0;
    my $want_idx   := 0;
    my $start_line := 0;
    my $max_line   := +$profile.profile_array;

    my $curr_line;
    my $curr_want;

    while ($line_idx < $max_line) {

        $curr_line := $profile.profile_array[$line_idx];
        $curr_want := self<wants>[$want_idx];
        self.say("current want: "~$curr_want.get_str);
        self.say("current line: "~ ~$curr_line);

        if $curr_want.goal {
            self.say("SUCCESS\n");
            return 1;
        }
        elsif ($curr_want.accepts($curr_line)) {

            self.say("ACCEPTED");
            $line_idx++;
            # +0 is a workaround for crappy lvalue semantics
            @backtracks.push( [$line_idx+0, $want_idx+0] );
            self.say("saving line $line_idx, want $want_idx");
            self.say("now have "~ ~@backtracks ~ " elements in the stack");
            $want_idx++;
        }
        else {
            self.say("REJECTED");
            if !@backtracks && $start_line == $max_line {
                self.say("FAILURE\n");
                return 0;
            }
            elsif !@backtracks {
                $start_line++;
                $line_idx := $start_line+0;
                self.say("FAILURE: restarting at $line_idx\n");
            }
            else {
                my @a := @backtracks.pop;
                $line_idx := @a[0];
                $want_idx := @a[1];
                self.say("backtracking to line $line_idx, want $want_idx");
                self.say("now have "~ ~@backtracks ~ " elements in the stack");
            }
        }
        self.say('');
    }
}

method say($str) {
    if self<debugging> {
        pir::say($str);
    }
}

method debugging($i) {
    self<debugging> := $i+0;
}

# Local Variables:
#   mode: perl6
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=perl
