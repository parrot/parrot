#!env perl

=head1 DESCRIPTION

=head1 SYNTAX

=cut

# pragmata
use strict;
use 5.008;

# standard perl modules

# Modules from CPAN
use Parse::RecDescent;
use YAML;

# local Modules


# Create a parser that outputs an Array
$::RD_ERRORS = 1;
$::RD_WARN   = 1;
$::RD_HINT   = 1;
#$::RD_TRACE  = 1;
$::RD_TRACE  = undef;
my $frozen_parser = Parse::RecDescent->new( << 'END_GRAMMAR' );

{
  $::name_len         = 0; 
  $::substitution_len = 0; 
}

# We are only interested in the macro definitions
frozen:             comment V1 macros comment
                  { $item[3] }

# Return a hash reference where the macro_name is the key
macros:             macro(s)
                  { my $dummy = { map { $_->[0] => 
                                        { flag         => $_->[1],
                                          substitution => $_->[2],
                                        }
                                      } @{$item[1]}
                                }
                  }

# ignore comments
comment:            m/^#[^\n]*\n/

# TODO: What does this means???
V1:                 "V1\n"

# for each macro we need: name, substitution and flag
# The length is uninteresting later on.
# 
# Example:
# F8,8
# translittranslit
#
# Flag is 'F'
# Name is 'translit'
# substitution: 'translit'
macro:              flag name_len ',' substitution_len name substitution 
                  { [ @item[5,1,6] ] }       

# TODO: What does this means???
flag:               'F' | 'T'

# We need the len of the macro name, 
# because we extract is as a substring in the next line
name_len:           m/[0-9]+/
                  { $::name_len = $item[1] }

# We need the len of the macro substitution,
# because we extract is as a substring in the next line
substitution_len:   m/[0-9]+/
                  { $::substitution_len = $item[1] }

# length is known from the line above
name:               m/[a-zA-Z0-9_-]{$::name_len}/ 

# length is known from the line above
substitution:       m/[a-zA-Z0-9_-]{$::substitution_len}/ 

END_GRAMMAR

# Slurp in the frozen-state file
my $frozen;
{
  $/ = undef;
  $frozen = <>;
}
#print Dump( $frozen );

# Parse the freeze-state
my $symtab = $frozen_parser->frozen( $frozen );

# Dump the parsed data as YAML 
print Dump( $symtab );


=head1 SEE ALSO

=head1 AUTHOR

=cut


__END__
                  { my $acd = { application => $item[1],
                                input       => $item[2], 
                                advanced    => $item[3], 
                                output      => $item[4], 
                              }
                  }          

# General info about the programm
application:        'application:' application_name definitions 
                  { my $application = { name        => $item[2],
                                        definitions => $item[3], 
                                      }
                  }          

# input parameters
input:              'section: input' definitions  parameter(s) 'endsection: input' 
                  { my $input = { definitions => $item[2],
                                  parameters  => $item[3], 
                                }
                  }          

# advanced input parameters
advanced:           'section: advanced' definitions parameter(s) 'endsection: advanced' 
                  { my $advanced = { definitions => $item[2],
                                     parameters  => $item[3], 
                                   }
                  }          

# output parameters
output:             'section: output' definitions  parameter(s) 'endsection: output' 
                  { my $output = { definitions => $item[2],
                                   parameters  => $item[3],
                                 }
                  }          

parameter:          data_type ':'  parameter_name definitions 
                  { my $parameter = { type        => $item[1],
                                      name        => $item[3],
				      definitions => $item[4], 
                                    }
                  }          

definitions:        '['  definition(s) ']'   { my $defs = { map( @{$_}, @{$item[2]} ) } }

definition:         key ':'  '"'  value '"'  { my $def = [ $item[1] => $item[4] ] } 

application_name:   m/$NAMEPART/             { $item[1] }

parameter_name:     m/$NAMEPART/             { $item[1] }

key:                m/$NAMEPART/             { $item[1] }

