#! nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

INIT {
    pir::load_bytecode("dumper.pbc");
};

class Ops::Renumberer is Hash;

=begin NAME

C<Ops::Renumberer> - renumber ops.num.

=end NAME

=begin DESCRIPTION

This class is responsible for regenerating src/ops/ops.num when the number or
order of ops there needs to be changed.

=end DESCRIPTION

=begin SYNOPSIS

    my $renum := Ops::Renumberer.new( :ops_file($f) );

=end SYNOPSIS

=begin ATTRIBUTES

=over 4

=item * C<$.max_op_num>

Scalar holding number of highest non-experimental op.  Example:

    'max_op_num' => 1246,

=back

=end ATTRIBUTES

=begin METHODS

=over 4

=item C<new>

Build an Ope::Renumberer.

(It's NQP. In Perl 6 it should be submethod and invoked automatically)

=end METHODS

method new(:$ops_file!) {
    self<ops_file> := $ops_file;

    self;
}

=begin METHODS

=item C<need_regeneration>

Check if ops.num needs to be regenerated.

=end METHODS

method need_regeneration() {

    #only need regeneration for core ops
    unless self<ops_file>.oplib {
        return 0;
    }

    #shortcut in case the oplib found an invalid ops.num
    if self<ops_file>.oplib<regen_ops_num>{
        return 1;
    }

    my $op_num_table := self<ops_file>.oplib.op_num_table;
    my $opsfile_ops  := self<ops_file>.ops;
    my $opsfile_num  := 0;
    my $need_regeneration := 0;

    #find out if the order in ops.num reflects the order in Ops::File
    for $opsfile_ops -> $opsfile_op {

        my $op_name          := $opsfile_op.full_name;
        my $op_num_table_num := +$op_num_table{ $op_name };
        #say("ops.num says $op_name is $op_num_table_num, opsfile says $opsfile_num");

        if (!$opsfile_op<experimental> && $opsfile_num != $op_num_table_num) {
            say("# Opsfile and ops.num disagree about $op_name: $opsfile_num vs $op_num_table_num");
            $need_regeneration := 1;
        }
        $opsfile_num++;
    }

    $need_regeneration;
}

# Local Variables:
#   mode: perl6
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=perl6:
