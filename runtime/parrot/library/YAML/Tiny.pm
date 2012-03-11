#!nqp
# Copyright (C) 2011, Parrot Foundation.

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
###     }
###     else {
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
    while +@lines {
        debug("Current result", |@result);
        debug("Handling", @lines[0]);

        # Do we have a document header?
        if my $match := @lines[0] ~~ /^^\-\-\-\s*[(.+)\s*]?$/ {
            debug("Header", $match);
            # Handle scalar documents
            @lines.shift;
            # if ( defined $1 and $1 !~ /^(?:\#.+|\%YAML[: ][\d\.]+)\z/ ) {
            # match[0] is RPA. Get first element.
            if +$match[0] {
                @result.push(self._read_scalar( ~$match[0][0], [ undef ], @lines ));
                next;
            }
        }

        debug("Lines", @lines);

        if !@lines || (@lines[0] ~~ /^['---'|'...']/) {
            debug("Naked", @lines);
            # A naked document
            @result.push(undef);
            while @lines && !(@lines[0] ~~ /^'---'/) {
                @lines.shift;
            }

        }
        elsif @lines[0] ~~ /^\s*\-/ {
            debug("Array", $match);
            # An array at the root
            my $document := [ ];
            @result.push($document);
            self._read_array( $document, [ 0 ], @lines );

        }
        elsif my $m := @lines[0] ~~ /^(\s*)\S/ {
            debug("Hash", $match);
            # A hash at the root
            my %document;
            @result.push(%document);
            self._read_hash( %document, [ length($m[0][0]) ], @lines );
            debug("Got hash", %document);
        }
        else {
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
    debug("RESULT", |@result);

    @result;
}

# Deparse a scalar string to the actual scalar
method _read_scalar($string, $indent, @lines) {
    debug("_read_scalar", $string);
   # Trim trailing whitespace
   $string := subst($string, /\s*$/, '');

   # Explitic null/undef
   return undef if $string eq '~';

   # Single quote
   my $match := $string ~~ /^\'(.*?)\'[\s+\#.*]?$/;
   if $match {
       debug("Match", $match);
       return '' unless pir::defined($match[0]);
       $string := ~$match[0];
       $string := subst($string, /\'\'/, "'", :global<1>);
       return $string;
   }

    # Double quote.
    # The commented out form is simpler, but overloaded the Perl regex
    # engine due to recursion and backtracking problems on strings
    # larger than 32,000ish characters. Keep it for reference purposes.
    if my $m := $string ~~ /^\" ([\\.|<-[\"]>]*) \" [\s+\#.*]?$/ {
###    if ( $string =~ /^\"([^\\"]*(?:\\.[^\\"]*)*)\"(?:\s+\#.*)?\z/ ) {
        # Reusing the variable is a little ugly,
        # but avoids a new variable and a string copy.
        debug("Double match", $m);
        $string := ~$m[0];
        $string := subst($string, /\\\"/, '"', :global<1>);
        #$string =~ s/\\([never\\fartz]|x([0-9a-fA-F]{2}))/(length($1)>1)?pack("H2",$2):$UNESCAPES{$1}/gex;
        return $string;
    }

    # Special cases
    if $string ~~ /^<[\'\"!&]>/ {
        pir::die("YAML::Tiny does not support a feature in line '$string'");
    }
    return {} if $string ~~ /^{}[\s+\#.*]?$/;
    return [] if $string ~~ /^\[\][\s+\#.*]?$/;

    # Regular unquoted string
    if !($string ~~ /^[ '>' | '|' ]/) {
        #if (
        #    $string =~ /^(?:-(?:\s|$)|[\@\%\`])/
        #   or
        #   $string =~ /:(?:\s|$)/
        #) {
        #    pir::die("YAML::Tiny found illegal characters in plain scalar: '{ $string }'");
        #}
        $string := subst($string, /\s+\#.*$/, '');
        return $string;
    }

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
    pir::die("_read_scalar not implemented for '{ $string }' string");
}

# Parse an array
method _read_array(@array, @indent, @lines) {

    while ( @lines ) {
        debug("_read_array", @lines[0]);

        # Check for a new document
        if @lines[0] ~~ /^['---'| '...' ]/ {
            while @lines && !(@lines[0] ~~ /^'---'/ ) {
                @lines.shift;
            }
            return 1;
        }

        # Check the indent level
        my $m := @lines[0] ~~ /^(\s*)/;
        debug("Indenting", $m, @indent);
        if ( length($m[0]) < @indent[-1] ) {
            return 1;
        } elsif ( length($m[0]) > @indent[-1] ) {
            pir::die("YAML::Tiny found bad indenting in line '{ @lines[0] }'");
        }

        if $m := @lines[0] ~~ /^ (\s*\-\s+) <-[\'\"]> \S*\s* ':' [\s+|$]/ {
            # Inline nested hash
            debug("Inline nested hash", $m);
            my $indent2 := length($m[0]);
            subst(@lines[0], /'-'/, ' ');
            @array.push(hash());
            self._read_hash( @array[-1], [ @indent, $indent2 ], @lines );
        }
        elsif $m := @lines[0] ~~ /^\s* \- (\s*) (.+?) \s* $/ {
            # Array entry with a value
            @lines.shift;
            @array.push(self._read_scalar( ~$m[1], [ @indent, undef ], @lines ));
        }
        elsif $m := @lines[0] ~~ /^\s*\-\s*$/ {
            @lines.shift;
            unless @lines {
                @array.push(undef);
                return 1;
            }

            if $m := @lines[0] ~~ /^(\s*)\-/ {
                my $indent2 := length($m[0]);
                if @indent[-1] == $indent2 {
                    # Null array entry
                    @array.push(undef);
                }
                else {
                    # Naked indenter
                    @array.push([ ]);
                    self._read_array( @array[-1], [ @indent, $indent2 ], @lines );
                }

            }
            elsif $m := @lines[0] ~~ /^(\s*)\S/ {
                @array.push(hash());
                self._read_hash( @array[-1], [ @indent, length($m[0]) ], @lines );

            }
            else {
                pir::die("YAML::Tiny failed to classify line '{ @lines[0] }'");
            }
        }
        elsif (@indent > 1) && (@indent[-1] == @indent[-2]) {
            # This is probably a structure like the following...
            # ---
            # foo:
            # - list
            # bar: value
            #
            # ... so lets return and let the hash parser handle it
            return 1;
        }
        else {
            pir::die("YAML::Tiny failed to classify line '{ @lines[0] }'");
        }
    }

    1;
}

# Parse an array
method _read_hash(%hash, @indent, @lines) {

    while +@lines {
        # Check for a new document
        if @lines[0] ~~ /^['---'| '...' ]/ {
            while @lines && !(@lines[0] ~~ /^'---'/ ) {
                @lines.shift;
            }
            return 1;
        }

        # Check the indent level
        my $m := @lines[0] ~~ /^(\s*)/;
        debug("Indenting", $m, @indent[-1], @indent);
        if length($m[0]) < @indent[-1] {
            return 1;
        }
        elsif length($m[0]) > @indent[-1] {
            pir::die("YAML::Tiny found bad indenting in line '{ @lines[0] }'");
        }

        # Get the key
        $m := @lines[0] ~~ /^\s* (<-[\'\"\ ]>\N*?) \s* ':' [\s+[\#.*]?|$]/;
        #unless ( $lines->[0] =~ s/^\s*([^\'\" ][^\n]*?)\s*:(\s+(?:\#.*)?|$)// ) {
        #    if ( $lines->[0] =~ /^\s*[?\'\"]/ ) {
        #        pir::die \"YAML::Tiny does not support a feature in line '$lines->[0]'";
        #    }
        #    pir::die \"YAML::Tiny failed to classify line '$lines->[0]'";
        #}
        debug("Match", @lines[0], $m);
        @lines[0] := subst(@lines[0], /^\s* (<-[\'\"]>\N*?) \s* ':' (\s+[\#.*]?|$)/, '');
        debug("Line", @lines[0]);

        my $key := ~$m[0];

        # Do we have a value?
        if length(@lines[0]) {
            # Yes
            debug("Reading scalar", @lines[0]);
            %hash{$key} := self._read_scalar( @lines.shift, [ @indent, undef ], @lines );
            debug("Done", %hash);
        }
        else {
            # An indent
            @lines.shift;
            unless @lines {
                %hash{$key} := undef;
                return 1;
            }

            if $m := @lines[0] ~~ /^(\s*)\-/ {
                %hash{$key} := list();
                self._read_array( %hash{$key}, [ @indent, length($m[0]) ], @lines );
            }
            elsif $m := @lines[0] ~~ /^(\s*)./ {
                debug("Deeper", $m);
                my $indent2 := length($m[0]);
                if ( @indent[-1] >= $indent2 ) {
                    # Null hash entry
                    %hash{$key} := undef;
                }
                else {
                    %hash{$key} := {};
                    self._read_hash( %hash{$key}, [ @indent, length($m[0]) ], @lines );
                }
            }
        }
    }

    1;
}

method write_string($document) {
    "---" ~ self._dump("", $document);
}

multi method _dump($indent, ResizablePMCArray @list) {
    my @items := map(-> $_ {
        $indent ~ '-' ~ self._dump('  ' ~ $indent, $_);
    }, |@list);

    "\n" ~ join("\n", |@items);
}

multi method _dump($indent, Hash %hash) {
    "\n" ~ join("\n", |map(-> $k { $indent ~ $k ~ ': ' ~ self._dump('  ' ~ $indent, %hash{$k}) }, |%hash.keys));
}

multi method _dump($indent, String $value) {
    " '" ~ subst($value, /\'/, "''", :global) ~ "'";
}

multi method _dump($indent, $value) {
    ' ' ~ $value;
}


our $DEBUG;
sub debug($message, *@params) {
    if $DEBUG {
        print("$message: ");
        _dumper(@params);
    }
}

sub length($s) { pir::length($s) }

INIT {
    my $pbc := pir::load_bytecode__ps("nqp-setting.pbc");
    for $pbc.subs_by_tag('load') -> $sub { $sub(); }
    $pbc := pir::load_bytecode__ps("dumper.pbc");
    for $pbc.subs_by_tag('load') -> $sub { $sub(); }
}

# vim: ft=perl6
