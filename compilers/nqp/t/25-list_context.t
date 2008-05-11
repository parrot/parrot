#!./parrot nqp.pbc

# list context

plan(1);

class XYZ {
    method list() {
        'ok ', '1';
    }
}


my $xyz := XYZ.new();

for @( $xyz ) {
    print( $_ );
}
print( "\n" );
