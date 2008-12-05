# Andy the time-strapped test fairy says:
# If this were Perl 5, I'd put in tests roughly like the following:
use DBDI;
use Test;

plan 5;

my $conn = DBDI::DriverManager.getConnection("dbdi:SQLite3:test.db", "", "");
isa_ok($conn, DBDI::Driver::SQLite3);
my $stm = $conn.createStatement();
isa_ok($stm, DBDI::Statement);
my $rs = $stm.executeUpdate("CREATE TABLE foo (bar, baz)");
### ok( $rs->success, 'Created foo OK');
### I'd also add a test that a SELECT works and returns 0 rows

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
    #say $rs.getCol("bas"); #segfaults
}

# vim: ft=perl6:
