=head2 P6C::IMCC::Sub

Stores IMCC code for a subroutine.

XXX: the fact that e.g. C<P6C::prefix> relies on this for argument
information is just wrong.  This information should be retrieved from
the parse tree structures instead.

=over

=item B<< $sub->{code} >>

The code (not including C<.local> definitions, etc).  Should be
appended to like C<< $func->{code} .= $thing >>.

=item B<emit($sub)>

Emit a complete function body, minus the C<.sub> directive.

=back

=cut

package P6C::IMCC::Sub;
use Class::Struct 'P6C::IMCC::Sub'
    => { scopes => '@',		# scope stack
	 params => '$',		# parameters passed
	 rettype => '$',	# return type (scalar, array, tuple)
       };
#	{scopelevel}		# current scope number
#	{oldscopes}		# other closed scopes in this sub.

use P6C::Util qw(diag error);
require P6C::IMCC;

sub _find {
    my ($x, $thing) = @_;
    for (@{$x->scopes}) {
	if (exists $_->{$thing}) {
	    return $_->{$thing};
	}
    }
    return undef;
}

sub localvar {
    my ($x, $var) = @_;
    my $res = $x->_find($var);
    if ($res) {
	return $res->[0];
    }
    return undef;
}

sub add_localvar {
    my ($x, $var, $type, $init) = @_;
    $x->{scopelevel} ||= 0;
    my $scopename = P6C::IMCC::mangled_name($var).$x->{scopelevel};
    if ($x->scopes->[0]{$var}) {
	diag "Redeclaring lexical $var in $P6C::IMCC::curfunc";
    }
    $x->scopes->[0]{$var} ||= [$scopename, $type, $init];
    return $scopename;
}

sub label {
    my $x = shift;
    my %o = @_;
    $o{name} = '' unless defined $o{name};
    $o{type} = '' unless defined $o{type};
    my $mangled = "label:$o{name}:$o{type}";
    return $x->_find($mangled);
}

sub add_label {
    # XXX: note trickery here -- if the label has both a type and a
    # name, we just add ":type" and "name:type", not "name".  This is
    # deliberate -- the label statement itself will cause the "name"
    # to be emitted.
    my $x = shift;
    my %o = @_;
    my $lab = P6C::IMCC::genlabel;
    if ($o{type}) {
	$x->scopes->[0]{"label::$o{type}"} = $lab;
	if ($o{name}) {
	    $x->scopes->[0]{"label:$o{name}:$o{type}"} = $lab;
	}
    } elsif ($o{name}) {
	$x->scopes->[0]{"label:$o{name}:"} = $lab;
    } else {
	die "internal error -- add_label() with neither type nor name";
    }
    return $lab;
}

sub topic {
    my $x = shift;
    return $x->_find('topic:');
}

sub set_topic {
    my ($x, $topic) = @_;
    $x->scopes->[0]{"topic:"} = $topic;
}

sub push_scope {
    my $x = shift;
    $x->{scopelevel}++;
    unshift @{$x->scopes}, { };
}

sub maybe_set_params {
    # XXX: hack to keep inner closures from mucking with our params.
    my ($x, $signature) = @_;
    unless ($x->{hasparam}) {
        $x->params($signature);
	$x->{hasparam} = 1;
    }
}

sub set_return {
    my ($x, $r) = @_;
    $x->rettype($r);
}

sub pop_scope {
    my $x = shift;
    push @{$x->{oldscopes}}, shift @{$x->scopes};
}

