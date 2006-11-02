# $Id$

=head1 NAME

plumhead.pl - A playful implementation of PHP

=head1 DESCRIPTION

Take XML from phc and transform it with XSLT to PIR setting up PAST.

=cut

package main;

# pragmata
use strict;
use warnings;
use 5.006_001;

# core Perl modules
use Data::Dumper;
use Getopt::Long;

# Modules from CPAN
use Log::Log4perl qw(:easy);
use XML::LibXML;
use XML::LibXSLT;

Log::Log4perl->easy_init( { level    => $DEBUG,
                            file     => '>plumhead.log',
                          } );

my $logger = Log::Log4perl->get_logger();

my ( $php_fn ) = @ARGV;

# Generate the PHP AST as XML
my $phc_str = `phc --dump-ast-xml $php_fn`;
$logger->debug( $phc_str );

my $parser      = XML::LibXML->new();
my $xslt        = XML::LibXSLT->new();
  
my $phc_xml              = $parser->parse_string( $phc_str );
my $phc_xml_to_past_xml  = $parser->parse_file( 'languages/plumhead/phc_xml_to_past_xml.xsl' );
my $to_past_xml          = $xslt->parse_stylesheet( $phc_xml_to_past_xml );
my $past_xml             = $to_past_xml->transform( $phc_xml );

my $past_xml_to_past_pir = $parser->parse_file( 'languages/plumhead/past_xml_to_past_pir.xsl' );
my $to_past_pir          = $xslt->parse_stylesheet( $past_xml_to_past_pir );
my $past_pir             = $to_past_pir->transform( $past_xml );

my $pir_fn = $php_fn;
$pir_fn =~ s/ \. [^.]* \z //xms;
$pir_fn .= '.pir';

open my $pir_fh, '>', $pir_fn or die "Can't open $pir_fn: $!";
print {$pir_fh} $to_past_pir->output_string( $past_pir );

system "./parrot $pir_fn";

=head1 SEE ALSO

=head1 AUTHOR

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
