=head1 NAME

Language::m4::Macro 

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 USAGE

=head1 FUNCTIONS

=cut

package Language::m4::Macro;

# pragmata
use strict;
use 5.008;

# Modules from http://www.cpan.org
use IO::File;

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

=head2 expand_input

 Usage     : How to use this function/method
 Purpose   : What it does
 Returns   : What it returns
 Argument  : What it wants to know
 Throws    : Exceptions and other anomolies
 Comments  : This is a sample subroutine header.
           : It is polite to include more pod and fewer comments.

See Also   : 

=cut

sub expand_input
{
  my ( $state, $symtab ) = @_;
  
  while ( my $token = Language::m4::Input::next_token( $state ) )
  {
    _expand_token( $symtab, $token );
  }
}

=head1 private FUNCTIONS

=head2 _expand_token

 Usage     : How to use this function/method
 Purpose   : What it does
 Returns   : What it returns
 Argument  : What it wants to know
 Throws    : Exceptions and other anomolies
 Comments  : This is a sample subroutine header.
           : It is polite to include more pod and fewer comments.

See Also   : 

=cut

sub _expand_token
{
  my ( $symtab, $token ) = @_;
  
  if ( my ( $name, $substitution ) = ( $token =~ m/define\(`(.*)', `(.*)'\)/ ) )
  {
    Language::m4::Builtin::define_user_macro( $symtab, $name, $substitution );
    print $';
  }
  else
  {
    foreach ( @{$symtab} )
    {
      $token =~ s/$_->[0]/$_->[1]/;
    }
    print $token;
  }
}

=head1 BUGS



=head1 SUPPORT



=head1 AUTHOR

	A. U. Thor
	a.u.thor@a.galaxy.far.far.away
	http://a.galaxy.far.far.away/modules

=head1 COPYRIGHT

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.


=head1 SEE ALSO

perl(1).

=cut

1; #this line is important and will help the module return a true value
__END__

