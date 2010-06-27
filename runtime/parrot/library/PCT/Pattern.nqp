#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

INIT {
    pir::load_bytecode('Tree/Pattern.pbc');
    pir::load_bytecode('PCT.pbc');
}

module PCT::Node {
    method match ($pattern, *%options) {
        $pattern.ACCEPTS(self, |%options);
    }

    method subst ($pattern, *%options) {
        $pattern.transform(self, |%options);
    }
}

class PCT::Pattern is Tree::Pattern {
    method new_subtype ($name, $targetClass, *%adverbs) {
        my $parent := %adverbs<parent> || self;
        my $class := P6metaclass.new().new_class($name, :parent($parent));
        
        my @attributes := %adverbs<attr> || [];

        for (@attributes) {
            $class.HOW().add_method($class, $_,
                                    sub ($value?) {
                                        self.attr($_, $value,
                                                  pir::defined__iP($value));
                                    });
        }

        my &ACCEPTSEXACTLY := method ($node) {
            return Tree::Pattern::Match.new(0)
              unless pir::isa__iPP($node, $targetClass);
            my $/ := Tree::Pattern::Match.new(1);
            self.check_children($node, $/);
            for @attributes {
                last unless self.check_attribute($node, $_, $/);
            }
            if self ~~ PAST::Pattern {
                self.check_past_node_attributes($node, $/);
            }
            elsif self ~~ POST::Pattern {
                self.check_post_node_attributes($node, $/);
            }
            else {
                self.check_pct_node_attributes($node, $/);
            }
            $/.from($node) if $/;
            $/;
        }

        $class.HOW().add_method($class, 'ACCEPTSEXACTLY', &ACCEPTSEXACTLY);
    }

    method new (*@children, *%attrs) {
        my $result := Q:PIR {
            $P0 = self.'HOW'()
            $P0 = getattribute $P0, 'parrotclass'
            %r = new $P0
        };

        for %attrs {
            $result.attr($_, %attrs{$_}, 1);
        }
        for @children {
            pir::push($result, Tree::Pattern::patternize($_));
        }
        $result;
    }

    method attr ($name, $value, $has_value) {
        my $result;
        if ($has_value) {
            self{$name} := Tree::Pattern::patternize($value);
        } else {
            $result := self{$name};
        }
        $result;
    }

    method name ($val?) {
        self.attr("name", $val, !pir::isnull__iP($val));
    }

    method source ($val?) {
        self.attr("source", $val, !pir::isnull__iP($val));
    }

    method pos ($val?) {
        self.attr("pos", $val, !pir::isnull__iP($val));
    }

    method check_attribute ($node, $attribute, $/) {
        my $pAttr := self.attr($attribute, null, 0);
        unless pir::defined__IP($pAttr) {
            return 1;
        }
        my $nAttr := $node.attr($attribute, null, 0);
        my $result := 
          ($pAttr ~~ Tree::Pattern
           ?? $pAttr.ACCEPTS($nAttr, :p($nAttr))
           !! $nAttr ~~ $pAttr);
        if ($result) {
            $/{$attribute} := $result;
        }
        else {
            $/.success(0);
        }
        $result;
    }

    method check_children ($node, $/) {
        my $pLen := pir::elements(self);
        my $nLen := pir::elements($node);
        my $pChild;
        my $nChild;
        my $result;
        my $index;
        if $pLen == 0 {
            $result := 1;
        }
        elsif ($pLen == $nLen) {
            $index := 0;
            while ($index < $pLen) {
                $nChild := $node[$index];
                $pChild := self[$index];
                if ($result := 
                    ($pChild ~~ Tree::Pattern
                     ?? $pChild.ACCEPTS($nChild, :p($nChild))
                     !! $nChild ~~ $pChild)) {
                    $/[$index] := $result;
                }
                else {
                    $/.success(0);
                    return 0;
                }
                $index++;
            }
            $result := 1;
        }
        else {
            $/.success(0);
            $result := 0;
        }
        $result;
    }

    method check_pct_node_attributes ($node, $/) {
        (self.check_attribute($node, "name", $/)
         && self.check_attribute($node, "source", $/)
         && self.check_attribute($node, "pos", $/));
        $/;
    }
}

INIT {
    pir::load_bytecode('PAST/Pattern.pbc');
    pir::load_bytecode('POST/Pattern.pbc');
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
