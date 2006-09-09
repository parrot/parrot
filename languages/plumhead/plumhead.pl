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

my $phc_str = `phc --dump-ast-xml languages/plumhead/t/hello_1.php`;
$logger->debug( $phc_str );

my $parser = XML::LibXML->new();
my $xslt = XML::LibXSLT->new();
  
my $phc_ast     = $parser->parse_string( $phc_str );
my $phc_to_past = $parser->parse_file( 'languages/plumhead/phc_to_past.xsl' );
my $transform   = $xslt->parse_stylesheet( $phc_to_past );
my $past        = $transform->transform( $phc_ast );

open ( my $pir_fh, '>', 'languages/plumhead/t/hello_1.pir' );
print {$pir_fh} $transform->output_string( $past );

system( './parrot languages/plumhead/t/hello_1.pir' );

=head1 SEE ALSO

=head1 AUTHOR

=cut
