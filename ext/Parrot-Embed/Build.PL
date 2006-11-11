use strict;
use warnings;

use Cwd;
use Module::Build;
use File::Spec::Functions qw( rel2abs catdir catfile updir path );

diag( cwd() );
diag( my $in_parrot_tree    = in_parrot_tree() );
diag( my ($cflags, $lflags) = get_compiler_flags( $in_parrot_tree ) );
diag( my $parrot            = get_parrot_path( $in_parrot_tree ) );

my $class = Module::Build->subclass(
	code => <<"END_HERE",
	use File::Spec;

	sub ACTION_build
	{
		my \$self = shift;
		my \@cmd  = ( qw( $parrot -o ),
			map { File::Spec->catfile( 't', "greet.\$_" ) } qw( pbc pir ) );

		system( \@cmd ) == 0 or die "Cannot compile PBC for test: \$?";

		\$self->SUPER::ACTION_build( \@_ );
	}

END_HERE
);

my $builder = $class->new(
	module_name         => 'Parrot::Embed',
	license             => 'perl',
	dist_author         => 'chromatic <chromatic@wgz.org>',
	dist_version_from   => 'lib/Parrot/Embed.pm',
	build_requires =>
	{
		'Test::More'         => 0,
		'ExtUtils::CBuilder' => 0,
	},
	add_to_cleanup      => [ 'Parrot-Embed-*' ],
	extra_compiler_flags => $cflags,
	extra_linker_flags   => $lflags,
);

$builder->create_build_script();

sub in_parrot_tree
{
	my $cwd     = cwd();
	return $cwd =~ /\bext\b.Parrot/;
}

sub get_compiler_flags
{
	my $in_parrot_tree = shift;
	return get_flags_from_parrot_src() if $in_parrot_tree;
	return get_flags_from_pkg_config() if $ENV{PKG_CONFIG_PATH};
}

sub get_flags_from_pkg_config
{
	require ExtUtils::PkgConfig;
	my %pkg_info = ExtUtils::PkgConfig->find( 'parrot' );
	return @pkg_info{qw( cflags libs )};
}

sub get_flags_from_parrot_src
{
	my $updir = updir();
	my $file  = catfile( $updir, $updir, 'parrot.pc' );
	open( my $fh, '<', $file ) or die "Cannot read $file: $!\n";

	my %vars;
	while (<$fh>)
	{
		chomp;
		last unless /\S/;
		my ($var, $value) = split(/=/, $_);
		$vars{$var}       = $value;
	}

	while (<$fh>)
	{
		chomp;
		last unless /\S/;
		my ($var, $value) =  split(/: /, $_);
		$value            =~ s/\${(\w+)}/$vars{$1}/g;
		$vars{$var}       =  $value;
	}
	my $libp       = rel2abs( catdir( ($updir) x 2, qw( blib lib ) ) );

	$vars{Cflags} .= ' -I' . catdir( ($updir) x 2, 'include' );
	$vars{Libs}   .= " -L$libp";

	return @vars{qw( Cflags Libs )};
}

sub get_parrot_path
{
	my $in_parrot_tree = shift;
	return get_parrot_path_internal() if $in_parrot_tree;
	return get_parrot_path_external();
}

sub get_parrot_path_internal
{
	my $updir = updir();
	my $path  = catfile(($updir) x 2, get_parrot_executable_name());

	die "parrot apparently not built!\n" unless -e $path;
	return $path;
}

sub get_parrot_path_external
{
	my $parrot = get_parrot_executable_name();

	for my $path ( path() )
	{
		my $file = catfile( $path, $parrot );
		next unless -e $file;
		return $file;
	}

	die "parrot apparently not installed in \$PATH\n";
}

sub get_parrot_executable_name
{
	return 'parrot' unless $^O =~ /Win32/;
	return 'parrot.exe';
}

sub diag
{
	return unless $ENV{PE_DEBUG};
	print STDERR "<$_>\n" for @_;
}
