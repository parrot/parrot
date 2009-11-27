#! parrot-nqp


#XXX: can't do main with args yet, so fake it

main();

sub main() {

    my $filename := pir::getinterp__P[2][1];

    my %stats;
    %stats<global_stats><total_time> := 0;

    my $fh := pir::new__PP("FileHandle");
    $fh.open($filename, "r");
    
    process_input($fh, %stats);

    $fh.close();

    #print_stats(%stats);

    $filename := $filename ~ ".out";

    $fh.open($filename, "w");
    my @profile := get_cg_profile(%stats);
    for @profile -> $line {
        $fh.print($line ~ "\n");
    }
    $fh.close();
    say("all done.");
}

sub process_input($fh, %stats) {
    my @call_stack;
    my $line := $fh.readline();

    while (!$fh.eof()) {

        my $type := pir::substr($line, 0, pir::index($line, ':'));
        my $data := pir::substr($line, pir::index($line, ':')+1);
        #say("data is '$data'");

        if ($type eq "OP") {
            #say("found an op line");
            
            my %op_hash := split_line($data);
            my %cur_ctx := @call_stack[0];

            if (pir::defined__IP(%cur_ctx<line>) && %op_hash<line> == %cur_ctx<line>) {
                %cur_ctx<op_num>++;
            }
            else {
                %cur_ctx<op_num> := 0;
            }

            my $op_time     := %op_hash<time>;
            # += would be nice here
            my $global_time := $op_time + %stats<global_stats><total_time>;
            %stats<global_stats><total_time> := $global_time;
            %cur_ctx<line>  := %op_hash<line>;
            store_stats(%stats, %cur_ctx, $op_time, %op_hash<op>);

            my $skip_first := 1;
            for @call_stack {
                if $skip_first {
                    $skip_first--;
                }
                else {
                    %stats{ $_<file> }{ $_<ns> }{ $_<line> }[ $_<op_num> ]<time> :=
                    %stats{ $_<file> }{ $_<ns> }{ $_<line> }[ $_<op_num> ]<time> + $op_time;
                }
            }
        }

        elsif ($type eq "CS") {
            #say("found a context switch line");

            my %cs_hash := split_line($data);
            if (@call_stack == 0) {
                #say("ctx stack is empty");
                @call_stack[0] := %cs_hash;
            }
            else {
                my %cur_ctx      := @call_stack[0];
                my $hash_ctx     := %cs_hash<ctx>;
                my $is_redundant := %cur_ctx<ctx> eq $hash_ctx;
                my $reused_ctx   := $is_redundant && %cur_ctx<sub> != %cs_hash<sub>;

                if ($reused_ctx) {
                    #say("is reused: $hash_ctx vs " ~ %cur_ctx<ctx>);
                    %cur_ctx<ns>  := %cs_hash<ns>;
                    %cur_ctx<sub> := %cs_hash<sub>;
                }
                
                elsif $is_redundant {
                    #say("is redundant: $hash_ctx vs " ~ %cur_ctx<ctx>);
                }
                else {
                    my $found_ctx := 0;
                    for @call_stack {
                        #would be nice to exit early
                        $found_ctx := $found_ctx || $_<ctx> eq $hash_ctx;
                    }

                    if $found_ctx {
                        pir::shift(@call_stack) while @call_stack[0]<ctx> ne $hash_ctx
                    }
                    else {
                        %cur_ctx<op_num>++;
                        store_stats(%stats, @call_stack[0], 0, "CALL", :target(%cs_hash<ns>));
                        pir::unshift(@call_stack, %cs_hash);
                    }
                }
            }
        }

        elsif ($type eq "VERSION") {
            my $version_num;
            Q:PIR {
                $P0 = find_lex "$data"
                $I0 = $P0
                $P0 = box $I0
                store_lex "$version_num", $P0
            };
            #say("found a version line: '$version_num'");
            if ($version_num != 1) {
                say("pprof is from an incompatible Parrot version");
                pir::exit(1);
            }
        }
        elsif ($type eq "CLI") {
            #say("found a CLI line");
            %stats<global_stats><cli> := $data;
        }
        elsif (pir::index($line, "END_OF_RUNLOOP") == 0) {
            #say("found an end of runloop line");
            @call_stack := ();
        }
        elsif (pir::index($line, "#") == 0) {
            #say("found a comment line");
        }
        else {
            say("don't know what to do with this line: \"$line\"");
        }
        $line := $fh.readline();
    }
}


