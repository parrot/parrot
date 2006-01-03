use strict;

package Lua::opcode;

sub new {
	my $proto = shift;
	my $class = ref($proto) || $proto;
	my $parser = shift;
	my %attr = @_;
	my $self = \%attr;
	bless($self, $class);
	foreach (keys %attr) {
		unless (defined $self->{$_}) {
			delete $self->{$_};
		}
	}
	$self->{Lineno} = $parser->YYData->{lineno};
	return $self;
}

sub configure {
	my $self = shift;
	my %attr = @_;
	my ($key, $value);
	while ( ($key,$value) = each(%attr) ) {
		if (defined $value) {
			$self->{$key} = $value;
		}
	}
	return $self;
}

sub visit {
	my $self = shift;
	my $class = ref $self;
	my $visitor = shift;
	no strict "refs";
	my $func = 'visit' . $class;
	if ($visitor->can($func)) {
		return $visitor->$func($self, @_);
	}
	warn "Please implement a function 'visit",ref $self,"' in '",ref $visitor,"'.\n";
	return undef;
}

package UnaryOp;
use base qw(Lua::opcode);

package BinaryOp;
use base qw(Lua::opcode);

package RelationalOp;
use base qw(Lua::opcode);

package AssignOp;
use base qw(Lua::opcode);

package KeyedGetOp;
use base qw(Lua::opcode);

package KeyedSetOp;
use base qw(Lua::opcode);

package FindGlobalOp;
use base qw(Lua::opcode);

package CloneOp;
use base qw(Lua::opcode);

package ToBoolOp;
use base qw(Lua::opcode);

package CallOp;
use base qw(Lua::opcode);

package LabelOp;
use base qw(Lua::opcode);

package BranchOp;
use base qw(Lua::opcode);

package BranchIfOp;
use base qw(Lua::opcode);

package BranchUnlessOp;
use base qw(Lua::opcode);

package SubDir;
use base qw(Lua::opcode);

package EndDir;
use base qw(Lua::opcode);

package ReturnDir;
use base qw(Lua::opcode);

package ParamDir;
use base qw(Lua::opcode);

package LocalDir;
use base qw(Lua::opcode);

package LexDir;
use base qw(Lua::opcode);

package ConstDir;
use base qw(Lua::opcode);

1;

