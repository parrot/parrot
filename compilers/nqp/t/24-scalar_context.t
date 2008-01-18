#!./parrot

# scalar context

plan(1);

class XYZ {
    method get_scalar() {
        'ok 1';
    }
}


my $xyz := XYZ.new();

say( $( $xyz ) );
