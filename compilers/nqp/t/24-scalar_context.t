#!./parrot nqp.pbc

# scalar context

plan(1);

class XYZ {
    method ast() {
        'ok 1';
    }
}


my $xyz := XYZ.new();

say( $( $xyz ) );
