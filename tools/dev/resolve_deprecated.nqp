#! parrot-nqp
# Copyright (C) 2011, Parrot Foundation.

pir::load_bytecode("YAML/Tiny.pbc");
pir::load_bytecode("YAML/Dumper.pbc");
pir::load_bytecode("LWP/UserAgent.pbc");
pir::load_bytecode("nqp-setting.pbc");
pir::load_bytecode("dumper.pbc");

=begin NAME
resolve_deprecated.nqp - Resolve deprecated features listed in api.yaml by
quering trac for status of ticket.
=end NAME
=begin SYNOPSIS

    parrot-nqp tools/dev/resolve_deprecated.nqp

=end SYNOPSIS
=begin DESCRIPTION

Resolve all freshly deprecated features.

=end DESCRIPTION
=begin COMPLICATIONS

YAML::Dumper produce way too complex YAML. We should extend YAML::Tiny to
produce simplified version.

=end COMPLICATIONS

say("Parsing");
my @yaml   := YAML::Tiny.new.read_string(slurp('api.yaml'))[0];
my $ua     := pir::new(LWP::UserAgent);

say("Processing");

for @yaml -> %e {
    # Skip items without ticket
    my $ticket := %e<ticket>;
    next unless $ticket;

    # Skip already marked items
    next if any(-> $_ { $_ eq 'completed' }, %e<tags>);

    say("Checking $ticket");

    # Request non-https version due limitation of LWP.
    my $response := $ua.get(subst($ticket ~ '?format=tab', /^https/, 'http')).content;
    #_dumper(['response', $response]);

    # cheat. split doesn't split properly on multiple tabs. So just check \tclosed\t
    my $/ := $response ~~ /\t ( "closed" ) \t/;
    next unless $/[0] eq 'closed';

    say("Ticket $ticket is closed and can be marked as 'completed'");
    %e<tags>.push('completed');
}

say("Done");

spew("api.yaml", YAML::Tiny.new.write_string(@yaml));

sub any(&code, @list) {
    return 1 if &code($_) for @list;
    0;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=perl6:
