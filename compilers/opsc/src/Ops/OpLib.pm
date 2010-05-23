#! nqp
# Copyright (C) 2009-2010, Parrot Foundation.
# $Id$

INIT {
    pir::load_bytecode("dumper.pbc");
};

class Ops::OpLib is Hash;

=begin NAME

C<Ops::OpLib> - library of Parrot Operations.

=end NAME

=begin DESCRIPTION

Responsible for loading F<src/ops/ops.num> and F<src/ops/ops.skip> files,
parse F<.ops> files, sort them, etc.

Heavily inspired by Perl5 Parrot::Ops2pm.

=end DESCRIPTION

=begin SYNOPSIS

    my $oplib := Ops::OpLib.new(
        :num_file('../../src/ops/ops.num'),
        :skip_file('../../src/ops/ops.skip'),
    ));

=end SYNOPSIS

=begin ATTRIBUTES

=over 4

=item * C<$.max_op_num>

Scalar holding number of highest non-experimental op.  Example:

    'max_op_num' => 1246,

=item * C<%.op_num_table>

Hash holding mapping of opcode names ops to their numbers.
Example:

  'op_num_table' => {
    'pow_p_p_i' => 650,
    'say_s' => 463,
    'lsr_p_p_i' => 207,
    'lt_s_sc_ic' => 289,
    # ...
    'debug_init' => 429,
    'iseq_i_nc_n' => 397,
    'eq_addr_sc_s_ic' => 254
  },

Per F<src/ops/ops.num>, this mapping exists so that we can nail down
the op numbers for the core opcodes in a particular version of the
bytecode and provide backward-compatibility for bytecode.

=item * C<%.op_skip_table>

Reference to a 'seen-hash' of skipped opcodes.

  'op_skip_table' => {
    'bor_i_ic_ic' => 1,
    'xor_i_ic_ic' => 1,
    'tanh_n_nc' => 1,
    # ...
  },

As F<src/ops/ops.skip> states, these are "... opcodes that could be listed in
F<[src/ops/]ops.num> but aren't ever to be generated or implemented because
they are useless and/or silly."

=back

=end ATTRIBUTES

=begin METHODS

=over 4

=item C<new>

Build OpLib.

(It's NQP. In Perl 6 it should be submethod and invoked automatically)

=end METHODS

method new(:$num_file, :$skip_file) {
    self<num_file>   := $num_file  // './src/ops/ops.num';
    self<skip_file>  := $skip_file // './src/ops/ops.skip';

    # Initialize self.
    self<max_op_num>    := 0;
    self<op_num_table>  := hash();
    self<op_skip_table> := hash();
    self<num_file_lines>:= list();
    self<ops_past>      := list();
    self<regen_ops_num> := 0;

    self.load_op_map_files();

    self;
}

=begin METHODS

=item C<load_op_map_files>

Load ops.num and ops.skip files.

=end METHODS

method load_op_map_files() {
    self._load_num_file;
    self._load_skip_file;
}

my method _load_num_file() {
    # slurp isn't very efficient. But extending NQP beyond bare minimum is not in scope.
    my $buf := slurp(self<num_file>);
    grammar NUM {
        rule TOP { <line>+ }

        rule line {
            [
            | <op>
            | <dynamic>
            | <comment>
            ]
        }
        rule op { $<name>=(\w+) $<number>=(\d+) }
        rule dynamic { '###DYNAMIC###' \N* }
        rule comment { '#' \N* }
    }

    #say("Parsing NUM");
    my $ops := NUM.parse($buf);
    #_dumper($ops);
    #pir::exit(0);

    my $prev := -1;
    for $ops<line> {
        self<num_file_lines>.push($_);
        if $_<op> {
            my $name    := ~$_<op><name>;
            my $number  := +$_<op><number>;
            if (+$number) eq $number {
                if ($prev + 1 != $number) {
                    self<regen_ops_num> := 1;
                    say("# hole in ops.num before #$number: will regenerate ops.num");
                }
                if self<op_num_table>.exists($name) {
                    self<regen_ops_num> := 1;
                    say("# duplicate opcode $name and $number: will regenerate ops.num");
                }

                $prev := $number;
                self<op_num_table>{$name} := $number;
                if ( $number > self<max_op_num> ) {
                    self<max_op_num> := $number;
                }
            }
        }
    }

    #_dumper(self<op_num_table>);
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
        if self<op_num_table> && self<op_num_table>.exists($_<name>) {
            die("skipped opcode '$_' is also in num_file");
        }
        self<op_skip_table>{$_<name>} := 1;
    }
}


=begin ACCESSORS

Various methods for accessing internals.

=over 4

=item * C<max_op_num>

=item * C<op_num_table>

=item * C<op_skip_table>

=item * C<num_file>

=item * C<num_file_lines>

=end ACCESSORS

method max_op_num()     { self<max_op_num>; }

method op_num_table()   { self<op_num_table>; }

method op_skip_table()  { self<op_skip_table>; }

method num_file()       { self<num_file>; }

method num_file_lines() { self<num_file_lines>; }

# Local Variables:
#   mode: perl6
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=perl6:
