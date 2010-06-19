#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

INIT {
    pir::load_bytecode('PAST/Transformer.pbc');
}

class PAST::Pattern is Capture {
    sub patternize ($value) {
        unless (pir::can__IPS($value, 'ACCEPTS')) {
            if (pir::isa__IPP($value, Sub)) {
                $value := PAST::Pattern::Closure.new($value);
            } else {
                $value := PAST::Pattern::Constant.new($value);
            }
        }
        $value;
    }

    method attr ($name, $value, $has_value) {
        my $result;
        if ($has_value) {
            self{$name} := $value;
        } else {
            $result := self{$name};
        }
        $result;
    }

    method transform ($past, $transform) {
        my &transSub;
        if ($transform ~~ PAST::Transformer) {
            &transSub := sub ($/) { $transformer.walk($/.from()); };
        } elsif (pir::does__iPS($transform, 'invokable')) {
            &transSub := $transform;
        } else {
            pir::die('$transform must be invokable or a PAST::Transformer.');
        }
        my $transformer :=
          PAST::Pattern::Transformer.new(self, &transSub);
        $transformer.walk($past);
    }

    method ACCEPTS ($node, *%opts) {
        my $global := ?%opts<g> || ?%opts<global>;
        my $pos := %opts<p> || %opts<pos>;
        pir::die("ACCEPTS cannot take both :global and :pos modifiers.")
            if $global && $pos;
        return self.ACCEPTSGLOBALLY($node) if $global;
        return self.ACCEPTSEXACTLY($pos) if $pos;
        my $/ := self.ACCEPTSEXACTLY($node);
        if (!$/ && ($node ~~ PAST::Node)) {
            my $index := 0;
            my $max := pir::elements__IP($node);
            until ($index == $max) {
                $/ := $node[$index] ~~ self;
                return $/ if $/;
                $index++;
            }
            $/ := PAST::Pattern::Match.new(0);
        }
        $/;
    }

    method ACCEPTSGLOBALLY ($node) {
        my $/;
        my $first := self.ACCEPTSEXACTLY($node);
        if ($node ~~ PAST::Node) {
            my $matches := ?$first;
            my $index := 0;
            my $max := pir::elements__IP($node);
            my $submatch;
            $/ := PAST::Pattern::Match.new(?$first);
            $/[0] := $first if $first;
            until ($index == $max) {
                $submatch := self.ACCEPTS($node[$index], :g);
                if ($submatch) {
                    $/.success(1) unless $matches;
                    if pir::defined__iP($submatch.from()) {
                        $/[$matches++] := $submatch;
                    }
                    else { # The submatch is a list of multiple matches.
                        my $subIndex := 0;
                        my $subMax := pir::elements__IP($submatch);
                        until ($subIndex == $subMax) {
                            $/[$matches++] := $submatch[$subIndex];
                            $subIndex++;
                        }
                    }
                }
                $index++;
            }
            $/ := $/[0] if $matches == 1;
        }
        else {
            $/ := $first;
        }
        $/;
    }
}

module PAST::Node {
    method match ($pattern, *%options) {
        $pattern.ACCEPTS(self, |%options);
    }

    method subst ($pattern, *%options) {
        $pattern.transform(self, |%options);
    }
}

INIT {
    pir::load_bytecode('PAST/Pattern/Match.pbc');

    pir::load_bytecode('PAST/Pattern/Closure.pbc');
    pir::load_bytecode('PAST/Pattern/Constant.pbc');
    pir::load_bytecode('PAST/Pattern/Node.pbc');

    pir::load_bytecode('PAST/Pattern/Any.pbc');

    pir::load_bytecode('PAST/Pattern/Transformer.pbc');
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
