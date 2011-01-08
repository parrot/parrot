module POST::Sub;

=item C<symtable>
Get whole symtable. Used in register allocator.

our method symtable() {
    self<symtable>;
}

=item C<symbol($name, $value?)
Get or set variable used in POST::Sub.

our method symbol($name, $value?) {
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

our method labels() {
    self<labels>;
}

=item C<symbol($name, $value?)
Get or set variable used in POST::Sub.

our method label($name, $value?) {
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

our method param($name, POST::Register $param) {
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

our multi method constant_index() { self<constant_index>; }
our multi method constant_index($idx) { self<constant_index> := $idx; $idx }

=Modifiers
Various sub modifiers.

=item C<namespace>
=item C<hll>
=item C<outer>
=item C<multi>
=item C<subid>
Declared in "old" POST.

our multi method main()     { self<main> // 0 }
our multi method main($val) { self<main> := ?$val }

# XXX Conflict with PCT::Node.init.
our multi method is_init()     { self<init> // 0 }
our multi method is_init($val) { self<init> := ?$val }

our multi method load()     { self<load> // 0 }
our multi method load($val) { self<load> := ?$val }

our multi method immediate()     { self<immediate> // 0 }
our multi method immediate($val) { self<immediate> := ?$val }

our multi method postcomp()     { self<postcomp> // 0 }
our multi method postcomp($val) { self<postcomp> := ?$val }

our multi method anon()     { self<anon> // 0 }
our multi method anon($val) { self<anon> := ?$val }

our multi method is_method()     { self<method> // 0 }
our multi method is_method($val) { self<method> := ?$val }

our multi method lex()        { self<lex> // 0 }
our multi method lex($val)    { self<lex> := ?$val }


our multi method nsentry()     { self<nsentry> }
our multi method nsentry($val) { self<nsentry> := $val }

our multi method vtable()     { self<vtable> // -1 }
our multi method vtable($val) { self<vtable> := $val; $val }

our method set_flag($name, $val) { self{$name} := $val; $val }

=end

our method full_name() {
    if self<namespace> {
        self<namespace>.Str ~ self.name
    }
    else {
        self.name;
    }
};

INIT {
    pir::load_bytecode('nqp-setting.pbc');
}

# vim: ft=perl6