data_type:          m/$NAMEPART/             { $item[1] }

value:              m/[^"]+/                 { $item[1] }

END_GRAMMAR

my $programs = $reqaller->get_selection( -method => 'WWW', -selection => $selection );
my $acd = { };
{
  if ( $selection )
  {
    my $acd_pretty = $reqaller->get_acd( -method => 'WWW', -selection => $selection, -emboss_program => $emboss_program );
    $acd = $acd_parser->acd( $acd_pretty );
#die Dumper( $acd_pretty, $acd );
  }
}
# TODO: put this in parser
$acd->{input} = [ { parameters => [] } ] if ( ! exists $acd->{input} || scalar($acd->{input}) == 0 );
 
</%init>
<%attr>

title        => 'Biomax ReqALLer'
method       => 'EMBOSS'
REQUEST_type => 'WWW'

</%attr>
<%def .param>
% if ( $param->{name} eq 'sequence' )
% {
<& 'prompt_for_queryseq.mas', method => 'WWW', seq_manager => $seq_manager &>
% }
% else
% { 
<tr>
  <td><% $_->{name} %></td>
  <td><% $_->{definitions}->{information} %></td>
  <td><% $_->{definitions}->{default} %></td>
<%perl>
    if ( $_->{type} eq 'list' )
    {
      my $delimiter     = $_->{definitions}->{delimiter};
      my $codedelimiter = $_->{definitions}->{codedelimiter};
      if ( defined $codedelimiter )
      {
        my ( @values, %label );
        foreach ( split( $delimiter, $_->{definitions}->{values} ) )
        {
	  my ( $value ) = split( $codedelimiter, $_ );
	  $label{$value} = $_;
	  push @values, $value;
        }
        $m->print( CGI::td( $q->popup_menu( -name    => "WWW*${selection}_$_->{name}*1",
		                            -values  => \@values,
		                            -labels  => \%label,
		                            -default => $_->{definitions}->{default} ) ) );
      }
      else
      {
        my @values = split( $delimiter, $_->{definitions}->{values} );
        $m->print( CGI::td( $q->popup_menu( -name    => "WWW*${selection}_$_->{name}*1",
		                            -values  => \@values,
		                            -default => $_->{definitions}->{default} ) ) );
      }
    }
    elsif ( $_->{type} eq 'integer' )   # TODO, check wether integer
    {
      $m->print( CGI::td( $q->textfield( -name => "WWW*${selection}_$_->{name}*1" ) ) ); 
    }
    elsif ( $_->{type} eq 'boolean' )   # TODO, check wether boolean
    {
      $m->print( CGI::td( $q->radio_group( -name    => "WWW*${selection}_$_->{name}*1",
		                           -values  => [ 'Yes', 'No' ],
		                           -default => '-' ) ) );
    }
    elsif ( $_->{type} eq 'codon' )  
    {
  # TODO: this should be automatic
      my @cut = qw(
    Eacc.cut
    Eadenovirus5.cut
    Eadenovirus7.cut
    Eaidlav.cut
    Eanasp.cut
    Eani.cut
    Eani_h.cut
    Eanidmit.cut
    Easn.cut
    Eath.cut
    Eatu.cut
    Eavi.cut
    Ebja.cut
    Ebly.cut
    Ebme.cut
    Ebmo.cut
    Ebna.cut
    Ebov.cut
    Ebovsp.cut
    Ebst.cut
    Ebsu.cut
    Ebsu_h.cut
    Ecac.cut
    Ecal.cut
    Eccr.cut
    Ecel.cut
    Echi.cut
    Echicken.cut
    Echisp.cut
    Echk.cut
    Echmp.cut
    Echnt.cut
    Echos.cut
    Echzm.cut
    Echzmrubp.cut
    Ecpx.cut
    Ecre.cut
    Ecrisp.cut
    Ectr.cut
    Edayhoff.cut
    Eddi.cut
    Eddi_h.cut
    Edog.cut
    Edro.cut
    Edro_h.cut
    Edrosophila.cut
    Eeca.cut
    Eeco.cut
    Eeco_h.cut
    Eecoli.cut
    Ef1.cut
    Efish.cut
    Efmdvpolyp.cut
    Eham.cut
    Ehha.cut
    Ehin.cut
    Ehma.cut
    Ehum.cut
    Ehuman.cut
    Ekla.cut
    Ekpn.cut
    Ella.cut
    Emac.cut
    Emaize.cut
    Emam_h.cut
    Emixlg.cut
    Emouse.cut
    Emsa.cut
    Emse.cut
    Emta.cut
    Emtu.cut
    Emus.cut
    Emussp.cut
    Emva.cut
    Emze.cut
    Emzecp.cut
    Encr.cut
    Eneu.cut
    Engo.cut
    Eoncsp.cut
    Epae.cut
    Epea.cut
    Epet.cut
    Epfa.cut
    Ephix174.cut
    Ephv.cut
    Ephy.cut
    Epig.cut
    Epolyomaa2.cut
    Epombe.cut
    Epombecai.cut
    Epot.cut
    Eppu.cut
    Epse.cut
    Epsy.cut
    Epvu.cut
    Erab.cut
    Erabbit.cut
    Erabsp.cut
    Erat.cut
    Eratsp.cut
    Erca.cut
    Erhm.cut
    Eric.cut
    Erle.cut
    Erme.cut
    Ersp.cut
    Esalsp.cut
    Esau.cut
    Esco.cut
    Esgi.cut
    Eshp.cut
    Eshpsp.cut
    Esli.cut
    Eslm.cut
    Esma.cut
    Esmi.cut
    Esmu.cut
    Esoy.cut
    Espi.cut
    Espn.cut
    Espo.cut
    Espo_h.cut
    Espu.cut
    Esta.cut
    Esty.cut
    Esus.cut
    Esv40.cut
    Esyhsp.cut
    Esynsp.cut
    Etbr.cut
    Etcr.cut
    Eter.cut
    Etetsp.cut
    Etob.cut
    Etobcp.cut
    Etom.cut
    Etrb.cut
    Evco.cut
    Ewht.cut
    Exel.cut
    Exenopus.cut
    Eyeast.cut
    Eyeastcai.cut
    Eyen.cut
    Eysc.cut
    Eysc_h.cut
    Eyscmt.cut
    Eysp.cut
    Ezebrafish.cut
    Ezma.cut );
      $m->print( CGI::td( $q->popup_menu( -name    => "WWW*${selection}_$_->{name}*1",
		                          -values  => \@cut,
		                          -default => 'Ehum.cut'  ) ) ); 
    }
    else
    {
      die Dumper( $_ );    # TODO error checking
    }
</%perl>
    </tr>
% } 
<%args>

$param
$seq_manager
$selection

</%args>
</%def>
<%method javascript>

/* User klicks 'Clear Input' */
function clear_action()
{
  alert( 'Not implemented yet' );

  /* TODO: implement and test */
  /* document.request_form.REQUEST_task.value = "REBUILD"; */
  /* document.request_form.submit(); */

  return;
}

/* User has chosen a new selection  */
function choose_action()
{
  document.request_form.REQUEST_task.value = "REBUILD"; 
  document.request_form.submit(); 

  return;
}

/* User klicks 'Execute' */
function run_action( )
{
  if ( document.request_form.REQUEST_user.value != document.request_form.REQUEST_creator.value )
  {
    alert( "This Request was designed by " + document.request_form.REQUEST_creator.value + ". You are not privileged to execute this request!" );
  }
  else if ( document.request_form.REQUEST_name.value == '' )
  {
    alert( "Please enter a valid request name." );
  }
  else
  {
    document.request_form.REQUEST_task.value = "ACTION";
    document.request_form.submit();
  }

  return;
}

/* User klicks 'Delete' */
function delete_action( )
{
  alert( 'Not implemented yet' );

  /* TODO: implement and test */
 
  return;
}

</%method>
