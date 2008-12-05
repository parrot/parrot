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
        return DBDI::ResultSet(:statement($temp_statement));
    }

    method executeUpdate($sql) {
        my $temp_statement = $connection.prepareStatement($sql);
        $temp_statement.step();
        $temp_statement.finalize();
    }
}

class DBDI::PreparedStatement::SQLite3 is DBDI::PreparedStatement { 
    has $connection;
    has $stHandle;
    has @columns;
    has $!sql;

    method executeUpdate() {
        self.step();
        self.finalize();
    }

    my method errorCheck () {
        my $res = SQLite::errcode($connection.dbHandle);
        my $res_c = SQLite::errmsg($connection.dbHandle);
        if ($res > 0 and $res < 100) { die $res_c }
        return $res;
    }

    method step () { 
        SQLite::step($stHandle);
        return self!errorCheck();
    }
    method finalize () {
        SQLite::finalize($stHandle);
        return self!errorCheck();
    }
    
    method setColumn($num, $data) { 
        @columns[$num] = $data; 
        SQLite::bind_text($stHandle, $num, $data, chars($data), -1);
        return self!errorCheck();
    }
}
