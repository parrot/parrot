# SQLite3 Database Backend for DBDI
# $Id$
# Copyright (C) 2008 Parrot Foundation

use v6;

use SQLite3;
use DBDI;

class DBDI::Driver::SQLite3 is DBDI::Driver {
    has $dbHandle;
    # This bit of hackery is to get around the fact that you can't use
    # $foo = <pointer>, only $foo := <pointer>
    method dbHandle { return $dbHandle }

    method getConnection ($db, $username, $password) {
        my $o = DBDI::Driver::SQLite3.new(:dbHandle(SQLite::open($db)));
        return $o;
    }

    method createStatement() {
        return DBDI::Statement::SQLite3.new(:connection(self));
    }

    method prepareStatement($sql) {
        my $sth := SQLite::prepare($.dbHandle, $sql);
        my $p = DBDI::PreparedStatement::SQLite3.new(:connection(self), :sql($sql), :stHandle($sth));
        return $p;
    }
}

class DBDI::Statement::SQLite3 is DBDI::Statement {
    has $connection;

    method executeQuery($sql) {
        my $temp_statement = $connection.prepareStatement($sql);
        return DBDI::ResultSet.new(:statement($temp_statement));
    }

    method executeUpdate($sql) {
        my $temp_statement = $connection.prepareStatement($sql);
        $temp_statement.next();
        $temp_statement.finalize();
    }
}

class DBDI::PreparedStatement::SQLite3 is DBDI::PreparedStatement {
    has $connection;
    has $stHandle;
    has @columns;
    has %columns;
    has @bind_params;
    has $!sql;

    method executeUpdate() {
        self.next();
        self.finalize();
    }

    my method errorCheck () {
        my $res = SQLite::errcode($connection.dbHandle);
        my $res_c = SQLite::errmsg($connection.dbHandle);
        if ($res > 0 and $res < 100) { die $res_c }
        return $res;
    }

    my method fillColumns () {
        # Won't work in any useful way at the moment
        my $cn; my $i =0;
        while ($cn = SQLite::column_name($stHandle, $i)) {
            %columns{$cn} = $i++;
            push @columns, $cn;
        }
    }

    method next () {
        SQLite::step($stHandle);
        if (! +@columns) { self!fillColumns(); }
        my $res = self!errorCheck();
        return $res == 100;
    }
    method finalize () {
        SQLite::finalize($stHandle);
        return self!errorCheck();
    }

    method bind($num, $data) {
        @bind_params[$num] = $data;
        SQLite::bind_text($stHandle, $num, $data, chars($data), -1);
        return self!errorCheck();
    }

    method lookupCol ($name) { return %columns{$name} // -1; }

    method getCol ($num) { return SQLite::column_text($stHandle, $num); }
}
