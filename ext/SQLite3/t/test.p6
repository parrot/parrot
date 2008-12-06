use DBDI;
use Test;

plan 7;

my $conn = DBDI::DriverManager.getConnection("dbdi:SQLite3:test.db", "", "");
isa_ok($conn, DBDI::Driver::SQLite3);
my $stm = $conn.createStatement();
isa_ok($stm, DBDI::Statement);
my $rs = $stm.executeUpdate("CREATE TABLE foo (bar, baz)");
### I'd also add a test that a SELECT works and returns 0 rows

try {
    $rs = $stm.executeUpdate("CREATE TABLE foo (bar, baz)");
};
ok($! eq "table foo already exists", "Can't create again (and did create first time)");
my $stm = $conn.prepareStatement("INSERT INTO foo (bar, baz) VALUES (?, ?)");
isa_ok( $stm, DBDI::PreparedStatement);
$stm.bind(1, 123);
$stm.bind(2, "Thingy");
$stm.executeUpdate();
### is( $stm->rowsAffected, 1, 'Inserted one row' );

my $stm2 = $conn.createStatement();
my $rs = $stm2.executeQuery("SELECT baz, bar FROM foo");
while ($rs.next()) {
    ok(($rs.getCol("baz") eq "Thingy"), "baz == Thingy");
    ok(($rs.getCol(1) = 123), "col1 == 123");
    try { 
        $rs.getCol("bas");
    };
    ok($! eq "Couldn't find column bas", "Non-existent columns");
}

# vim: ft=perl6:
