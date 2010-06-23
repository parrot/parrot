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

    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
