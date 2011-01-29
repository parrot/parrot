#!nqp
class YAML::Tiny;

# The character class of all characters we need to escape
# NOTE: Inlined, since it's only used once
# my $RE_ESCAPE = '[\\x00-\\x08\\x0b-\\x0d\\x0e-\\x1f\"\n]';

# Printed form of the unprintable characters in the lowest range
# of ASCII characters, listed by ASCII ordinal position.
has @UNPRINTABLE := <
    z    x01  x02  x03  x04  x05  x06  a
    x08  t    n    v    f    r    x0e  x0f
    x10  x11  x12  x13  x14  x15  x16  x17
    x18  x19  x1a  e    x1c  x1d  x1e  x1f
>;

# Printable characters for escapes
has %UNESCAPES := hash(
    z => "\x00", a => "\x07", t    => "\x09",
    n => "\x0a", v => "\x0b", f    => "\x0c",
    r => "\x0d", e => "\x1b",
    #'\\' => '\\',
);

# Special magic boolean words
#has %QUOTE := map( -> $a { $a => 1; } <
#   null Null NULL
#   y Y yes Yes YES n N no No NO
#   true True TRUE false False FALSE
#   on On ON off Off OFF
#>);


method read_string($string) {
### my $self   = bless [], $class;
    my @result;

### eval {
###     unless ( defined $string ) {
###         pir::die \"Did not provide a string to load";
###     }
###
###     # Byte order marks
###     # NOTE: Keeping this here to educate maintainers
###     # my %BOM = (
###     #     "\357\273\277" => 'UTF-8',
###     #     "\376\377"     => 'UTF-16BE',
###     #     "\377\376"     => 'UTF-16LE',
###     #     "\377\376\0\0" => 'UTF-32LE'
###     #     "\0\0\376\377" => 'UTF-32BE',
###     # );
###     if ( $string =~ /^(?:\376\377|\377\376|\377\376\0\0|\0\0\376\377)/ ) {
###         pir::die \"Stream has a non UTF-8 BOM";
###     } else {
###         # Strip UTF-8 bom if found, we'll just ignore it
###         $string =~ s/^\357\273\277//;
###     }
###
###     # Try to decode as utf8
###     utf8::decode($string) if HAVE_UTF8;
###
###     # Check for some special cases
###     return $self unless length $string;
###     unless ( $string =~ /[\012\015]+\z/ ) {
###         pir::die \"Stream does not end with newline character";
###     }

    # Split the file into lines
    my @lines := #grep { ! /^\s*(?:\#.*)?\z/ }
             split(/\n/, $string).grep(-> $a { !($a ~~ /^^ \s* [\# .*]? $/) });

    # Strip the initial YAML header
###     @lines and $lines[0] =~ /^\%YAML[: ][\d\.]+.*\z/ and shift @lines;
    @lines.shift() if +@lines && @lines[0] ~~ /^^ \%YAML <[: ]> .* $/;

    # A nibbling parser
    while ( @lines ) {
        # Do we have a document header?
        if my $match := @lines[0] ~~ /^^\-\-\-\s*[(.+)\s*]?$/ {
            # Handle scalar documents
            @lines.shift;
            # if ( defined $1 and $1 !~ /^(?:\#.+|\%YAML[: ][\d\.]+)\z/ ) {
            if pir::defined($match) {
                @result.push(self._read_scalar( $match, [ undef ], @lines ));
                next;
            }
        }

        if !@lines || !(@lines[0] ~~ /^[\-\-\-|\.\.\.]/) {
            # A naked document
            @result.push(undef);
            while @lines && !(@lines[0] ~~ /^\-\-\-/) {
                @lines.shift;
            }

        } elsif @lines[0] ~~ /^\s*\-/ {
            # An array at the root
            my $document := [ ];
            @result.push($document);
            self._read_array( $document, [ 0 ], @lines );

        } elsif my $m := @lines[0] ~~ /^(\s*)\S/ {
            # A hash at the root
            my $document := { };
            @result.push($document);
            self._read_hash( $document, [ length($m) ], @lines );

        } else {
            pir::die("YAML::Tiny failed to classify the line '{ @lines[0] }'");
        }
    }
### };
### if ( ref $@ eq 'SCALAR' ) {
###     return $self->_error(${$@});
### } elsif ( $@ ) {
###     require Carp;
###     Carp::croak($@);
### }
###
### return $self;
    @result;
}

# Deparse a scalar string to the actual scalar
method _read_scalar($string, $indent, @lines) {
    pir::die("_read_scalar not implemented");
###    # Trim trailing whitespace
###    $string =~ s/\s*\z//;
###
###    # Explitic null/undef
###    return undef if $string eq '~';
###
###    # Single quote
###    if ( $string =~ /^\'(.*?)\'(?:\s+\#.*)?\z/ ) {
###        return '' unless defined $1;
###        $string = $1;
###        $string =~ s/\'\'/\'/g;
###        return $string;
###    }
###
###    # Double quote.
###    # The commented out form is simpler, but overloaded the Perl regex
###    # engine due to recursion and backtracking problems on strings
###    # larger than 32,000ish characters. Keep it for reference purposes.
###    # if ( $string =~ /^\"((?:\\.|[^\"])*)\"\z/ ) {
###    if ( $string =~ /^\"([^\\"]*(?:\\.[^\\"]*)*)\"(?:\s+\#.*)?\z/ ) {
###        # Reusing the variable is a little ugly,
###        # but avoids a new variable and a string copy.
###        $string = $1;
###        $string =~ s/\\"/"/g;
###        $string =~ s/\\([never\\fartz]|x([0-9a-fA-F]{2}))/(length($1)>1)?pack("H2",$2):$UNESCAPES{$1}/gex;
###        return $string;
###    }
###
###    # Special cases
###    if ( $string =~ /^[\'\"!&]/ ) {
###        pir::die \"YAML::Tiny does not support a feature in line '$string'";
###    }
###    return {} if $string =~ /^{}(?:\s+\#.*)?\z/;
###    return [] if $string =~ /^\[\](?:\s+\#.*)?\z/;
###
###    # Regular unquoted string
###    if ( $string !~ /^[>|]/ ) {
###        if (
###            $string =~ /^(?:-(?:\s|$)|[\@\%\`])/
###            or
###            $string =~ /:(?:\s|$)/
###        ) {
###            pir::die \"YAML::Tiny found illegal characters in plain scalar: '$string'";
###        }
###        $string =~ s/\s+#.*\z//;
###        return $string;
###    }
###
###    # Error
###    pir::die \"YAML::Tiny failed to find multi-line scalar content" unless @$lines;
###
###    # Check the indent depth
###    $lines->[0]   =~ /^(\s*)/;
###    $indent->[-1] = length("$1");
###    if ( defined $indent->[-2] and $indent->[-1] <= $indent->[-2] ) {
###        pir::die \"YAML::Tiny found bad indenting in line '$lines->[0]'";
###    }
###
###    # Pull the lines
###    my @multiline = ();
###    while ( @$lines ) {
###        $lines->[0] =~ /^(\s*)/;
###        last unless length($1) >= $indent->[-1];
###        push @multiline, substr(shift(@$lines), length($1));
###    }
###
###    my $j = (substr($string, 0, 1) eq '>') ? ' ' : "\n";
###    my $t = (substr($string, 1, 1) eq '-') ? ''  : "\n";
###    return join( $j, @multiline ) . $t;
}

# Parse an array
method _read_array($array, $indent, @lines) {
    pir::die("_read_array not implemented");
###    while ( @$lines ) {
###        # Check for a new document
###        if ( $lines->[0] =~ /^(?:---|\.\.\.)/ ) {
###            while ( @$lines and $lines->[0] !~ /^---/ ) {
###                shift @$lines;
###            }
###            return 1;
###        }
###
###        # Check the indent level
###        $lines->[0] =~ /^(\s*)/;
###        if ( length($1) < $indent->[-1] ) {
###            return 1;
###        } elsif ( length($1) > $indent->[-1] ) {
###            pir::die \"YAML::Tiny found bad indenting in line '$lines->[0]'";
###        }
###
###        if ( $lines->[0] =~ /^(\s*\-\s+)[^\'\"]\S*\s*:(?:\s+|$)/ ) {
###            # Inline nested hash
###            my $indent2 = length("$1");
###            $lines->[0] =~ s/-/ /;
###            push @$array, { };
###            $self->_read_hash( $array->[-1], [ @$indent, $indent2 ], $lines );
###
###        } elsif ( $lines->[0] =~ /^\s*\-(\s*)(.+?)\s*\z/ ) {
###            # Array entry with a value
###            shift @$lines;
###            push @$array, $self->_read_scalar( "$2", [ @$indent, undef ], $lines );
###
###        } elsif ( $lines->[0] =~ /^\s*\-\s*\z/ ) {
###            shift @$lines;
###            unless ( @$lines ) {
###                push @$array, undef;
###                return 1;
###            }
###            if ( $lines->[0] =~ /^(\s*)\-/ ) {
###                my $indent2 = length("$1");
###                if ( $indent->[-1] == $indent2 ) {
###                    # Null array entry
###                    push @$array, undef;
###                } else {
###                    # Naked indenter
###                    push @$array, [ ];
###                    $self->_read_array( $array->[-1], [ @$indent, $indent2 ], $lines );
###                }
###
###            } elsif ( $lines->[0] =~ /^(\s*)\S/ ) {
###                push @$array, { };
###                $self->_read_hash( $array->[-1], [ @$indent, length("$1") ], $lines );
###
###            } else {
###                pir::die \"YAML::Tiny failed to classify line '$lines->[0]'";
###            }
###
###        } elsif ( defined $indent->[-2] and $indent->[-1] == $indent->[-2] ) {
###            # This is probably a structure like the following...
###            # ---
###            # foo:
###            # - list
###            # bar: value
###            #
###            # ... so lets return and let the hash parser handle it
###            return 1;
###
###        } else {
###            pir::die \"YAML::Tiny failed to classify line '$lines->[0]'";
###        }
###    }
###
###    return 1;
}

# Parse an array
method _read_hash($hash, $indent, @lines) {
    pir::die("_read_hash not implemented");
###
###    while ( @$lines ) {
###        # Check for a new document
###        if ( $lines->[0] =~ /^(?:---|\.\.\.)/ ) {
###            while ( @$lines and $lines->[0] !~ /^---/ ) {
###                shift @$lines;
###            }
###            return 1;
###        }
###
###        # Check the indent level
###        $lines->[0] =~ /^(\s*)/;
###        if ( length($1) < $indent->[-1] ) {
###            return 1;
###        } elsif ( length($1) > $indent->[-1] ) {
###            pir::die \"YAML::Tiny found bad indenting in line '$lines->[0]'";
###        }
###
###        # Get the key
###        unless ( $lines->[0] =~ s/^\s*([^\'\" ][^\n]*?)\s*:(\s+(?:\#.*)?|$)// ) {
###            if ( $lines->[0] =~ /^\s*[?\'\"]/ ) {
###                pir::die \"YAML::Tiny does not support a feature in line '$lines->[0]'";
###            }
###            pir::die \"YAML::Tiny failed to classify line '$lines->[0]'";
###        }
###        my $key = $1;
###
###        # Do we have a value?
###        if ( length $lines->[0] ) {
###            # Yes
###            $hash->{$key} = $self->_read_scalar( shift(@$lines), [ @$indent, undef ], $lines );
###        } else {
###            # An indent
###            shift @$lines;
###            unless ( @$lines ) {
###                $hash->{$key} = undef;
###                return 1;
###            }
###            if ( $lines->[0] =~ /^(\s*)-/ ) {
###                $hash->{$key} = [];
###                $self->_read_array( $hash->{$key}, [ @$indent, length($1) ], $lines );
###            } elsif ( $lines->[0] =~ /^(\s*)./ ) {
###                my $indent2 = length("$1");
###                if ( $indent->[-1] >= $indent2 ) {
###                    # Null hash entry
###                    $hash->{$key} = undef;
###                } else {
###                    $hash->{$key} = {};
###                    $self->_read_hash( $hash->{$key}, [ @$indent, length($1) ], $lines );
###                }
###            }
###        }
###    }
###
###    return 1;
}


INIT {
    pir::load_bytecode("nqp-setting.pbc");
}

# vim: ft=perl6
