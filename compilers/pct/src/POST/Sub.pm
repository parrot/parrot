class POST::Sub is POST::Node;

our @paramfmt;
INIT {
    @paramfmt[0] := "    .param pmc %0\n";
    @paramfmt[1] := "    .param pmc %0 :optional\n    .param int has_%0 :opt_flag\n";
    @paramfmt[2] := "    .param pmc %0 :slurpy\n";
    @paramfmt[3] := "    .param pmc %0 :slurpy\n";
    @paramfmt[4] := "    .param pmc %0 :named(%1)\n";
    @paramfmt[5] := "    .param pmc %0 :optional :named(%1)\n    .param int has_%0 :opt_flag\n";
    @paramfmt[6] := "    .param pmc %0 :slurpy :named\n";
    @paramfmt[7] := "    .param pmc %0 :slurpy :named\n";
    @paramfmt[8] := "    .param pmc %0 :call_sig\n";
}

=item C<symtable>
Get whole symtable. Used in register allocator.

method symtable() {
    self<symtable>;
}

=item C<symbol($name, $value?)
Get or set variable used in POST::Sub.

method symbol($name, $value?) {
    my %symtable := self<symtable>;
    unless %symtable {
        self<symtable> := hash();
        %symtable := self<symtable>;
    }

    if $value {
        %symtable{$name} := $value;
    }

    %symtable{$name};
}

=item C<labels>
Get all labels.

method labels() {
    self<labels>;
}

=item C<symbol($name, $value?)
Get or set variable used in POST::Sub.

method label($name, $value?) {
    my %labels := self<labels>;
    unless %labels {
        self<labels> := hash();
        %labels := self<labels>;
    }

    if $value {
        %labels{$name} := $value;
    }

    %labels{$name};
}


=item C<param($name, POST::Register $param)
Add Sub parameter.

method param($name, POST::Register $param) {
    my @params := self<params>;
    unless @params {
        self<params> := list();
        @params := self<params>;
    }

    # Don't check redeclaration of register. It should be done early.

    @params.push($param);
}


=item C<constant_index>($idx?)
Get or set Sub index in PackfileConstantTable

multi method constant_index() { self<constant_index>; }
multi method constant_index($idx) { self<constant_index> := $idx; $idx }

=Modifiers
Various sub modifiers.

multi method main()     { self<main> // 0 }
multi method main($val) { self<main> := ?$val }

# XXX Conflict with PCT::Node.init.
multi method is_init()     { self<init> // 0 }
multi method is_init($val) { self<init> := ?$val }

multi method load()     { self<load> // 0 }
multi method load($val) { self<load> := ?$val }

multi method immediate()     { self<immediate> // 0 }
multi method immediate($val) { self<immediate> := ?$val }

multi method postcomp()     { self<postcomp> // 0 }
multi method postcomp($val) { self<postcomp> := ?$val }

multi method anon()     { self<anon> // 0 }
multi method anon($val) { self<anon> := ?$val }

multi method is_method()     { self<method> // 0 }
multi method is_method($val) { self<method> := ?$val }

multi method lex()        { self<lex> // 0 }
multi method lex($val)    { self<lex> := ?$val }

multi method nsentry()     { self<nsentry> }
multi method nsentry($val) { self<nsentry> := $val }

multi method vtable()     { self<vtable> // -1 }
multi method vtable($val) { self<vtable> := $val; $val }

multi method blocktype()     { self<blocktype> }
multi method blocktype($val) { self<blocktype> := $val }

multi method namespace()     { self<namespace> }
multi method namespace($val) { self<namespace> := $val }

multi method hll()     { self<hll> }
multi method hll($val) { self<hll> := $val }

multi method loadlibs()     { self<loadlibs> }
multi method loadlibs($val) { self<loadlibs> := $val }

multi method outer()     { self<outer> }
multi method outer($val) { self<outer> := $val }

multi method multi()     { self<multi> }
multi method multi($val) { self<multi> := $val }

multi method pirflags()     { self<pirflags> }
multi method pirflags($val) { self<pirflags> := $val }

multi method compiler()     { self<compiler> }
multi method compiler($val) { self<compiler> := $val }

multi method compiler_args()     { self<compiler_args> }
multi method compiler_args($val) { self<compiler_args> := $val }

multi method subid($value)      { self<subid> := $value }
multi method subid() {
    my $value := self<subid>;
    unless pir::defined__ip($value) {
        $value := self.unique('post');
        self<subid> := $value;
    }
    $value;
}

method set_flag($name, $val) { self{$name} := $val; $val }

=end

method full_name() {
    if self<namespace> {
        self<namespace>.Str ~ self.name
    }
    else {
        self.name;
    }
};

method add_directive($line) {
    my $dlist := self<directives>;
    if pir::index__iss($dlist, $line) < 0 {
        self<directives> := ~$dlist ~ ~$line ~ "\n";
    }
}

# XXX Rewrite into NQP
method add_param($pname, *%adverbs) {
    Q:PIR {
    .local pmc pname
    .local pmc adverbs

    find_lex pname, '$pname'
    find_lex adverbs, '%adverbs'

    .local int optional, slurpy, call_sig
    .local string named
    optional = adverbs['optional']
    slurpy = adverbs['slurpy']
    named = adverbs['named']
    call_sig = adverbs['call_sig']

    .local int paramseq
    paramseq = isne optional, 0
    unless slurpy goto slurpy_done
    paramseq += 2
  slurpy_done:
    unless named goto named_done
    paramseq += 4
  named_done:
    unless call_sig goto call_sig_done
    paramseq += 8
  call_sig_done:

    .local pmc paramlist
    paramlist = self['paramlist']
    unless null paramlist goto have_paramlist
    paramlist = new 'ResizablePMCArray'
    self['paramlist'] = paramlist
  have_paramlist:

    .local pmc code
    code = paramlist[paramseq]
    unless null code goto have_code
    code = new 'StringBuilder'
    paramlist[paramseq] = code
  have_code:

    .local pmc paramfmt
    paramfmt = get_hll_global ['POST';'Sub'], '@paramfmt'
    $S0 = paramfmt[paramseq]
    named = self.'escape'(named)
    code.'append_format'($S0, pname, named)

    .return ()
    }
}

INIT {
    pir::load_bytecode('nqp-setting.pbc');
}

# Copyright (C) 2011, Parrot Foundation.

# vim: expandtab shiftwidth=4 ft=perl6
