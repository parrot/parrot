#! perl

# Copyright (C) 2007, Parrot Foundation.

use 5.008;
use strict;
use warnings;
use lib 'lib';
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );

$| = 1;    # $OUTPUT_AUTOFLUSH = 1;

my $args = process_options(
    {
        mode => 'reconfigure',
        argv => [@ARGV],
    }
);
exit(1) unless ( defined $args and defined $args->{step} );

my $conf = Parrot::Configure->new;
$conf->add_step( $args->{step} );
$conf->options->set( %{$args} );

# The result of get_PConfig() is that the parameters in %Parrot::Config::PConfig
# are assigned to the {c} attribute in $conf.
$conf->data()->get_PConfig();

# The result of get_PConfig_Temp() is that the parameters in
# %Parrot::Config::PConfig_Temp
# are assigned to the {c}{$_} attribute in $conf.
if ( $args->{step} =~ /gen::makefiles/ ) {
    $conf->data()->get_PConfig_Temp();
}
$conf->run_single_step( $args->{step} );
print "\n";
exit(0);

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
