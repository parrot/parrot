#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

class Tree::Pattern is Capture {
    sub patternize ($value) {
        unless (pir::can__IPS($value, 'ACCEPTS')) {
            if (pir::isa__IPP($value, Sub)) {
                $value := Tree::Pattern::Closure.new($value);
            } else {
                $value := Tree::Pattern::Constant.new($value);
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

    method transform ($node, $transform) {
        my &transSub;
        if ($transform ~~ PAST::Transformer) {
            &transSub := sub ($/) { $transformer.walk($/.from()); };
        } elsif (pir::does__iPS($transform, 'invokable')) {
            &transSub := $transform;
        } else {
            pir::die('$transform must be invokable or a PAST::Transformer.');
        }
        my $transformer :=
          Tree::Pattern::Transformer.new(self, &transSub);
        $transformer.walk($node);
    }

    method ACCEPTS ($node, *%opts) {
        my $global := ?%opts<g> || ?%opts<global>;
        my $pos := %opts<p> || %opts<pos>;
        pir::die("ACCEPTS cannot take both :global and :pos modifiers.")
            if $global && $pos;
        return self.ACCEPTSGLOBALLY($node) if $global;
        return self.ACCEPTSEXACTLY($pos) if $pos;
        my $/ := self.ACCEPTSEXACTLY($node);
        if (!$/ && pir::isa__iPP($node, Capture)) {
            my $index := 0;
            my $max := pir::elements__IP($node);
            until ($index == $max) {
                $/ := $node[$index] ~~ self;
                return $/ if $/;
                $index++;
            }
            $/ := Tree::Pattern::Match.new(0);
        }
        $/;
    }

    method ACCEPTSGLOBALLY ($node) {
        my $/;
        my $first := self.ACCEPTSEXACTLY($node);
        if (pir::isa__iPP($node, Capture)) {
            my $matches := ?$first;
            my $index := 0;
            my $max := pir::elements__IP($node);
            my $submatch;
            $/ := Tree::Pattern::Match.new(?$first);
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

INIT {
    pir::load_bytecode('Tree/Pattern/Match.pbc');

    pir::load_bytecode('Tree/Pattern/Any.pbc');
    pir::load_bytecode('Tree/Pattern/Closure.pbc');
    pir::load_bytecode('Tree/Pattern/Constant.pbc');

    pir::load_bytecode('Tree/Pattern/Transformer.pbc');
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
