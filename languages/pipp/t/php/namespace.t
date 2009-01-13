# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/php/namespace.t - testing packages, aka namespaces

=head1 SYNOPSIS

    perl t/harness t/php/namespace.t

=head1 DESCRIPTION

Working with namespaces.

=head1 SEE ALSO

L<../../docs/namespaces.pod>

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Parrot::Test tests => 3;

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'parsing of namespace directive' );
<?php

namespace A\B {}

namespace A\B\C {}

?>
CODE
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'namespace with constant', todo => 'not implemented yet' );
<?php

namespace {
const FOO = "FOO in root.\n";
}

namespace A\B {

const FOO  = "FOO in A::B\n";

echo FOO;
echo \A\B\FOO;
echo \FOO;

}

namespace {

echo FOO;
echo \A\B\FOO;
echo \FOO;

}

?>
CODE
FOO in A::B
FOO in A::B
FOO in root
FOO in root
FOO in A::B
FOO in root
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'namespace with class', todo => 'not implemented yet' );
<?php

namespace A\B {

class Dings {

    function bums() {
        echo "The function bums() in class A\\Dings has been called.\n";
    }
}

$dings = new \A\B\Dings;
$dings->bums();

}

?>
CODE
The function bums() in class A\Dings has been called.
OUT
