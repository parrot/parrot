pir::load_bytecode('nqp-setting.pbc');

my $test := 1;

grammar NCI-Thunk::Grammar {
    token TOP { [\n? <signature> | [\#\N*] ]* }

    token signature { <return> <args> }

    token return { <identifer> }

    token args { <identifer>* }

    token identifer { <prefix> <symbol> }

    token symbol { <[vpfdDbcsilqPV]> }

    token prefix { <[*]>? <[u]>? }
};

=begin

Sample NCI Thunk: 

static void
pcf_d_JOd(PARROT_INTERP, PMC *nci, SHIM(PMC *self))
{
    typedef double(* func_t)(PARROT_INTERP, PMC *, double);
    func_t fn_pointer;
    void *orig_func;
    PMC *       ctx         = CURRENT_CONTEXT(interp);
    PMC * const call_object = Parrot_pcc_get_signature(interp, ctx);
    PMC *       ret_object  = PMCNULL;
    FLOATVAL return_data;

    PMC * t_1;
    FLOATVAL t_2;
    UNUSED(return_data); /* Potentially unused, at least */
    Parrot_pcc_fill_params_from_c_args(interp, call_object, "PiN", &t_1, &t_2);
    
    GETATTR_NCI_orig_func(interp, nci, orig_func);
    fn_pointer = (func_t)D2FPTR(orig_func);
    return_data =  (double)(*fn_pointer)(interp, t_1, t_2);
    ret_object = Parrot_pcc_build_call_from_c_args(interp, call_object, "N", return_data);
    


}
=end

class NCI-Thunk {
    has $!sig;
    has $!return;
    has $!args;

    method init($sig, $return, $args) {
        my $r := NCI-Thunk.new;
        $r.BUILD($sig, $return, $args);
        return $r;
    }

    method BUILD($sig, $return, $args) {
        $!sig    := $sig;
        $!return := $return;
        $!args   := $args;
        say('args: ', $args);
    }
    
    class C-Type {
        has $!pointer;
        has $!size;
        method set-pointer($p = 1) {
            $!pointer := $p;
        }
    }

    class C-Int is C-Type {
        has $!signed;

        my sub init_sizes() {
            my %r;
            %r<8>  := 'char';
            %r<c>  := 'char';
            %r<16> := 'short';
            %r<s>  := 'short';
            %r<32> := 'int';
            %r<i>  := 'int';
            %r<l>  := 'long';
            %r<64> := 'long long';
            %r<q>  := 'long long';
            return %r; 
        }

        our %sizes := init_sizes();

        method set-signed() {
            $!signed := 1;
        }

        method set-size(:$size!) {
            # validate size:
            # 8 - char
            # 16 - short
            # 32 - i int
            # 32/64 - l long
            # 64 - long long
            $!size := %sizes{"$size"};
        }

        method Str() {
            my $result;
            
            if $!pointer {
                $result := "* ";
            }


        }
    }

    class C-Num is C-Type {
        method set-size(:$float, :$double, :$long-doule) {
            if $float {
                $!size := 'float';
            }
            elsif $double {
                $!size := 'double';
            }
            elsif $long-double {
                $!size := 'long double';
            }
        }

        method Str() {
            return $!state;
        }
    }

    class C-Struct is C-Type {
    }
    
    our %type := hash(:i<int>, :q<long long>, :c<char>, );

    my sub build_prototype($key) {
        if $key ~~ /\{/ {
            say('structure');
        }
        else {
            say($key<prefix>);
            say('normal type');
        }

        
        return %type{"$key"};
    }

    method Str() {
        my $thunk := "
static void
pcf_" ~ $!return ~ '_' ~ $!args ~ '(PARROT_INTERP, PMC *nci, SHIM(PMC *self)) \{'; # add in proto types for all vars;
        $thunk := $thunk ~ "
    func_t fn_pointer;
    void *orig_func;
    PMC *       ctx         = CURRENT_CONTEXT(interp);
    PMC * const call_object = Parrot_pcc_get_signature(interp, ctx);
    PMC *       ret_object  = PMCNULL;
    ";

        if $!return ne 'v' {
            $thunk := $thunk ~ build_prototype($!return) ~ " result;\n    ";
        }

        $thunk := $thunk ~ "yo";
        
        my $obj_count := 0;
        for $!args<identifer> -> $a {
            say($a);
        }
        say($!args<identifer>[0], 'and');
        for $!args<identifer> -> $arg {
            say("tes");
            $thunk := $thunk ~ build_prototype($arg) ~ "\n";
        }

        if $!return ne 'v' {
            $thunk := $thunk ~ 'grab result';
        }
        else {
            $thunk := $thunk ~ 'ignore result';
        }

        $thunk := $thunk ~ "\n    return;\n}";
        return $thunk;
    }
}

class NCI-Thunk::Actions {
    has @!thunks;

    method init() {
        my $r := NCI-Thunk::Actions.new;
        $r.BUILD();
        return $r;
    }

    method BUILD() {
        @!thunks := ();
    }
    
    method TOP($/) {
    }
    method return($/) {
    }
    method signature($/) {
        my $sig := $/;
        say('Sig is: ', $sig, ' and ', $<return>, ' arg: ',  $<args>[0]);
        @!thunks.push(NCI-Thunk.init($/, $<return>, $<args>));
    }

    method print_signature() {
        for @!thunks -> $thunk {
            say($thunk.Str);
        }
        return 'stuff' ~ +@!thunks;
    }
};


sub tests() {
    plan(11);

    my $/;

    $/ := NCI-Thunk::Grammar.parse("v");

    ok($/<signature>[0]<return> eq 'v', 'Void with no args');

    $/ := NCI-Thunk::Grammar.parse('vv');

    ok($/<signature>[0]<return> eq 'v', 'Void with void args, return parsed');
    ok($/<signature>[0]<args> eq 'v', 'Void with void args, args parsed');

    $/ := NCI-Thunk::Grammar.parse('*v');

    ok($/<signature>[0]<return><identifer><symbol> eq 'v', 'Still parses the symbol correctly');
    ok($/<signature>[0]<return><identifer><prefix> eq '*', 'A void* works');

    $/ := NCI-Thunk::Grammar.parse('iis');

    ok($/<signature>[0]<args>, 'Parsed with multipe args correctly');
    ok($/<signature>[0]<args><identifer>[0] eq 'i', 'First param is correct.');
    ok($/<signature>[0]<args><identifer>[1] eq 's', 'Second param is correct.');

    $/ := NCI-Thunk::Grammar.parse("vi\nvs\nis");

    ok($/<signature>[0]<return> eq 'v' && $/<signature>[2]<return> eq 'i', "Multi-line Sig's parse");

    $/ := NCI-Thunk::Grammar.parse("fi# comment is not parsed\nvi# foo");

    ok($/<signature>[1]<return> eq 'v', "Comments parse correctly");

    my $b := NCI-Thunk::Actions.init();

    $/ := NCI-Thunk::Grammar.parse("vi*i", :actions($b));

    my $c := pir::inspect__p_p($/);
    say($c);
    say($b.print_signature);
    say($/.ast);
}

if $test {
    tests();
}

# vim: ft=perl6
