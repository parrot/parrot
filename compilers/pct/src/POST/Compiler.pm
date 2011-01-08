module POST::Compiler;


=begin
Generate PBC file.
=end

=begin Labels

Labels are handled in two passes:
=item Generate todolist.
Todolist is hash of (position=>(name, op_start)), where C<position> is offset
in bytecode where label with C<name> used.
=item Populate labels.
Iterate over todolist and replace labels with offset of Sub start.

=end Labels

method pbc($post, %adverbs) {
    #pir::trace(1);

    # Emitting context. Contains consts, etc.
    my %context := self.create_context($post, %adverbs);
    %context<DEBUG> := 0;

    %context<pir_file> := $post;

    # Iterate over Subs and put them into POST::File table.
    # Used for discriminating find_sub_not_null vs "constant Subs" in
    # PCC call handling.
    self.enumerate_subs($post);

    for @($post) -> $s {
        self.to_pbc($s, %context);
    }

    %context<packfile>;
};

##########################################
# Emiting pbc

our multi method to_pbc(Undef $what, %context) {
    # Do nothing.
}

our multi method to_pbc(POST::Sub $sub, %context) {
    # Store current Sub in context to resolve symbols and constants.
    %context<sub> := $sub;

    # Allocate registers.
    my @n_regs_used := %context<regalloc>.process($sub);
    self.debug('n_regs_used ' ~ @n_regs_used.join('-')) if %context<DEBUG>;
    self.dumper($sub, "sub") if %context<DEBUG>;

    my $bc := %context<bytecode>;

    # Todo-list of Labels.
    %context<labels_todo> := hash();

    # Packfile poop his pants...
    my $sb := new('StringBuilder');
    $sb.push(~$sub.name);
    my $subname := ~$sb;

    self.debug("Emitting $subname") if %context<DEBUG>;
    %context<constants>.get_or_create_string($subname);

    my $start_offset := +$bc;
    self.debug("From $start_offset") if %context<DEBUG>;

    # Handle params
    $sub<params> := list() unless $sub<params>;
    $sub<params>.unshift(POST::Value.new(:name<self>)) if $sub.is_method;
    # Bloody "main" sub...
    if +$sub<params> {
        self.build_pcc_call("get_params_pc", $sub<params>, %context);
    }

    # Emit ops.
    for @($sub) {
        self.to_pbc($_, %context);
    }

    self.debug("Middle { +$bc }") if %context<DEBUG>;

    # Default .return(). XXX We don't need it (probably)
    self.debug("Emitting default return") if %context<DEBUG>;
    $bc.push([
        'set_returns_pc',
        0x000                      # id of FIA
    ]);

    $bc.push([
        'returncc'
    ]);

    my $end_offset := +$bc;
    self.debug("To $end_offset") if %context<DEBUG>;

    # Fixup labels to set real offsets
    self.fixup_labels($sub, %context<labels_todo>, %context<bytecode>, %context);

    # Now create Sub PMC using hash of values.
    my %sub := hash(
        :start_offs( $start_offset ),
        :end_offs( $end_offset ),
        :name( $subname ),
        # PCT's Sub.subid creates it. So poke inside $sub
        :subid( $sub<subid> // $subname ),
        :ns_entry_name( $sub.nsentry // $subname ),
        :vtable_index( -1 ), # It must be -1!!!
        :HLL_id<0>,
        :method_name( $sub.is_method ?? $subname !! ''),

        :n_regs_used(@n_regs_used),

        :pf_flags(self.create_sub_pf_flags($sub, %context)),
        :comp_flags(self.create_sub_comp_flags($sub, %context)),
    );

    if defined($sub.namespace) {
        my $nskey := $sub.namespace.to_pmc(%context)[0];
        if pir::typeof__sp($nskey) eq 'Key' {
            %sub<namespace_name>  := $nskey;
        }
    }

    # and store it in PackfileConstantTable
    # We can have pre-allocated constant for this sub already.
    # XXX Use .namespace for generating full name!
    my $idx := $sub.constant_index;
    if defined($idx) {
        self.debug("Reusing old constant $idx") if %context<DEBUG>;
        %context<constants>[$idx] := new('Sub', %sub);
    }
    else {
        $idx := %context<constants>.push(new('Sub', %sub));
        $sub.constant_index($idx);
        self.debug("Allocate new constant $idx") if %context<DEBUG>;
    }

    # Remember :main sub
    if (!%context<got_main_sub>) {
        self.debug("main_sub is { %context<bytecode>.main_sub }") if %context<DEBUG>;
        if $sub.main {
            self.debug("Got first :main") if %context<DEBUG>;
            # We have true :main sub. First one.
            %context<bytecode>.main_sub($idx);
            %context<got_main_sub> := 1;
        }
        elsif %context<bytecode>.main_sub == -1 {
            # First sub.
            self.debug("Got first sub") if %context<DEBUG>;
            %context<bytecode>.main_sub($idx);
        }

        self.debug(":main sub is { %context<bytecode>.main_sub }") if %context<DEBUG>;
    }
}

our multi method to_pbc(POST::Op $op, %context) {
    # Generate full name
    my $fullname := $op.pirop;
    self.debug("Short name $fullname") if %context<DEBUG>;

    for @($op) {
        my $type := $_.type || self.get_register($_.name, %context).type;
        $fullname := ~$fullname ~ '_' ~ ~$type;
    }

    self.debug("Fullname $fullname") if %context<DEBUG>;

    # Store op offset. It will be needed for calculating labels.
    %context<opcode_offset>     := +%context<bytecode>;
    # Store fullname. It will be needed to calculate offset of label.
    %context<opcode_fullname>   := $fullname;

    my @op := list($fullname);
    for @($op) {
        @op.push(self.to_op($_, %context));
    }
    self.debug("Op size { +@op }") if %context<DEBUG>;
    %context<bytecode>.push(@op);
}

# Some PIR sugar produces nested Nodes.
our multi method to_pbc(POST::Node $node, %context) {
    for @($node) {
        self.to_pbc($_, %context);
    }
}

our multi method to_pbc(POST::Label $l, %context) {
    my $bc := %context<bytecode>;
    self.panic("Trying to emit undelcared label!") unless $l.declared;

    my $pos := +$bc;
    self.debug("Declare label '{ $l.name }' at $pos") if %context<DEBUG>;
    # Declaration of Label. Update offset in Sub.labels.
    $l.position($pos);
    # We can have "enclosed" ops. Process them now.
    for @($l) {
        self.to_pbc($_, %context);
    }
}

our multi method to_pbc(POST::Call $call, %context) {
    my $bc       := %context<bytecode>;
    my $calltype := $call.calltype;
    my $is_tailcall := $calltype eq 'tailcall';

    if $calltype eq 'call' || $calltype eq 'tailcall' {
        if $call.invocant {
            $call<params> := list() unless $call<params>;
            $call<params>.unshift($call.invocant);
        }

        self.build_pcc_call("set_args_pc", $call<params>, %context);

        if $call.invocant {
            if $call.name.isa(POST::Constant) {
                $bc.push([
                    $is_tailcall
                        ?? 'tailcallmethod_p_sc'
                        !! 'callmethodcc_p_sc',
                    self.to_op($call.invocant, %context),
                    self.to_op($call.name, %context),
                ]);
            }
            else {
                self.panic('NYI $P0.$S0()');
            }
        }
        else {
            my $SUB;
            my $processed := 0;
            if $call.name.isa(POST::Constant) {
                # Constant string. E.g. "foo"()
                # Avoid find_sub_not_null when Sub is constant.
                my $full_name;
                $full_name := %context<sub>.namespace.Str if %context<sub>.namespace;
                $full_name := ~$full_name ~ ~$call<name><value>;
                my $invocable_sub := %context<pir_file>.sub($full_name);
                self.debug("invocable_sub '$full_name'") if %context<DEBUG>;
                if $invocable_sub {
                    my $idx := $invocable_sub.constant_index;
                    unless defined($idx) {
                        # Allocate new space in constant table. We'll reuse it later.
                        $idx := %context<constants>.push(new("Integer"));
                        $invocable_sub.constant_index($idx);
                        self.debug("Allocate constant for it $idx") if %context<DEBUG>;
                    }

                    $SUB := %context<sub>.symbol("!SUB");
                    $bc.push([
                        'set_p_pc',
                        self.to_op($SUB, %context),
                        $idx,
                    ]);

                    $processed := 1;
                }
            }

            unless $processed {
                if $call.name.isa(POST::Constant) {
                    $SUB := %context<sub>.symbol("!SUB");
                    $bc.push([
                        'find_sub_not_null_p_sc',
                        self.to_op($SUB, %context),
                        self.to_op($call<name>, %context),
                    ]);
                }
                else {
                    self.debug("Name is " ~ $call<name>.WHAT) if %context<DEBUG>;
                    $SUB := $call<name>;
                }
            }

            my $o := $is_tailcall ?? "tailcall_p" !! "invokecc_p";

            self.debug($o) if %context<DEBUG>;
            $bc.push([ $o, self.to_op($SUB, %context) ]);
        }

        unless $is_tailcall {
            self.build_pcc_call("get_results_pc", $call<results>, %context);
        }
    }
    elsif $calltype eq 'return' {
        self.build_pcc_call("set_returns_pc", $call<params>, %context);
        $bc.push(['returncc']);
    }
    elsif $calltype eq 'results' {
        # This is generated in eceptions handling
        self.build_pcc_call("get_results_pc", $call<params>, %context);
    }
    else {
        self.panic("NYI { $calltype }");
    }
}

##########
# Generating parts of Op

our multi method to_op(POST::Key $key, %context) {

    self.debug("Want key") if %context<DEBUG>;
    my $key_pmc := $key.to_pmc(%context)[0];
    self.debug("Got key") if %context<DEBUG>;

    # XXX PackfileConstantTable can't Keys equivalense it. So just push it.
    # XXX PCC clone_key...
    #my $idx := %context<constants>.push($key_pmc);
    my $constants := %context<constants>;
    my $idx;
    Q:PIR {
        .local pmc key_pmc, constants, idx
        .local int i0
        find_lex constants, "$constants"
        find_lex key_pmc, "$key_pmc"
        i0 = constants.'pmc_count'()
        push constants, key_pmc

        find_lex idx, "$idx"
        idx = i0
        store_lex "$idx", idx
    };

    $idx;
}

our multi method to_op(POST::Constant $op, %context) {
    my $idx;
    my $type := $op.type;
    if $type eq 'ic' || $type eq 'kic' {
        $idx := $op.value;
    }
    elsif $type eq 'nc' {
        $idx := %context<constants>.get_or_create_number($op.value);
    }
    else {
        self.panic("NYI");
    }

    self.debug("Index $idx") if %context<DEBUG>;
    $idx;
}

our multi method to_op(POST::String $str, %context) {
    my $idx;
    my $type := $str.type;
    if $type ne 'sc' {
        self.panic("attempt to pass a non-sc value off as a string");
    }
    if $str.encoding eq 'fixed_8' && $str.charset eq 'ascii' {
        $idx := %context<constants>.get_or_create_string($str.value);
    }
    else {
        #create a ByteBuffer and convert it to a string with the given encoding/charset
        my $bb := new('ByteBuffer');
        my $str_val := $str.value;
        Q:PIR{
            .local pmc str_val, bb
            .local string s
            str_val = find_lex '$str_val'
            bb      = find_lex '$bb'
            s = str_val
            bb = s
        };
        $idx := %context<constants>.get_or_create_string($bb.get_string(
            $str.encoding,
        ));
    }

    $idx;
}

our multi method to_op(POST::Value $val, %context) {
    # Redirect to real value. POST::Value is just reference.
    my $orig := self.get_register($val.name, %context);
    self.to_op($orig, %context);
}

our multi method to_op(POST::Register $reg, %context) {
    $reg.regno;
}

our multi method to_op(POST::Label $l, %context) {
    # Usage of Label. Put into todolist and reserve space.
    my $bc  := %context<bytecode>;
    my $pos := +$bc;
    # FIXME!!! We do need exact position for fixup labels.
    # $bc.push(0);
    %context<labels_todo>{$pos} := hash(
            :name($l.name),
            :offset(%context<opcode_offset>),
            :opname(%context<opcode_fullname>),
    );

    self.debug("Todo label '{ $l.name }' at $pos, { %context<opcode_offset> }") if %context<DEBUG>;

    0;
}

# /Emiting pbc
##########################################

##########################################
# PCC related functions

our method build_pcc_call($opname, @args, %context) {
    my $bc        := %context<bytecode>;
    my $signature := self.build_args_signature(@args, %context);
    my $sig_idx   := %context<constants>.get_or_create_pmc($signature);

    self.debug("Sig: $sig_idx") if %context<DEBUG>;

    self.debug($opname) if %context<DEBUG>;
    # Push signature and all args.

    my @op := list($opname, $sig_idx);

    for @args -> $arg {
        # Handle :named params 
        if pir::isa__ips($arg.modifier, "Hash") {
            my $name := $arg.modifier<named> // $arg.name;
            @op.push(
                 %context<constants>.get_or_create_string($name)
            );
        }
        @op.push(self.to_op($arg, %context));
    }

    $bc.push(@op);
}

our method build_args_signature(@args, %context) {
    my @sig;
    for @args -> $arg {
        # build_single_arg can return 2 values, but @a.push can't handle it
        my $s := self.build_single_arg($arg, %context);
        if pir::isa__ips($s, 'Integer') {
            @sig.push($s);
        }
        else {
            for $s { @sig.push($_); }
        }
    }

    # Copy @sig into $signature
    my $elements  := +@sig;
    my $signature := Q:PIR{
        %r = find_lex '$elements'
        $I99 = %r
        %r = find_lex '$signature'
        %r = new ['FixedIntegerArray'], $I99
    };

    # TODO Update nqp-setting to support .kv
    my $idx := 0;
    for @sig -> $val {
        $signature[$idx] := $val;
        $idx++;
    }

    $signature;
}

our method build_single_arg($arg, %context) {
    # Build call signature arg according to PDD03
    # POST::Value doesn't have .type. Lookup in symbols.
    my $type := $arg.type // self.get_register($arg.name, %context).type;

    my $res;

    # Register types.
    if $type eq 'i'     { $res := 0 }
    elsif $type eq 's'  { $res := 1 }
    elsif $type eq 'p'  { $res := 2 }
    elsif $type eq 'n'  { $res := 3 }
    # Constants
    elsif $type eq 'ic' { $res := 0 + 0x10 }
    elsif $type eq 'sc' { $res := 1 + 0x10 }
    elsif $type eq 'pc' { $res := 2 + 0x10 }
    elsif $type eq 'nc' { $res := 3 + 0x10 }
    else  { self.panic("Unknown arg type '$type'") }

    my $mod := $arg.modifier;
    if $mod {
        if pir::isa__ips($mod, "Hash")  {
            # named
            # First is string constant with :named flag
            $res := list(0x1 + 0x10 + 0x200, $res + 0x200)
        }
        elsif $mod eq 'slurpy'          { $res := $res + 0x20 }  # 5
        elsif $mod eq 'flat'            { $res := $res + 0x20 }  # 5
        elsif $mod eq 'optional'        { $res := $res + 0x80 }  # 7
        elsif $mod eq 'opt_flag'        { $res := $res + 0x100 } # 8
        elsif $mod eq 'slurpy named'    { $res := $res + 0x20 + 0x200 } # 5 + 9
        else { self.panic("Unsupported modifier $mod"); }
    }

    $res;
}

# /PCC related functions
##########################################


# XXX This is required only for PAST->POST generated tree.
our method enumerate_subs(POST::File $post) {
    for @($post) -> $sub {
        # XXX Should we emit warning on duplicates?
        $post.sub($sub.full_name, $sub) if $sub.isa(POST::Sub);
    }
}

# Declare as multi to get "static" typecheck.
our method create_sub_pf_flags(POST::Sub $sub, %context) {
    # This constants aren't exposed. So keep reference here.
    # SUB_FLAG_IS_OUTER     = PObj_private1_FLAG == 0x01
    # SUB_FLAG_PF_ANON      = PObj_private3_FLAG == 0x08
    # SUB_FLAG_PF_MAIN      = PObj_private4_FLAG == 0x10
    # SUB_FLAG_PF_LOAD      = PObj_private5_FLAG == 0x20
    # SUB_FLAG_PF_IMMEDIATE = PObj_private6_FLAG == 0x40
    # SUB_FLAG_PF_POSTCOMP  = PObj_private7_FLAG == 0x80
    my $res := 0;
    $res := $res + 0x01 * $sub.outer;
    $res := $res + 0x08 * $sub.anon;
    $res := $res + 0x10 * $sub.main;
    $res := $res + 0x20 * $sub.load;
    $res := $res + 0x40 * $sub.immediate;
    $res := $res + 0x80 * $sub.postcomp;

    self.debug("pf_flags $res") if %context<DEBUG>;

    $res;
}

our method create_sub_comp_flags(POST::Sub $sub, %context) {
    #    SUB_COMP_FLAG_VTABLE    = SUB_COMP_FLAG_BIT_1   == 0x02
    #    SUB_COMP_FLAG_METHOD    = SUB_COMP_FLAG_BIT_2   == 0x04
    #    SUB_COMP_FLAG_PF_INIT   = SUB_COMP_FLAG_BIT_10  == 0x400
    #    SUB_COMP_FLAG_NSENTRY   = SUB_COMP_FLAG_BIT_11  == 0x800
    my $res := 0;
    $res := $res + 0x002 if $sub.vtable;
    $res := $res + 0x004 if $sub.is_method;
    $res := $res + 0x400 if $sub.is_init;
    $res := $res + 0x800 if $sub.nsentry;  # XXX Check when to set ns_entry_name in .to_pbc!

    self.debug("comp_flags $res") if %context<DEBUG>;

    $res;
}

our method fixup_labels($sub, $labels_todo, $bc, %context) {
    self.debug("Fixup labels") if %context<DEBUG>;
    for $labels_todo -> $kv {
        my $offset := $kv.key;
        my %todo   := $kv.value;
        self.debug("Fixing '{ %todo<name> }' from op { %todo<opname> } at { $offset }") if %context<DEBUG>;
        # We need op to calc position of LABEL within it.
        my $op  := $bc.opmap{ ~%todo<opname> };
        self.debug("Op length is { $op.length }") if %context<DEBUG>;

        my $delta  := $sub.label(%todo<name>).position - %todo<offset>;
        # Shortcut - all ops have "in LABEL" as lst argument.
        $bc[$offset + $op.length] := $delta;
    }
}

# Get register from symbol table with validation
our method get_register($name, %context) {
    my $reg := %context<sub>.symbol($name);
    if !$reg {
        self.panic("Register '{ $name }' not predeclared in '{ %context<sub>.name }'");
    }
    $reg;
}

method debug(*@args) {
    for @args {
        pir::say($_);
    }
}

our method create_context($past, %adverbs) {
    my %context;

    %context<compiler> := self;

    %context<packfile> := new("Packfile");

    # Scaffolding
    # Packfile will be created with fresh directory
    my $pfdir := %context<packfile>.get_directory;

    # We need some constants
    %context<constants> := new('PackfileConstantTable');

    # Empty FIA for handling returns from "hello"
    %context<constants>[0] := new('FixedIntegerArray');

    # Add PackfileConstantTable into directory.
    $pfdir<CONSTANTS_hello.pir> := %context<constants>;

    # Generate bytecode
    %context<bytecode> := new('PackfileBytecodeSegment');
    %context<bytecode>.main_sub(-1);
    # Did we see real :main sub
    %context<got_main_sub> := 0;

    # Store bytecode
    $pfdir<BYTECODE_hello.pir> := %context<bytecode>;

    # TODO pbc_disassemble crashes without proper debug.
    # Add a debug segment.
    # %context<DEBUG> := new('PackfileDebug');

    # Store the debug segment in bytecode
    #$pfdir<BYTECODE_hello.pir_DB> := %context<DEBUG>;

    %context<regalloc> := POST::VanillaAllocator.new;

    %context<DEBUG>    := %adverbs<debug>;

    %context;
}
INIT {
    pir::load_bytecode('nqp-setting.pbc');
}

# vim: ft=perl6
