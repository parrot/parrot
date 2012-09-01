# Copyright (C) 2005, Parrot Foundation.

package init::hints::vms;

use strict;
use warnings;

use Carp;
use lib ('lib');
use Parrot::Configure::Utils qw(
    _slurp
    _run_command _build_compile_command
);

sub runstep {
    my ( $self, $conf ) = @_;

    $conf->data->set(
        ccflags => qq{/Prefix=All/Obj=.obj/NoList/include="./include"/nowarn},
        link    => 'LINK',
        cc_exe_out => '/exec=',
        perl    => "MCR $^X",
        exe     => ".exe",
        noinline => '',
        make_set_make => '#',
    );

    {
        local $^W;    # no warnings on redefinition

        *Parrot::Configure::Compiler::cc_build = sub {
          my $conf = shift;
          my ( $cc_args, $link_args ) = @_;

          $cc_args   = '' unless defined $cc_args;
          $link_args = '' unless defined $link_args;

          my $verbose = $conf->options->get('verbose');

          my ( $cc, $ccflags, $ldout, $o, $link, $linkflags, $cc_exe_out, $exe, $libs ) =
              $conf->data->get(qw(cc ccflags ld_out o link linkflags cc_exe_out exe libs));

          # unique test file name for parallel builds
          my $test            = 'test_' . $$;
          my $compile_command = _build_compile_command( $cc, $ccflags, $cc_args );
          my $compile_result  = _run_command( $compile_command, "$test.cco", "$test.cco", $verbose );

          if ($compile_result) {
              confess "C compiler failed (see $test.cco)";
              return $compile_result;
          }

          my $link_result =
              _run_command( "$link $linkflags $test$o $link_args ${cc_exe_out}${test}${exe}",
              "$test.ldo", "$test.ldo", $verbose )
              and confess "Linker failed (see $test.ldo)";
          if ($link_result) {
              return $link_result;
          }
        };

        *Parrot::Configure::Compiler::cc_run = sub {
          my $conf = shift;
          my $exe      = $conf->data->get('exe');
          my $verbose  = $conf->options->get('verbose');
          my $test     = 'test_' . $$;
          my $test_exe = "MCR []${test}${exe}";

          my $run_error;
          if ( defined( $_[0] ) && length( $_[0] ) ) {
              local $" = ' ';
              $run_error = _run_command( "$test_exe @_", "./$test.out", undef, $verbose );
          }
          else {
              $run_error = _run_command( $test_exe, "./$test.out", undef, $verbose );
          }

          my $output = _slurp("./$test.out");

          return $output;
        };
    }
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
