# $Id$

package Language::m4::Input;

use strict;
use 5.008;

BEGIN 
{
  use Exporter ();
  use vars qw ($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
  $VERSION     = 0.01;
  @ISA         = qw (Exporter);
  #Give a hoot don't pollute, do not export more than needed by default
  @EXPORT      = qw ();
  @EXPORT_OK   = qw ();
  %EXPORT_TAGS = ();
}

=head1 NAME/

Language::m4::Input - A helper for Language::m4 

=head1 SYNOPSIS

  Language::m4::Input::input_init( \%state );

=head1 DESCRIPTION

Dose some stuff with reading input.

=head1 USAGE

=head1 FUNCTIONS

=head2 input_init

 Usage     : A semi OO function
 Purpose   : Init some input.
 Returns   : Changes the state hash.
 Argument  : What it wants to know
 Throws    : Exceptions and other anomolies
 Comments  : This is a sample subroutine header.
           : It is polite to include more pod and fewer comments.

See Also   : 

=cut

sub input_init
{
  my ($state) = @_;

  $state->{file_stack} ||= [];

  return;
}

sub push_file
{
  my ($state, $filename) = @_;

  push @{$state->{file_stack}}, $filename;

  return;
}


=head2 next_token

 Usage     : How to use this function/method
 Purpose   : What it does
 Returns   : What it returns
 Argument  : What it wants to know
 Throws    : Exceptions and other anomolies
 Comments  : This is a sample subroutine header.
           : It is polite to include more pod and fewer comments.

See Also   : 

=cut

sub next_token
{
  my ( $state ) = @_;

  my $fh = $state->{current_fh}; 
  if ( ! defined $fh )
  {
    my $file = shift( @{$state->{file_stack}} );
    $fh = IO::File->new( "<$file" ) if $file; 
    $state->{current_fh} = $fh;
  }
 
  return ( defined $fh ) ? <$fh> : undef; 
}

=head1 BUGS

None reported yet.

=head1 SUPPORT

Bernhard.Schmalhofer!no_spam!gmx.de

=head1 AUTHOR

	A. U. Thor
	a.u.thor@a.galaxy.far.far.away
	http://a.galaxy.far.far.away/modules

=head1 COPYRIGHT

GPL

=head1 SEE ALSO

perl(1).

=cut

1; #this line is important and will help the module return a true value
__END__
