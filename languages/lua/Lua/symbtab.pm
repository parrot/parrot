use strict;

package Lua::symbtab;

sub new {
	my $proto = shift;
	my $class = ref($proto) || $proto;
	my ($parser) = @_;
	my $self = {};
	bless($self, $class);
	$self->{parser} = $parser;
	$self->{table} = {};
	return $self;
}

################################################################################

package SymbTabVar;

use base qw(Lua::symbtab);

sub Lookup {
	my $self = shift;
	my ($symb) = @_;
	if (exists $self->{table}{$symb}) {
		my $defn = $self->{table}{$symb};
		$defn->{nb_use} ++;
		return $defn;
	} else {
		return undef;
	}
}

sub Insert {
	my $self = shift;
	my ($symb, $defn) = @_;
	if (exists $self->{table}{$symb}) {
		$self->{parser}->Error("Redefinition - $symb.\n");
	} else {
		$self->{table}{$symb} = $defn;
	}
}

################################################################################

package SymbTabConst;

use base qw(Lua::symbtab);

sub Lookup {
	my $self = shift;
	my ($symb) = @_;
	if (exists $self->{table}{$symb}) {
		my $defn = $self->{table}{$symb};
		return $defn;
	} else {
		return undef;
	}
}

sub Insert {
	my $self = shift;
	my ($symb, $defn) = @_;
	$self->{table}{$symb} = $defn;
}

###############################################################################

package defn;

sub new {
	my $proto = shift;
	my $class = ref($proto) || $proto;
	my $self = {};
	bless($self, $class);
	my ($symb, $klass, $type, $subtype) = @_;
	$self->{symbol} = $symb;
	$self->{class} = $klass;
	$self->{type} = $type if (defined $type);
	$self->{subtype} = $subtype if (defined $subtype);
#	$self->{nb_use} = 0;
	return $self;
}

1;

