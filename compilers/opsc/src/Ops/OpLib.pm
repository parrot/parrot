#! nqp
# Copyright (C) 2009-2010, Parrot Foundation.

INIT {
    pir::load_bytecode("dumper.pbc");
};

class Ops::OpLib is Hash;

=begin NAME

C<Ops::OpLib> - library of Parrot Operations.

=end NAME

=begin DESCRIPTION

Responsible for loading F<src/ops/ops.skip> files, parse F<.ops> files, sort
them, etc.

Heavily inspired by Perl5 Parrot::Ops2pm.

=end DESCRIPTION

=begin SYNOPSIS

    my $oplib := Ops::OpLib.new(
        :skip_file('../../src/ops/ops.skip'),
    ));

=end SYNOPSIS

=begin ATTRIBUTES

=over 4

=item * C<%.op_skip_table>

Reference to a 'seen-hash' of skipped opcodes.

  'op_skip_table' => {
    'bor_i_ic_ic' => 1,
    'xor_i_ic_ic' => 1,
    'tanh_n_nc' => 1,
    # ...
  },

As F<src/ops/ops.skip> states, these are "... opcodes that should not ever to be
generated or implemented because they are useless and/or silly."

=back

=end ATTRIBUTES

=begin METHODS

=over 4

=item C<new>

Build OpLib.

(It's NQP. In Perl 6 it should be submethod and invoked automatically)

=end METHODS

method new(:$skip_file, :$quiet? = 0) {
    self<skip_file>  := $skip_file // './src/ops/ops.skip';
    self<quiet>      := $quiet;

    # Initialize self.
    self<op_skip_table> := hash();
    self<ops_past>      := list();
    self<regen_ops_num> := 0;

    self.load_op_map_files();

    self;
}

=begin METHODS

=item C<load_op_map_files>

Load ops.skip.

=end METHODS

method load_op_map_files() {
    self._load_skip_file;
}

method _load_skip_file() {
    my $buf     := slurp(self<skip_file>);
    grammar SKIP {
        rule TOP { <op>+ }

        rule op { $<name>=(\w+) }
        token ws {
            [
            | \s+
            | '#' \N*
            ]*
        }
    }

    my $lines := SKIP.parse($buf);

    for $lines<op> {
        self<op_skip_table>{$_<name>} := 1;
    }
}


=begin ACCESSORS

Various methods for accessing internals.

=over 4

=item * C<op_skip_table>

=end ACCESSORS

method op_skip_table()  { self<op_skip_table>; }

# Local Variables:
#   mode: perl6
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=perl6:
