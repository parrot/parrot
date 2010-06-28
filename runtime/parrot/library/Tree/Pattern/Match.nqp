#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

class Tree::Pattern::Match is Capture {
    has $!success;
    has $!ast;
    has $!orig;

    method new ($success?, $orig?) {
        my $self := Q:PIR {
            $P0 = self.'HOW'()
            $P0 = getattribute $P0, 'parrotclass'
            %r = new $P0
        };
        $self.success($success);
        $self.orig($orig);
        $self;
    }

    method Bool () {
        ?self;
    }

    method ast () {
        pir::getattribute__PPS(self, '$!ast');
    }

    method from ($from?) {
        self.orig($from);
    }

    method orig ($orig?) {
        my $result;
        if pir::defined__IP($orig) {
            pir::setattribute(self, ~'$!orig', $orig);
        }
        else {
            $result := pir::getattribute__PPS(self, '$!orig');
        }
        $result;
    }

    method success ($success?) {
        my $result;
        if pir::defined__IP($success) {
            pir::setattribute(self, ~'$!success', $success);
        }
        else {
            $result := pir::getattribute__PPS(self, '$!success');
        }
        $result;
    }
}

INIT {
    my $pc :=
      pir::getattribute__PPS(Tree::Pattern::Match.HOW(), "parrotclass");
    $pc.add_vtable_override("get_bool", 
                            method () {
                                ?pir::getattribute__PPS(self,
                                                        '$!success');
                            });

    $pc.add_method("!make",
                   method ($ast) {
                       pir::setattribute(self,  ~'$!ast', $ast);
                   });
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