# P6C::IMCC::Sub::emit - print out the code for a subroutine body
#
# 1. Grab the parameters from the passed-in registers
# 2. Implement the subroutine code
# 3. call the continuation to "return"
#
# FIXME: Non-PMC arguments/params are not yet handled.
# FIXME: Pass-by-value only implemented
sub emit {
    my ($x, $prototyped) = @_;
    my $params = $x->params;

    my $named_args = P6C::IMCC::gensym("unknown_named");

    print "\t.param PerlHash $named_args # named args\n"
      unless $params->{no_named};

    # Emit all of the positional and optional parameters
    my $param_count = 0;
    $param_count++ unless $params->{no_named}; # Skip over the named param hash
    foreach my $param (@{ $params->positional }, @{ $params->optional }) {
        my ($ptype, $pvar) = ($param->type, $param->var);
        $ptype = P6C::IMCC::paramtype($ptype);
        my $pname = $pvar->name;
        my $pname_mangled = P6C::IMCC::mangled_name($pname);
        print "\t.param $ptype $pname_mangled # Positional param $pname\n";
        $param_count++;
    }

    # The slurpy array, if any, is passed as an array PMC
    if ($params->slurpy_array) {
        my $slurpy = $params->slurpy_array->var->name;
        my $slurpy_name = P6C::IMCC::mangled_name($slurpy);
        print "\t.local PerlArray $slurpy_name\n";
        print "\tfoldup $slurpy_name, $param_count # Suck in slurpy args\n";
    }

    # Create local variables for all the named arguments
    foreach my $param (@{ $params->required_named },
                       @{ $params->optional_named })
    {
        my ($ptype, $pvar) = ($param->type, $param->var);
        $ptype = P6C::IMCC::paramtype($ptype);
        my $pname = $pvar->name;
        my $pname_mangled = P6C::IMCC::mangled_name($pname);
        print "\t.sym $ptype $pname_mangled # Named param $pname\n";
    }

    my $tmp = P6C::IMCC::gentmp('int');
    my $got_params = P6C::IMCC::genlabel("got_params");
    unless ($params->{no_named}) {
        print "# Argument handling\n";
        print "  if I0 goto $got_params\n";
        my $min_count = 2;
        foreach my $param (@{ $params->positional }) {
            my ($ptype, $pvar) = ($param->type, $param->var);
            $ptype = P6C::IMCC::paramtype($ptype);
            my $pname = $pvar->name;
            my $pname_base = substr($pname, 1);
            my $pname_mangled = P6C::IMCC::mangled_name($pname);
            my $label = P6C::IMCC::genlabel("skip_param_$pname_mangled");
            print "  if I1 >= $min_count goto $label\n";
            print "  exists $tmp, $named_args\[\"$pname_base\"]\n";
            print "  unless $tmp goto $label\n";
            print "  $pname_mangled = $named_args\[\"$pname_base\"]\n";
            print "  delete $named_args\[\"$pname_base\"]\n";
            print "$label:\n";
            $min_count++;
        }
        print "$got_params:\n";
    }

    # Grab out the named params
    foreach my $param (@{ $params->required_named },
                       @{ $params->optional_named })
    {
        my ($ptype, $pvar) = ($param->type, $param->var);
        $ptype = P6C::IMCC::paramtype($ptype);
        my $pname = $pvar->name;
        my $pname_base = substr($pname, 1);
        my $pname_mangled = P6C::IMCC::mangled_name($pname);
        print "  $pname_mangled = $named_args\[\"$pname_base\"\]\n";
    }

    print "# Named locals:\n";
    for (@{$x->scopes}, @{$x->{oldscopes}}) {
	for my $v (values %$_) {
	    next unless ref($v) eq 'ARRAY';
	    my ($n, $t) = @$v;
	    $t = P6C::IMCC::paramtype($t);
	    print "\t.local $t $n\n";
	}
    }
    # Maybe constructors for locals:
    for (@{$x->scopes}, @{$x->{oldscopes}}) {
	for my $v (values %$_) {
	    next unless ref($v) eq 'ARRAY';
	    my ($n, $t, $init) = @$v;
	    print "\t$n = new $t\n"
		if P6C::IMCC::regtype($t) eq 'P' && $init;
	}
    }
    print $x->{code};
    print <<END;
        .pcc_begin_return # fallback
        .pcc_end_return
END
}

1;
