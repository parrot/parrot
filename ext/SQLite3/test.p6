use DBDI;
my $conn = DBDI::DriverManager.getConnection("dbdi:SQLite3:test.db", "", "");
my $stm = $conn.createStatement();
my $rs = $stm.executeUpdate("CREATE TABLE foo (bar, baz)");

my $stm = $conn.prepareStatement("INSERT INTO foo (bar, baz) VALUES (?, ?)");
$stm.bind(1, 123);
$stm.bind(2, "Thingy");
$stm.executeUpdate();

my $stm2 = $conn.createStatement();
my $rs = $stm2.executeQuery("SELECT baz, bar FROM foo");
while ($rs.next()) {
    say $rs.getCol(1);
    say $rs.getCol("baz");
}
