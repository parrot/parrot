class POST::Key is POST::Value;

=begin Description
This stub class (almost) exists to give a unique class for mmd in POST::Compiler::to_pbc.

A POST::Key represents a single (possibly compound) key such as [1] or ['Foo';'Bar';'Buz'].
=end Description

our method Str() {
    '[' ~ @(self).map(sub($p) { $p<value> }).join(';') ~ ']';
}

=item C<to_pmc>
Convert POST::Key to Key PMC. C<$constants> is C<PackfileConstantTable> for storing
string parts.

# Key flags:
# KEY_integer_FLAG        = PObj_private0_FLAG == 0x01
# KEY_number_FLAG         = PObj_private1_FLAG == 0x02
# KEY_string_FLAG         = PObj_private2_FLAG == 0x04
# KEY_pmc_FLAG            = PObj_private3_FLAG == 0x08
# KEY_register_FLAG       = PObj_private4_FLAG == 0x10

# This method is so ugly due workaround for PCC "mis-behavior".
# PCC will try to clone fresh Key which can reference non-existing 
# registers, etc.
our method to_pmc(%context) {
    my @keys;
    my $constants := %context<constants>;

    for @(self) -> $part {
        my $type := $part.type;

        # If there is not type - lookup for symbol.
        unless $type {
            $type := %context<sub>.symbol($part.name).type;
        }

        pir::die("Can't find type for { $part.name }") unless $type;

        if $type eq 'sc' {
            my $k := pir::new__ps('Key');
            $k.set_str(~$part.value);
            $constants.get_or_create_string($part.value);
            @keys.push($k);
        }
        elsif $type eq 'ic' {
            my $k := pir::new__ps('Key');
            $k.set_int(+$part.value);
            @keys.push($k);
        }
        elsif $type eq 's' {
            my $k := pir::new__ps('Key');
            my $regno := %context<sub>.symbol($part.name).regno;
            $k.set_register($regno, 0x04);
            # PCC...
            #@keys.push($k);
            Q:PIR {
                .local pmc keys, k
                find_lex keys, "@keys"
                find_lex k, "$k"
                push keys, k
            };
        }
        elsif $type eq 'i' {
            my $k := pir::new__ps('Key');
            my $regno := %context<sub>.symbol($part.name).regno;
            $k.set_register($regno, 0x01);
            # PCC...
            #@keys.push($k);
            Q:PIR {
                .local pmc keys, k
                find_lex keys, "@keys"
                find_lex k, "$k"
                push keys, k
            };
        }
        else {
            pir::die("unknown key type: { $type }");
        }
    }

    # XXX PCC will try to .clone fresh key. Which is totally wrong-wrong-wrong.
    my $key_pmc;
    if +@keys {
        Q:PIR {
            .local pmc keys, key_pmc
            find_lex keys, "@keys"
            find_lex key_pmc, "$key_pmc"
            key_pmc = shift keys
            store_lex "$key_pmc", key_pmc
        };

        while +@keys {
            # PCC...
            # $key_pmc.push(@keys.shift);
            Q:PIR {
                .local pmc keys, key_pmc, k
                find_lex keys, "@keys"
                find_lex key_pmc, "$key_pmc"
                k = shift keys
                push key_pmc, k
            };
        }
    }

    my @res;
    Q:PIR {
        .local pmc key_pmc, res
        find_lex res, "@res"
        find_lex key_pmc, "$key_pmc"
        push res, key_pmc
    };

    @res;
}

# vim: ft=perl6
