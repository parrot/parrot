# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Docs::File - Docs-related file methods

=head1 SYNOPSIS

	use Parrot::Docs::File;
	my $file = Parrot::Docs::File->new('MANIFEST');

=head1 DESCRIPTION

This C<Parrot::IO::File> subclass adds a few documentation-related
methods to do with POD and file type.

It's used by the documentation tools in F<tools/docs>.

=over

=cut

package Parrot::Docs::File;

use strict;

use Parrot::IO::File;
@Parrot::Docs::File::ISA = qw(Parrot::IO::File);

use Pod::Simple::Checker;
use Pod::Simple::HTML;

my $UNDEFINED = 'Undefined';

# These are the Parrot file types excluding the ICU specifc ones.

my %type_for_suffix = (
	'BASIC' => 'README file',
	'C' => 'C code',
	'Log' => 'CVS Entries file',
	'PL' => 'Perl script',
	'SKIP' => 'MANIFEST skip file',
	'STATUS' => 'Languages status file',
	'TXT' => 'Text file',
	'txt' => 'Text file',
	'a' => 'Library file',
	'bas' => 'BACIC code',
	'bef' => 'Befunge code',
	'bf' => 'BF code',
	'bnf' => 'Grammar file',
	'c' => 'C code',
	'cola' => 'Cola code',
	'cs' => 'C# code',
	'declarations' => 'Library declarations file',
	'def' => 'Library definitions file',
	'dev' => 'Development documentation',
	'dump' => 'Dump file',
	'el' => 'eMacs Lisp code',
	'exp' => 'Perl6 expected parse tree',
	'flag' => 'Some kind of IMCC file',
	'generated' => 'MANIFEST generated file',
	'h' => 'C header',
	'hacking' => 'README file',
	'il' => 'MSIL assembler code',
	'imc' => 'IMC code',
	'in' => 'Configuration file',
	'jako' => 'Jako code',
	'jit' => 'JIT file',
	'l' => 'Lex file',
	'num' => 'Opcode numbering file',
	'o' => 'Compiled file',
	'ook' => 'Ook! code',
	'ops' => 'Parrot opcode file',
	'p6' => 'Perl6 code',
	'pasm' => 'Parrot assembly code',
	'pbc' => 'Parrot bytecode',
	'pl' => 'Perl script',
	'pm' => 'Perl module',
	'pmc' => 'PMC code',
	'pod' => 'POD documentation',
	'prd' => 'Parse::RecDescent grammar file',
	'ps' => 'Postscript code',
	'py' => 'Python code',
	'rb' => 'Ryby code',
	's' => 'Some kind of configuration file',
	'scheme' => 'Scheme code',
	'sh' => 'Shell script',
	'spec' => 'RPM build specification',
	't' => 'Test file',
	'tbl' => 'Vtable file',
	'tcl' => 'TCL code',
	'txt' => 'Text file',
	'urm' => 'URM code',
	'vim' => 'Vim file',
	'xml' => 'XML file',
	'xs' => 'XS code',
	'y' => 'Yacc file'
);

# These are the various types of files without suffix.

my %type_for_name = (
	'Artistic' => 'Licence file',
	'BUGS' => 'Project info',
	'CFLAGS' => 'CFLAGS file',
	'ChangeLog' => 'Project info',
	'Changes' => 'Project info',
	'CREDITS' => 'Project info',
	'DEVELOPING' => 'Project info',
	'harness' => 'Perl test harness',
	'INSTALL' => 'Installation documentation',
	'KNOWN_ISSUES' => 'Project info',
	'LICENSE' => 'Licence file',
	'MAINTAINER' => 'Maintainer info',
	'Makefile' => 'Makefile',
	'MANIFEST' => 'Manifest file',
	'NEWS' => 'Project info',
	'PBC_COMPAT' => 'Bytecode compatibility file',
	'README' => 'README file',
	'RELEASE_INSTRUCTIONS' => 'Project info',
	'RESPONSIBLE_PARTIES' => 'Project info',
	'TODO' => 'TODO file',
	'VERSION' => 'Project info',
);

=item C<type_for_suffix($suffix)>

This is a class method that converts a file suffix to a description of
the type of files which have this suffix.

=cut

sub type_for_suffix
{
	my $self = shift;
	my $suffix = shift;
	
	return $type_for_suffix{$suffix} if exists $type_for_suffix{$suffix};

	return $UNDEFINED;
}

=item C<type_for_name($name)>

This is a class method that converts a file name to a description of the
type of files which have this name.

=cut

