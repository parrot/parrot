#!./parrot

# list context

plan(1);

class XYZ {
    method get_array() {
        'ok ', '1';
    }
}


my $xyz := XYZ.new();

for @( $xyz ) {
    print( $_ );
}
print( "\n" );
