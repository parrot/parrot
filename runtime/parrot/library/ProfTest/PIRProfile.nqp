
# Copyright (C) 2010-2011, Parrot Foundation.

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
    my %config := self.get_config();
    my $newline := %config<win32> ?? "\r\n" !! "\n";
    my @pprof_lines := pir::split($newline, self<profile>);
    self<profile_array> := ();

    for @pprof_lines -> $line {
        my $line_match := self.make_line_hash($line);
        #pir::say($line);
        #_dumper($line_match);
        self<profile_array>.push($line_match);
    }
}

method make_line_hash($line) {

    my %line_hash := {};

    my $colon_idx := pir::index($line, ":");
    #if the line starts with "VERSION, CLI or END_OF_RUNLOOP,
    if ($colon_idx >= 3) {
        my $type := pir::substr($line, 0, $colon_idx);
        my $data := pir::substr($line, $colon_idx+1);
        %line_hash<type> := $type;
        %line_hash<data> := $data;
    }
    else {
        my $type := pir::substr($line, 0, $colon_idx);
        %line_hash<type> := $type;
        $line := pir::substr($line, $colon_idx+1);
        while ($line) {
            $line := pir::substr($line, 3);
            my $colon_idx := pir::index($line, ":");
            my $split_idx := pir::index($line, "}x}");
            my $name  := pir::substr($line, 0, $colon_idx);
            my $value := pir::substr($line, $colon_idx+1, $split_idx-$colon_idx-1);
            %line_hash{ $name } := $value;
            $line := pir::substr($line, $split_idx+3);
        }
    }
    %line_hash;
}


method build_pir_profile() {

    my %config    := self.get_config();
    #XXX(cotto) use a random filename (requires randomness from pir)
    my $tmp_pir   := %config<tempdir> ~ %config<slash> ~ 'test.pir';
    my $tmp_pprof := %config<tempdir> ~ %config<slash> ~ 'test.pprof';

    my $fh := pir::new__p_sc('FileHandle');
    $fh.open($tmp_pir, "w");
    $fh.puts(self<pir_code>);
    $fh.close();

    my $parrot_exe := %config<prefix> ~ %config<slash> ~ %config<test_prog>;
    my $hash_seed_opt := '';

    my %env := pir::new__p_sc('Env');
    %env{'PARROT_PROFILING_FILENAME'} := $tmp_pprof;
    if self<canonical> {
        %env{'PARROT_PROFILING_CANONICAL_OUTPUT'} := 1;
        $hash_seed_opt := '--hash-seed=1234';
    }

    my $cli := "\"$parrot_exe\" $hash_seed_opt --runcore profiling $tmp_pir";

    my $pipe := pir::new__p_sc('FileHandle');
    $pipe.open($cli, "rp");
    $pipe.readall();
    self<exit_status> := $pipe.exit_status();

    my $pprof_fh  := pir::new__p_sc('FileHandle');
    self<profile> := $pprof_fh.readall($tmp_pprof);

    pir::loadlib__ps('os');
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
