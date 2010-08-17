
# Copyright (C) 2010, Parrot Foundation.
# $Id$

class ProfTest::NQPProfile is ProfTest::PIRProfile;

method new($nqp_code, $canonical? = 1) {
    my $nqp_compiler := pir::compreg__ps("NQP-rx");
    my $pir_code     := $nqp_compiler.compile($nqp_code, :target('pir'));
    ProfTest::PIRProfile.new($pir_code, $canonical);
}

# Local Variables:
#   mode: perl6
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=perl
