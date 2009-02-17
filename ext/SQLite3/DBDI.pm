# Basic Perl 6 database layer
# $Id$
# Copyright (C) 2008 Parrot Foundation

use v6;

class DBDI::DriverManager {
    method getConnection($url, $login, $password) {
        my $c1 = $url.index(":");
        my $schema = substr($url, 0, $c1);
        if ($schema ne "dbdi") { die "Unknown schema "~$schema }
        my $rurl = substr($url, $c1+1);
        #say "Remainder was "~$rurl;

        my $c2 = $rurl.index(":");
        my $driver = "DBDI::Driver::"~substr($rurl, 0, $c2);
        eval "use "~$driver;
        if ($!) { die "Couldn't load "~$driver~": "~$!; }

        my $r = substr($rurl, $c2+1);
        return (eval $driver).getConnection($r, $login, $password);
        #return ::($driver).getConnection($r, $login, $password);
    }
}

class DBDI::Driver { }
class DBDI::Statement { }
class DBDI::PreparedStatement { }

class DBDI::ResultSet {
    has $.statement;
    method next() { return $.statement.next(); }
    multi method getCol(Num $col) {
        $.statement.getCol($col);
    }
    multi method getCol(Str $col) {
        my $n = $.statement.lookupCol($col);
        if ($n > -1) { return self.getCol($n) }
        die "Couldn't find column "~$col;
    }
}
