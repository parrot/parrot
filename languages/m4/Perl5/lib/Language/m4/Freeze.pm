
package Language::m4::Freeze;
use strict;
use Language::m4::Builtin;

BEGIN {
	use Exporter ();
	use vars qw ($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
	$VERSION     = 0.01;
	@ISA         = qw (Exporter);
	#Give a hoot don't pollute, do not export more than needed by default
	@EXPORT      = qw ();
	@EXPORT_OK   = qw ();
	%EXPORT_TAGS = ();
}


########################################### main pod documentation begin ##
# Below is the stub of documentation for your module. You better edit it!


=head1 NAME

Language::m4::Freeze - 

=head1 SYNOPSIS

  use Language::m4
  blah blah blah


=head1 DESCRIPTION

Stub documentation for this module was created by ExtUtils::ModuleMaker.
It looks like the author of the extension was negligent enough
to leave the stub unedited.

Blah blah blah.


=head1 USAGE



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

############################################# main pod documentation end ##


################################################ subroutine header begin ##

=head2 sample_function

 Usage     : How to use this function/method
 Purpose   : What it does
 Returns   : What it returns
 Argument  : What it wants to know
 Throws    : Exceptions and other anomolies
 Comments  : This is a sample subroutine header.
           : It is polite to include more pod and fewer comments.

See Also   : 

=cut

################################################## subroutine header end ##


sub reload_frozen_state
{
  my ($frozen_file, $symtab ) = @_;

  open( FROZEN, "<$frozen_file" );
  while ( <FROZEN> )
  {
    my $token = substr( $_, 0, 1, '' );
    next if $token eq "\n";

    next if ( $token eq '#' );

    next if ( $token eq 'V' );

    if ( $token eq 'F' )
    {
      my ( $name_len, $substitution_len ) = ( m/^(\d+),(\d+)\n$/ );
      <FROZEN>;
      my ( $name, $substitution ) = ( m/^(.{$name_len}).{$substitution_len}\n$/ );
      Language::m4::Bultin::define_builtin( $symtab, $name, $substitution );
      next;
    }    
    if ( $token eq 'T' )
    {
      my ( $name_len, $substitution_len ) = ( m/^(\d+),(\d+)\n$/ );
      <FROZEN>;
      my ( $name, $substitution ) = ( m/^(.{$name_len}).{$substitution_len}\n$/ );
      Language::m4::Bultin::define_user_macro( $symtab, $name, $substitution );
      next;
    }    

    die "Encountered an unknown character '$token'";
    
  }
}


1; #this line is important and will help the module return a true value
__END__

