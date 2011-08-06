#! parrot-nqp
# Copyright (C) 2011, Parrot Foundation.

pir::load_bytecode("YAML/Tiny.pbc");
pir::load_bytecode("nqp-setting.pbc");

=begin NAME
show_experimental.nqp - Show experimental features listed in api.yaml
=end NAME
=begin SYNOPSIS

    parrot-nqp tools/dev/show_experimental.nqp

=end SYNOPSIS
=begin DESCRIPTION

Shows all currently experimental features. This script could be used to generate
documentation about experimental features in the future.

=end DESCRIPTION

my @yaml := YAML::Tiny.new.read_string(slurp('api.yaml'))[0];

for @yaml -> %e {
    my @tags  := %e<tags>;
    my $note  := %e<note> // '';
    my $title := %e<name>;
    next if any(-> $_ { $_ eq 'completed' }, @tags);
    # This format is ugly, but is functional for now
    say("$title\t$note") if any(-> $_ { $_ eq 'experimental' }, @tags);
}

sub any(&code, @list) {
    for @list {
        return 1 if &code($_);
    }
    0;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=perl6:
