# $Id$

# pragmata
use 5.005;
use strict;
use warnings;
use lib qw( m4 ../lib ../../lib );

package M4::Test;

use Parrot::Config;

require Exporter;
require Test::More;

our @ISA = qw(Exporter Test::More);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use M4::Test ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = ( qw(output_is output_like output_isnt), @Test::More::EXPORT );

our $VERSION = '0.01';

sub import 
{
  my ( $class, $plan, @args ) = @_;

  Test::More->import( $plan, @args );

  __PACKAGE__->_export_to_level( 2, __PACKAGE__ );
}

# this kludge is an hopefully portable way of having
# redirections ( tested on Linux and Win2k )
sub _run_command 
{
  my ( $command, %redir ) = @_;
  my ( $redir_string ) = '';

  while( my @dup = each %redir ) 
  {
    my ( $from, $to ) = @dup;
    if( $to eq 'STDERR' ) { $to = "qq{>&STDERR}" }
    elsif( $to eq 'STDOUT' ) { $to = "qq{>&STDOUT}" }
    elsif( $to eq '/dev/null' ) { $to = ( $^O eq 'MSWin32' ) ?
                                      'qq{> NUL:}' : "qq{> $to}" }
    else { $to = "qq{> $to}" }

    $redir_string .= "open $from, $to;"
  }

  system "$^X -e \"$redir_string;system q{$command};\"";
}

my $count;

foreach my $i ( qw(is isnt like) ) 
{
  no strict 'refs';

  *{"M4::Test::output_$i"} = sub ($$;$) 
  {
    ++$count;
    my ( $m4_code, $expected_output, $desc ) = @_;
    local( *M4, *OUTPUT ); 
    my ( $m4_f, $parrot_out_f, $gnu_out_f ) = 
      map { my $t = $0; $t =~ s/\.t$/_$count\.$_/; $t } ( qw(m4 parrot_out gnu_out) ); 

    open M4, "> $m4_f" or die "Unable to open '$m4_f'"; 
    binmode M4; 
    print M4 $m4_code; 
    close M4; 
    
    _run_command( "../../parrot m4.pbc $m4_f", 'STDOUT' => $parrot_out_f, 'STDERR' => $parrot_out_f);
    _run_command( "m4 $m4_f",                  'STDOUT' => $gnu_out_f,    'STDERR' => $gnu_out_f);

    my $parrot_prog_output;
    open OUTPUT, "< $parrot_out_f";
    {
      local $/ = undef;
      $parrot_prog_output = <OUTPUT>;
    }
    close OUTPUT;
    &{"Test::More::$i"}( $parrot_prog_output, $expected_output, $desc );

    my $gnu_prog_output;
    open OUTPUT, "< $gnu_out_f";
    {
      local $/ = undef;
      $gnu_prog_output = <OUTPUT>;
    }
    close OUTPUT;
    &{"Test::More::$i"}( $gnu_prog_output, $expected_output, $desc );
  }
}

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

M4::Test - Perl extension for testing m4.imc

=head1 SYNOPSIS

  use M4::Test;
  blah blah blah

=head1 ABSTRACT

  This should be the abstract for M4::Test.
  The abstract is used when making PPD (Perl Package Description) files.
  If you don't want an ABSTRACT you should also edit Makefile.PL to
  remove the ABSTRACT_FROM option.

=head1 DESCRIPTION

Stub documentation for M4::Test, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

Bernhard Schmalhofer, E<lt>bernhard!no_spam!gmx.deE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2004 by Bernhard Schmalhofer

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

=cut
