# $Id$
# Copyright (C) 2006-2008, The Perl Foundation.

package Parrot::Test::NCIGENAST;


use strict;
use warnings;

use Cwd;
use File::Spec;
use File::Basename;
use Parrot::Test;
use Data::Dumper;

use Parrot::Config;

require Exporter;
require Test::Builder;
require Test::More;

our @EXPORT = qw( ast parse plan skip like istypedef ispointer decl_ident_is type_is is_builtin parse_failure parse_success contains);
our @EXPORT_OK = qw();

use base qw( Exporter );

# Memoize functions with a fixed output
# Memoize::memoize('path_to_parrot');
#
# # Tell parrot it's being tested--disables searching of installed libraries.
# # (see Parrot_get_runtime_prefix in src/library.c).
# $ENV{PARROT_TEST} = 1 unless defined $ENV{PARROT_TEST};
#
my $builder = Test::Builder->new();

our $ME = new();
$ME->{builder}        = $builder;
$ME->{path_to_parrot} = Parrot::Test::path_to_parrot();
$ME->{parrot}         = File::Spec->join( $ME->{path_to_parrot}, 'parrot' . $PConfig{exe} );
our $results;


sub import {
    my ( $class, $plan, @args ) = @_;

    $builder->plan( $plan, @args );

    __PACKAGE__->export_to_level( 1, __PACKAGE__ );
}

*plan = \&Test::More::plan;
*skip = \&Test::More::skip;

=head1 Parrot::Test::C99

Provide language specific testing routines here...

This is currently alarmingly similar to the generated subs in Parrot::Test.
Perhaps someone can do a better job of delegation here.

=cut

sub new {
    return bless {};
}

sub ast {
  my ( $code ) = @_;
  $results = $ME->ncigenit($code, '--target=nci_ast');
}

sub parse {
  my ( $code ) = @_;
  $results = $ME->ncigenit($code, '--target=parse');
}

sub like {
    return $ME->testit('like', @$results, @_);
}

sub istypedef {
  return like( qr/NCIGENAST;TypeDef/, @_);
}
sub ispointer {
  return like( qr/<pointer> => 1/, @_);
}

sub decl_ident_is {
  my $id = shift @_;
  return like( qr/<name> => \"$id/, @_);
}
sub type_is {
  my $id = shift @_;
  return like( qr/<type> => \"$id/, @_);
}
sub is_builtin{
  return like( qr/<builtin_type> => 1/, @_);
}

sub contains {
  my $it = shift @_;
  return like( qr/$it/, @_);
}

sub parse_failure {
  $ME->{builder}->ok( $results->[3] == 1, @_ );
}

sub parse_success {
  my $code = shift @_;
  $results = $ME->ncigenit($code, '--target=parse');
  $ME->{builder}->ok( $results->[3] == 0, @_ );
}

sub ncigenit {
    my ( $self, $code, $ncigenargs ) = @_;

    my $count = $self->{builder}->current_test + 1;
    my $parrotdir       = dirname $self->{parrot};

    my @fns = map { File::Spec->rel2abs( Parrot::Test::per_test( $_, $count ) ) } ( '.c', '.out' );
    my ( $lang_f, $out_f ) = @fns;

    Parrot::Test::write_code_to_file( $code, $lang_f );

    my $args = $ENV{TEST_PROG_ARGS} || '';

    my $cmd       = "$self->{parrot} $args $parrotdir/compilers/ncigen/ncigen.pbc $ncigenargs $lang_f";
    my $exit_code = Parrot::Test::run_command(
            $cmd,
            CD     => $self->{relpath},
            STDOUT => $out_f,
            STDERR => $out_f
            );
    my $output = Parrot::Test::slurp_file($out_f);

    unless ( $ENV{POSTMORTEM} ) {
        unlink $lang_f;
        unlink $out_f;
    }

    my @results = ($code, $cmd, $output, $exit_code, $count);
    wantarray ? return @results : return [ @results ];
}

sub testit {
    my ( $self, $method, $code, $cmd, $output, $exit_code, $count, $expected, $desc ) = @_;
    #print "$cmd, $exit_code, $count, $expected, $desc \n";

    $desc = "NCIGENAST Test $count" unless $desc;
    my $pass = $self->{builder}->$method( $output, $expected, $desc );
    if ($exit_code or not $pass)  {
      $self->{builder}->diag("'$cmd' failed with exit code $exit_code") if $exit_code or not $pass;
      $self->{builder}->diag("CODE:\n$code"."CODE");
    }

    return $pass;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
