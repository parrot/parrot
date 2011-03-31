#! parrot-nqp

# workaround nqp-rx not generating :main




MAIN();

sub MAIN() {
    
    #data structures:
    # * directory

    # these things can be assembled witout external depencencies
    # * vartable
    # * metadta seg
    # * bytecode seg

    #loop:

    my $curr_seg := 'start';
    my @chunks := ();
    my %curr_chunk := {};
    my $process;

    my $s := pir::new('FileHandle').readall('hello.0bc');
    for pir::split__pss("\n", $s) -> $line {

        if (pir::index__iss($line, '.') == 0) {
            grammar DOT_LINE {
                rule TOP   { "." <type> \s* ['"' <name> '"']? $$ }
                token type { [ "chunk" | "variables" | "metadata" | "bytecode" ] }
                token name { <.ident> }
            }
            my $match := DOT_LINE.parse($line);
            #say($line);
            #_dumper($match);

            if ($match<type> eq 'chunk') {
                @chunks.push(%curr_chunk) if %curr_chunk<name>;
                %curr_chunk := {};
                %curr_chunk<name> := ~$match<name>[0];
            }
            elsif ($line ~~ /variables/) {
                #initialize the variables segment
                $process := process_variable;
                %curr_chunk<vars_body_bits> := '';
                %curr_chunk<vars_body_size> := 0;
            }
            elsif ($line ~~ /metadata/) {
                #initialize the metadata segment
                $process := process_metadata;
            }
            elsif ($line ~~ /bytecode/) {
                #finalize the metadata segment
                #initialize the bytecode segment
                $process := process_bytecode;
            }
        }
        $process($line, %curr_chunk) if $process;
    }
    #finalize the bytecode segment
}

sub process_variable($line, %chunk) {

    grammar VAR_LINE {
        rule  TOP     { <var_num> <data> }
        token var_num { <int> }
        token data    { [ <hex> | <int> | <string> | <float> ] }
        token hex     { '0x' [<xdigit><xdigit>]+ }
        token int     { \d+ }
        token string  { '"' <alnum>+ '"' }
        token float   { '12341234e32342' }
    }

    my $match := VAR_LINE.parse($line);
    my $bits;

    if $match<data><hex> {
        _dumper($match);
        $bits := convert_hex(pir::join('',$match<data><hex><xdigit>));
    }
    elsif $match<data><int> {
        say("int thingy");
    }
    elsif $match<data><string> {
        say("string thingy");
    }
    elsif $match<data><float> {
        say("float thingy");
    }
    #convert it into bytes
    #update the size of the vars body
}

sub convert_hex($data) {
    my $bytes := pir::new('ByteBuffer');
    while pir::length($data) >= 2 {
        my $char0 := pir::substr($data, 0, 1);
        my $char1 := pir::substr($data, 1, 1);
        my $byte := 16*hexval($char0) + hexval($char1);
        $data := pir::substr($data, 2);
        pir::push_p_i($bytes, $byte);
    }
}

sub hexval($c) {
    my $ord_c := pir::ord(pir::downcase($c));
    my $ord_0 := pir::ord('0');
    my $ord_9 := pir::ord('9');
    my $ord_a := pir::ord('a');
    my $ord_f := pir::ord('f');

    my $ret := $ord_0 <= $ord_c && $ord_c <= $ord_9 ??
      $ord_c - $ord_0 !!
      $ord_a <= $ord_c && $ord_c <= $ord_f ??
        $ord_c - $ord_a + 10 !!
          0;
    say("char $c converts to $ret");
    $ret;
}



sub process_metadata($line, %chunk) {
    #say("processing metadata on line '$line'");

}

sub process_bytecode($line, %chunk) {
    #say("processing bytecode on line '$line'");

}

sub reg_map() {
    my %h;
    %h<CX>  := 0x00;
    %h<PC>  := 0x01;
    %h<EH>  := 0x02;
    %h<EX>  := 0x03;
    %h<PCX> := 0x04;
    %h<VAR> := 0x05;
    %h<MDS> := 0x06;
    %h<BCS> := 0x07;
    
    my $i := 0;
    while ($i <= 61) {
        %h{"I"~ ~$i} := $i + 8;
        %h{"N"~ ~$i} := $i + 70;
        %h{"S"~ ~$i} := $i + 132;
        %h{"P"~ ~$i} := $i + 194;
    }

    %h;
}

sub ops_map() {
    my %h;
    %h<noop>       := 0x00;
    %h<goto>       := 0x01;
    %h<goto_if_eq> := 0x02;
    %h<goto_cs>    := 0x03;
    %h<add_i>      := 0x04;
    %h<add_n>      := 0x05;
    %h<sub_i>      := 0x06;
    %h<sub_n>      := 0x07;
    %h<mult_i>     := 0x08;
    %h<mult_n>     := 0x09;
    %h<div_i>      := 0x0A;
    %h<div_n>      := 0x0B;
    %h<mod_i>      := 0x0C;
    %h<mod_n>      := 0x0D;
    %h<iton>       := 0x0E;
    %h<ntoi>       := 0x0F;
    %h<ashr>       := 0x10;
    %h<lshr>       := 0x11;
    %h<shl>        := 0x12;
    %h<and>        := 0x13;
    %h<or>         := 0x14;
    %h<xor>        := 0x15;
    %h<set>        := 0x16;
    %h<set_mem>    := 0x17;
    %h<get_mem>    := 0x18;
    %h<get_var>    := 0x19;
    %h<csym>       := 0x1A;
    %h<ccall_arg>  := 0x1B;
    %h<ccall_ret>  := 0x1C;
    %h<ccall>      := 0x1D;
    %h<print_s>    := 0x1E;
    %h<print_i>    := 0x1F;
    %h<print_n>    := 0x20;
    %h<alloc>      := 0x21;
    %h<free>       := 0x22;
    %h<exit>       := 0x23;
    %h;
};

