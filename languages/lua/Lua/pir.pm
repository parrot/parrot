
use strict;

package pirVisitor;

sub new {
	my $proto = shift;
	my $class = ref($proto) || $proto;
	my $self = {};
	bless($self, $class);
	my ($fh) = @_;
	$self->{fh} = $fh;
	$self->{prologue} = q{
.namespace [ "Lua" ]
.HLL "Lua", "lua_group"

.sub __start @MAIN, @ANON
#    print "start Lua\n"
    load_bytecode "languages/lua/lib/luabasic.pbc"
    load_bytecode "languages/lua/lib/luacoroutine.pbc"
    load_bytecode "languages/lua/lib/luastring.pbc"
    load_bytecode "languages/lua/lib/luatable.pbc"
    load_bytecode "languages/lua/lib/luamath.pbc"
    load_bytecode "languages/lua/lib/luaio.pbc"
    load_bytecode "languages/lua/lib/luaos.pbc"
    _main()
.end

};
	return $self;
}

sub visitUnaryOp {
	my $self = shift;
	my ($op) = @_;
	my $FH = $self->{fh};
	print $FH "    $op->{result}->{symbol} = $op->{op} $op->{arg1}->{symbol}\n";
}

sub visitBinaryOp {
	my $self = shift;
	my ($op) = @_;
	my $FH = $self->{fh};
	print $FH "    $op->{result}->{symbol} =  $op->{op} $op->{arg1}->{symbol}, $op->{arg2}->{symbol}\n";
}

sub visitRelationalOp {
	my $self = shift;
	my ($op) = @_;
	my $FH = $self->{fh};
	print $FH "    $op->{result}->{symbol} = $op->{op} $op->{arg1}->{symbol}, $op->{arg2}->{symbol}\n";
}

sub visitAssignOp {
	my $self = shift;
	my ($op) = @_;
	my $FH = $self->{fh};
	print $FH "    $op->{result}->{symbol} = $op->{arg1}->{symbol}\n";
}

sub visitKeyedGetOp {
	my $self = shift;
	my ($op) = @_;
	my $FH = $self->{fh};
	print $FH "    $op->{result}->{symbol} = $op->{arg1}->{symbol}\[$op->{arg2}->{symbol}\]\n";
}

sub visitKeyedSetOp {
	my $self = shift;
	my ($op) = @_;
	my $FH = $self->{fh};
	print $FH "    $op->{result}->{symbol}\[$op->{arg1}->{symbol}\] = $op->{arg2}->{symbol}\n";
}

sub visitFindGlobalOp {
	my $self = shift;
	my ($op) = @_;
	my $FH = $self->{fh};
	print $FH "    $op->{result}->{symbol} = global \"$op->{arg1}\"\n";
#	print $FH "    find_global $op->{result}->{symbol}, \"$op->{arg1}\"\n";
}

sub visitCloneOp {
	my $self = shift;
	my ($op) = @_;
	my $FH = $self->{fh};
	print $FH "    $op->{result}->{symbol} = clone $op->{arg1}->{symbol}\n";
}

sub visitToBoolOp {
	my $self = shift;
	my ($op) = @_;
	my $FH = $self->{fh};
	print $FH "    $op->{result}->{symbol} = $op->{arg1}->{symbol}\n";
}

sub visitCallOp {
	my $self = shift;
	my ($op) = @_;
	my $FH = $self->{fh};
	print $FH "    ";
	if (exists $op->{result} and scalar(@{$op->{result}})) {
		print $FH "(";
		my $first = 1;
		foreach (@{$op->{result}}) {
			print $FH ", " unless ($first);
			print $FH "$_->{symbol}";
			$first = 0;
		}
		print $FH ") = ";
	}
	print $FH "$op->{arg1}->{symbol}(";
	my $first = 1;
	foreach (@{$op->{arg2}}) {
		print $FH ", " unless ($first);
		print $FH "$_->{symbol}";
		$first = 0;
	}
	print $FH ")\n";
}

sub visitBranchIfOp {
	my $self = shift;
	my ($op) = @_;
	my $FH = $self->{fh};
	if (exists $op->{op}) {
		print $FH "    if $op->{arg1}->{symbol} $op->{op} $op->{arg2}->{symbol} goto $op->{result}->{symbol}\n";
	} else {
		print $FH "    if $op->{arg1}->{symbol} goto $op->{result}->{symbol}\n";
	}
}

sub visitBranchUnlessOp {
	my $self = shift;
	my ($op) = @_;
	my $FH = $self->{fh};
	if (exists $op->{op}) {
		print $FH "    unless $op->{arg1}->{symbol} $op->{op} $op->{arg2}->{symbol} goto $op->{result}->{symbol}\n";
	} else {
		print $FH "    unless $op->{arg1}->{symbol} goto $op->{result}->{symbol}\n";
	}
}

sub visitBranchOp {
	my $self = shift;
	my ($op) = @_;
	my $FH = $self->{fh};
	print $FH "    goto $op->{result}->{symbol}\n";
}

sub visitLabelOp {
	my $self = shift;
	my ($op) = @_;
	my $FH = $self->{fh};
	print $FH "$op->{arg1}->{symbol}:\n";
}

sub visitSubDir {
	my $self = shift;
	my ($dir) = @_;
	my $FH = $self->{fh};
	print $FH ".sub $dir->{result}->{symbol} \@ANON\n";
}

sub visitEndDir {
	my $self = shift;
	my ($dir) = @_;
	my $FH = $self->{fh};
	print $FH ".end\n";
}

sub visitParamDir {
	my $self = shift;
	my ($dir) = @_;
	my $FH = $self->{fh};
	print $FH "    .param $dir->{result}->{type}->{symbol} $dir->{result}->{symbol}\n";
}

sub visitReturnDir {
	my $self = shift;
	my ($dir) = @_;
	my $FH = $self->{fh};
	if (exists $dir->{result}) {
		print $FH "    .return ($dir->{result}->{symbol})\n";
	} else {
		print $FH "    .return ()\n";
	}
}

sub visitLocalDir {
	my $self = shift;
	my ($dir) = @_;
	my $FH = $self->{fh};
	print $FH "    .local $dir->{result}->{type} $dir->{result}->{symbol}\n";
	if (exists $dir->{result}->{subtype}) {
		print $FH "    new $dir->{result}->{symbol}, .Lua" . ucfirst($dir->{result}->{subtype}) . "\n";
	}
}

sub visitLexDir {
	my $self = shift;
	my ($dir) = @_;
	my $FH = $self->{fh};
	print $FH "    .lex \"$dir->{result}\", $dir->{arg1}->{symbol}\n";
}

1;