sub type_for_name
{
	my $self = shift;
	my $name = shift;
	
	return $type_for_name{$name} if exists $type_for_name{$name};
	
	return $UNDEFINED;
}

=item C<type()>

This first tries to find a type for the file's suffix, failing that it
looks at the file's name. If it fails for both it returns 'Undefined'.

=cut

sub type
{
	my $self = shift;
	my $type = $self->type_for_suffix($self->suffix);
	
	return $type unless $type eq $UNDEFINED;
	
	$type = $self->type_for_name($self->name);
	
	return $type unless $type eq $UNDEFINED;
	
	return 'Executable' if $self->is_executable;
		
	return $UNDEFINED;
}

=item C<is_of_type($type)>

Returns whether the file is of the specified type.

=cut

sub is_of_type
{
	my $self = shift;
	my $type = shift;
	
	return 0 unless defined $type;
	
	return $self->type eq $type;
}

=item C<check_pod()>

Runs C<Pod::Simple::Checker> on the contents of the file. Executable
files are assumed not to contain POD and therefore not checked.

=cut

sub check_pod
{
	my $self = shift;
	
	if ( ! $self->is_executable and 
		( ! exists $self->{POD_ERRORS_TIME} or 
		$self->modified_since($self->{POD_ERRORS_TIME}) ) )
	{
		my $checker = Pod::Simple::Checker->new;
	
		$self->{POD_ERRORS_TIME} = time;
		$self->{POD_ERRORS} = '';
		$checker->output_string(\$self->{POD_ERRORS});
		$checker->parse_file($self->path);
		$self->{POD_ERRORS_COUNT} = $checker->errors_seen;
		$self->{CONTAINS_POD} = $checker->content_seen;
	}
}

=item C<contains_pod()>

Tells you whether there is any POD formatted documentation in the file.
Executable files are assumed not to contain POD.

=cut

sub contains_pod
{
	my $self = shift;
	
	$self->check_pod;
	
	return $self->{CONTAINS_POD};
}

=item C<num_pod_errors()>

Tells you the number of POD errors in the file.

=cut

sub num_pod_errors
{
	my $self = shift;
	
	$self->check_pod;
	
	return $self->{POD_ERRORS_COUNT} || 0;
}

=item C<pod_errors($options)>

Gives you a description of any POD errors in the file.

=cut

sub pod_errors
{
	my $self = shift;
	
	$self->check_pod;

	return $self->{POD_ERRORS};
}

=item C<pod_as_html()>

Runs C<Pod::Simple::HTML> on the contents of the file. Executable files
are assumed not to contain POD and therefore not formatted.

=cut

sub pod_as_html
{
	my $self = shift;
	
	if ( $self->contains_pod )
	{
		$self->{POD_HTML} = '';
		
		if ( $self->num_pod_errors == 0 )
		{
			my $checker = Pod::Simple::HTML->new;
		
			$checker->output_string(\$self->{POD_HTML});
			$checker->parse_file($self->path);
		}

		$self->{POD_HTML} =~ s|</head>|<link rel="stylesheet" href="http://dev.perl.org/perl-styles.css" type="text/css" />\n</head>|s;
		$self->{POD_HTML} =~ s|<body>|<body>\n\n<table width=100%>\n<tr>\n<td valign="TOP"><a href="">Contents</a></td>\n<td align="RIGHT"><img src="http://www.parrotcode.org/images/parrot.small.png"></td>\n</tr>\n</table>\n<div class="pod">\n<a name="_top"></a>\n|s;
		$self->{POD_HTML} =~ s|</pre>|\n\n</pre>|gs;
		$self->{POD_HTML} =~ s|\s\*\s+\b| \*|gs;
		$self->{POD_HTML} =~ s|</h(\d)| <a href="#_top"><img alt="^" border=0 src="http://www.parrotcode.org/images/up.gif"></a></h$1|gs;
		$self->{POD_HTML} =~ s|<dt>|<dt><b>|gs;
		$self->{POD_HTML} =~ s|</dt>|</b></dt>|gs;
		$self->{POD_HTML} =~ s|</body>|</div>\n\n</body>|s;
	}
	
	return $self->{POD_HTML};
}

=item C<is_docs_link()>

Returns whether the file is suitable for inclusion in a documentation link.

If a file contains plain text rather than POD it may be directly linked to.

=cut

sub is_docs_link
{
	my $self = shift;

	return $self->type =~ /Licence|info|docu|Text|TODO|status|MANIFEST|README/;
}

=back

=head1 SEE ALSO

C<Parrot::Docs::Directory>, C<Pod::Simple::Checker>, C<Pod::Simple::HTML>.

=cut

1;