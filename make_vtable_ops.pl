use Parrot::Vtable;
my %vtable = parse_vtable();

print "VERSION = 0.3;\n\n";

while (<DATA>) {
    next if /^#/ or /^$/;
    my @params = split;
    my $argc = $params[0];
    my $op = $params[1];
    my $vtable_entry = $params[2] || $op;
    die "Can't find $vtable_entry in vtable, line $.\n"
        unless exists $vtable{$vtable_entry};
    for (multimethod($vtable_entry, $argc)) {
        my $args  = $_->[0];
        my $entry = $_->[1];
        print "inline op $params[1] ($args) {\n";
        print "  (\$2->vtable->$entry";
        print ")(interpreter, ";
        if ($params[0] == 3) {
            # Three-address function
            print '$2,$3,$1';
        } elsif ($params[0] == 2) {
            # Unary function
            print '$2,$1';
        }
        print ");\n  goto NEXT();\n}\n\n";
    }
}

sub multimethod {
    my ($name, $count) = @_; 
    my $type = $vtable{$name}{meth_type};
    die "$name not found\n" unless $vtable{$name};
    my @rv = [(join ",", ("p") x $count), $name];

    if ($type eq "int") {
        push @rv, 
            [ (join ",", ("p", ("p") x ($count-2), "i|ic")), $name."_native"];
    }
    if ($type eq "num") {
        push @rv, 
            [ (join ",", ("p", ("p") x ($count-2), "n|nc")), $name."_float"],
            [ (join ",", ("p", ("p") x ($count-2), "i|ic")), $name."_int"];
    }
    if ($type eq "str") {
        push @rv, 
            [ (join ",", ("p", ("p") x ($count-2), "s")), $name."_native"];
    }
        
    return @rv;
}


__DATA__
# Three-address functions
3 add
3 sub subtract
3 mul multiply
3 div divide
3 mod modulus
3 concat concatenate
3 and logical_and
3 or logical_or
# Unary functions
2 not logical_not
