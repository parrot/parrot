
# Copyright (C) 2009, Parrot Foundation.
# $Id$

class PMC::Emitter::C;

method rewrite_op($pmclass, $past) {
    my $pasttype := $past<pasttype>;
    #say("OH HI " ~ $pasttype);
    my $res;
    if $pasttype eq 'inline' {
        $res := $past<inline>;
    }
    elsif $pasttype eq 'call' {
        # Technicaly we can have different "calls". But for now only macros supported.
        $res := self.rewrite_macro($pmclass, $past);
    }

    $res;
}

method rewrite_macro($pmclass, $past) {
    my $res;
    if $past<is_self> {
        $res := "Parrot_" ~ $pmclass.name ~ "_" ~ $past.name
                ~ '(' ~ full_arguments($past) ~')';
    }

    $res;
}

sub full_arguments($past) {
    my @tmp;
    @tmp.push('interp, pmc');
    for @($past) {
        @tmp.push($_.value);
    }
    join(', ', @tmp);
}

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
