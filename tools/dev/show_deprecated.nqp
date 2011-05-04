#! parrot-nqp
# Copyright (C) 2011, Parrot Foundation.

pir::load_bytecode("YAML/Tiny.pbc");
pir::load_bytecode("nqp-setting.pbc");

=begin NAME
show_deprecated.nqp - Show deprecated features listed in api.yaml
=end NAME
=begin SYNOPSIS

    parrot-nqp tools/dev/show_deprecated.nqp

=end SYNOPSIS
=begin DESCRIPTION

Shows all currently deprecated features. This script could be used to generate
documentation about deprecated features in the future.

=end DESCRIPTION

my @yaml := YAML::Tiny.new.read_string(slurp('api.yaml'))[0];

for @yaml -> %e {
    my @tags     := %e<tags>;
    my $title    := %e<name>;
    my $eligible := %e<eligible> // 'NONE';
    my $ticket   := %e<ticket> //
      '*************** no ticket ****************';
    next if any(-> $_ { $_ eq 'completed' }, @tags);
    # This format is ugly, but is functional for now
    say( "$ticket\t$eligible\t$title" ) if any( -> $_ { $_ eq 'deprecated' }, @tags);

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
