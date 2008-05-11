#!./parrot nqp.pbc

# scalar context

plan(1);

class XYZ {
    method item() {
        'ok 1';
    }
}


my $xyz := XYZ.new();

say( $( $xyz ) );
