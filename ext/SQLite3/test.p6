use SQLite3;
our $db := SQLite::open("test.db");
our $st := SQLite::prepare($db, "CREATE TABLE foo (bar)");
SQLite::step($st);
SQLite::finalize($st);
