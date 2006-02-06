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
##	print "Lookup $symb\n";
	if (exists $self->{table}{$symb}) {
		my $defn = $self->{table}{$symb};
##		print "\tfound 1 in $self\n";
		return $defn;
	} else {
		my $parser = $self->{parser};
		for my $symbtab (@{$parser->YYData->{scope}}) {
			if ($symbtab->isa('SymbTabVar')) {
				if (exists $symbtab->{table}{$symb}) {
					my $defn = $symbtab->{table}{$symb};
##					print "\tfound 2 in $symbtab\n";
					return $defn;
				}
			}
		}
		return undef;
	}
}

sub Insert {
	my $self = shift;
	my ($defn) = @_;
	my $symb = $defn->{name};
##	print "Insert $symb in $self\n";
	unless (exists $self->{table}{$symb}) {
		$self->{table}{$symb} = $defn;
	}
}

sub LookupU {
	my $self = shift;
	my ($symb) = @_;
#	print "LookupU $symb\n";
	my $parser = $self->{parser};
	for (@{$parser->YYData->{scopef}}) {
		if (ref $_ eq "ARRAY") { 
			for my $symbtab (@{$_}) {
				if (defined($symbtab) and $symbtab->isa('SymbTabVar')) {
					if (exists $symbtab->{table}{$symb}) {
						my $defn = $symbtab->{table}{$symb};
#						print "\tfound in $symbtab\n";
						return $defn;
					}
				}
			}
		}
	}
	return undef;
}

sub LookupS {
	my $self = shift;
	my ($symb) = @_;
	if (exists $self->{table}{$symb}) {
		my $defn = $self->{table}{$symb};
		return $defn;
	}
	return undef;
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
	my ($symb, $klass, $type, $subtype, $name) = @_;
	$self->{symbol} = $symb;
	$self->{class} = $klass;
	$self->{type} = $type if (defined $type);
	$self->{subtype} = $subtype if (defined $subtype);
	$self->{name} = $name if (defined $name);
	return $self;
}

1;

