# $Id$

=head1 NAME

Language::m4 - A port of GNU m4 from C to Perl5 

=head1 SYNOPSIS

  use Language::m4;

  Language::m4::main();

=head1 DESCRIPTION

Provides a main function for the Perl scipt m4.

=head1 USAGE

Uses the parameters from the command line.

=head1 FUNCTIONS

=cut

package Language::m4;

# pragmata
use strict;
use 5.005;

# Modules from http://www.cpan.org
use Data::Dumper;
use Getopt::Long;
use Pod::Usage;

# local Modules
use Language::m4::Builtin;
use Language::m4::Freeze;
use Language::m4::Input;
use Language::m4::Macro;

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


=head2 main

 Usage     : This implements a m4 processor
 Purpose   : Macro processing
 Returns   : A return code
 Argument  : Read stuff from @ARGV
 Throws    : None yet
 Comments  : I try to be polite

See Also   : GNU m4 

=cut

sub main
{
  my $version_flag = 0;
  my $help_flag    = 0;
  my $freeze_state;
  my $reload_state;
  GetOptions( 'version'        => \$version_flag, 
              'help'           => \$help_flag, 
              'freeze-state=s' => \$freeze_state,
              'reload-state=s' => \$reload_state,
            ) || pod2uage(2); 

  # Was '--version' passed ?
  if ( $version_flag ) 
  {  
    print "Parrot m4 Snapshot 2004-01-01\n";
    return 0;
  }

  # Was '--help' passed ?
  if ( $help_flag ) 
  {  
    _usage();
    return 0;
  }

  my %state;
  Language::m4::Input::input_init( \%state );
  
  my @symtab;

  if ( $reload_state )
  {
    Language::m4::Freeze::reload_frozen_state( $freeze_state, \@symtab );
  }
  else
  {
    Language::m4::Builtin::builtin_init( \@symtab );
  }
  if ( scalar(@ARGV) < 1 ) 
  {
    _usage();
    exit;
  }

  while ( my $filename = shift( @ARGV ) )
  {
    Language::m4::Input::push_file( \%state, $filename )
  }

  Language::m4::Macro::expand_input( \%state, \@symtab );
  
  if ( $freeze_state )
  {
     Language::m4::Freeze::produce_frozen_state();
  }

  return( 0 );
}

=head1 private FUNCTIONS

=head2 _usage

 Usage     : no args
 Purpose   : Print the help message
 Returns   : nothing
 Argument  : none yet
 Throws    : Nothing yet
 Comments  : TODO: Pass a flag for EXIT_FAILURE and EXIT_SUCCESS

=cut

sub _usage
{             
  print "Usage: %s [OPTION]... FILE\n";
  print "\n";
  print "Currently only long options are available.\n";
  print "\n";
  print "Operation modes:\n";
  print "      --help                   display this help and exit\n";
  print "      --version                output version information and exit\n";
  print "\n";
  print "Frozen state files:\n";
  print "      --reload-state=FILE      reload a frozen state from FILE at start\n";

  return;
}

=head1 BUGS

None reported yet.

=head1 SUPPORT

Ask Bernhard.

=head1 AUTHOR

        Bernhard Schmalhofer
        Bernhard.Schmalhofer@gmx.de
        http://www.schmalhofer.info/schmalhofer/bernhard/projects/m4

=head1 COPYRIGHT

GPL

=head1 SEE ALSO

perl(1) GNU m4.

=cut

1; #this line is important and will help the module return a true value
__END__
