module Ops::Util;

=begin Description
Various utility functions.
=end Description

sub process_recursive($op, &ctor) {
    my $res;
    if pir::isnull($op) {
        $res := $op;
    }
    elsif pir::isa($op, 'Capture') {
        $res := &ctor($op);
        pir::push($res, process_recursive($_, &ctor)) for @($op);
        $res{$_} := process_recursive($op{$_}, &ctor) for $op.hash.keys;
    }
    elsif pir::does($op, 'array') {
        $res := $op.map(->$_ { process_recursive($_, &ctor) });
    }
    else {
        $res := pir::clone($op);
    }
    $res;
}

sub from_capture($capture) {
    process_recursive($capture, -> $c {
        my $what := $c<WHAT>;
        $c.hash.delete('WHAT');
        $what := pir::substr($what, 0, pir::length($what) - 2);
        my @parts := split('::', $what);

        my $WHAT := pir::get_hll_global__pps(@parts, @parts.pop);
        $WHAT.new;
    });
}

sub to_capture($op) {
    process_recursive($op, -> $_ {
        my $what := ~$_.WHAT;
        $_ := pir::new('Capture');
        $_<WHAT> := $what;
        $_.hash.delete('source');
        $_
    });
}

sub strip_source($op) {
    process_recursive($op, -> $c {
        Q:PIR {
            $P1 = find_lex '$c'
            delete $P1['source']
        };
        pir::clone($c);
    });
}

# vim: ft=perl6