sub store_stats(%stats, %loc, $time, $op_name, :$target?) {

    my %op_stats;
    if pir::defined__IP( %stats{ %loc<file> }{ %loc<ns> }{ %loc<line> }[ %loc<op_num> ] ) {
        %op_stats := %stats{ %loc<file> }{ %loc<ns> }{ %loc<line> }[ %loc<op_num> ];
    }
    else {
        %op_stats := %stats{ %loc<file> }{ %loc<ns> }{ %loc<line> }[ %loc<op_num> ] := {};
    }

    if %op_stats<hits> {
        %op_stats<hits>++;
        %op_stats<time> := %op_stats<time> + $time;
    }
    else {
        %op_stats<hits>    := 1;
        %op_stats<time>    := $time;
        %op_stats<op_name> := $op_name;
        %op_stats<target>  := $target if pir::defined__IP($target);
    }
}

sub print_stats(%stats) {
#    for %stats -> $file {
#        if $file ne 'global_stats' {
#            for %stats{$file} -> $ns {
#                for %stats{$file}{$ns} -> $line_num {
#                    my $max_op := +%stats{$file}{$ns}{$line_num};
#                    my $cur_op := 0;
#                    while ($cur_op < $max_op) {
#                        print("$file  $ns  line/op:$line_num/$cur_op");
#                        for %stats{$file}{$ns}{$line_num}[$cur_op] -> $attr {
#                            print(" $attr => " ~ ~%stats{$file}{$ns}{$line_num}[$cur_op]{$attr});
#                        }
#                        $cur_op++;
#                        print("\n");
#                    }
#                }
#                print("\n");
#            }
#        }
#    }
    pir::load_bytecode("dumper.pbc");
    _dumper(%stats);
}


sub get_cg_profile(%stats) {
    my @output;
    @output.push("version: 1");
    @output.push("creator: PARROT IS AWESOME");
    @output.push("pid: 5751");
    @output.push("cmd: " ~ ~%stats<global_stats><cli>);
    #@output.push("");
    @output.push("part: 1");
    @output.push("desc: I1 cache:");
    @output.push("desc: D1 cache:");
    @output.push("desc: L2 cache:");
    @output.push("desc: Timerange: Basic block 0 - " ~ +%stats<global_stats><total_time>);
    @output.push("desc: Trigger: Program termination");
    @output.push("positions: line");
    @output.push("events: Ir");
    @output.push("summary: "~ %stats<global_stats><total_time>);
    @output.push("");

    for %stats -> $file {
        if $file ne "global_stats" {

            @output.push("fl=$file");
            for %stats{$file} -> $ns {
                @output.push("\nfn=$ns");

                #%stats{$file}{$ns}.sort();
                for %stats{$file}{$ns} -> $line {
                    my $curr_op    := 0;
                    my @line_stats := %stats{$file}{$ns}{$line};
                    my $op_count   := +@line_stats;
                    my $op_time    := 0;

                    while $curr_op < $op_count && @line_stats[$curr_op]<op_name> ne "CALL"  {
                        $op_time := $op_time + @line_stats[$curr_op]<time>;
                        #say("op is "~ @line_stats[$curr_op]<op_name>);
                        $curr_op++;
                    }
                    @output.push(~$line ~ " " ~ ~$op_time);
                    
                    if $curr_op < $op_count && @line_stats[$curr_op]<op_name> eq "CALL" {
                        my $hits   := @line_stats[$curr_op]<hits>;
                        my $time   := @line_stats[$curr_op]<time>;
                        my $target := @line_stats[$curr_op]<target>;
                        @output.push("cfn=$target");
                        @output.push("calls=$hits $time");
                        #say("op is "~ @line_stats[$curr_op]<op_name>);
                    }
                    
                    if $curr_op < $op_count {
                        $op_time := 0;
                        while $curr_op < $op_count {
                            $op_time := $op_time + @line_stats[$curr_op]<time>;
                        #say("op is "~ @line_stats[$curr_op]<op_name>);
                            $curr_op++;
                        }
                        @output.push(~$line ~ " " ~ ~$op_time);
                    }
                }
            }
        }
    }
    @output.push("totals: " ~ ~%stats<global_stats><total_time>);
    @output;
}


sub split_line($line) {
    my %values := {};

    #take off the opening and closing {x{ and }x}
    $line   := pir::substr($line, 3);
    my $len := pir::length($line);
    $len    := $len - 4;
    $line   := pir::substr($line, 0, $len);

    my @attrs := pir::split('}x}{x{', $line);

    for @attrs {
        my $idx       := pir::index($_, ":");
        my $key       := pir::substr($_, 0, $idx);
        my $value     := pir::substr($_, $idx+1);
        %values{$key} := $value;
        #say("key is $key, value is $value");
    }
    return %values;
}
