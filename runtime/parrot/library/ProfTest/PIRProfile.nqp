
# Copyright (C) 2010, Parrot Foundation.
# $Id$

class ProfTest::PIRProfile is Hash;

method new($pir_code, $canonical? = 1) {
    self<canonical> := $canonical;
    self<pir_code>  := $pir_code;
    self.build_pir_profile;
    self.build_profile_array;
    self;
}

method profile_array() {
    self<profile_array>;
}

method build_profile_array() {

    my @pprof_lines := pir::split("\n", self<profile>);
    self<profile_array> := ();

    grammar pprof_line {
        rule TOP { ^^ [ <variable_line> | <fixed_line> ] $$ }

        rule line_type { [ 'VERSION' | 'CLI' | 'END_OF_RUNLOOP' | 'CS' | 'OP' ] }

        rule fixed_line { <line_type> ':' <fixed_data> }
        rule fixed_data { \N* }

        rule variable_line { <line_type> ':' <variable_data>* }
        rule variable_data { '{x{' <field_name> ':' <field_data> '}x}' }
        rule field_name    { <.ident> }
        #XXX: really need to find something better 
        rule field_data    { <[a..zA..Z0..9_\-;\/.]>* }
    }

    for @pprof_lines -> $line {
        my $line_match := pprof_line.parse($line);
        #pir::say($line);
        #_dumper($line_match);
        self<profile_array>.push($line_match);
    }
}

method build_pir_profile() {

    my $tmp_pir := '/tmp/test.pir';
    my $tmp_pprof := '/tmp/test.pprof';
    my $fh := pir::new__p_sc('FileHandle');
    $fh.open($tmp_pir, "w");
    $fh.puts(self<pir_code>);
    $fh.close();

    my %config := self.get_config();
    my $parrot_exe := %config<prefix> ~ %config<slash> ~ %config<test_prog>;
    my $hash_seed_opt := '';

    my %env := pir::new__p_sc('Env');
    %env{'PARROT_PROFILING_FILENAME'} := $tmp_pprof;
    if self<canonical> {
        %env{'PARROT_PROFILING_CANONICAL_OUTPUT'} := 1;
        $hash_seed_opt := '--hash-seed=1234';
    }

    my $cli := "$parrot_exe $hash_seed_opt --runcore profiling $tmp_pir";

    my $pipe := pir::new__p_sc('FileHandle');
    $pipe.open($cli, "rp");
    $pipe.readall();
    self<exit_status> := $pipe.exit_status();

    my $pprof_fh  := pir::new__p_sc('FileHandle');
    self<profile> := $pprof_fh.readall($tmp_pprof);

    pir::new__p_sc('OS').rm($tmp_pir);
    pir::new__p_sc('OS').rm($tmp_pprof);
}

method get_config() {
    return Q:PIR {
        .include 'iglobals.pasm'
        .local pmc i
        i = getinterp
        %r = i[.IGLOBALS_CONFIG_HASH]
    };
}

# Local Variables:
#   mode: perl6
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=perl
