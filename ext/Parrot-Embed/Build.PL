#! perl

use strict;
use warnings;

use Cwd;
use Config;
use Module::Build;
use File::Spec::Functions qw( rel2abs catdir catfile updir path );

diag( my $in_parrot_tree    = in_parrot_tree() );
diag( my $dl_env_var        = get_dl_env_var() );
diag( my ($libp, $incp)     = get_paths() );
diag( my ($cflags, $lflags) = get_compiler_flags( $in_parrot_tree ) );
diag( my $parrot            = get_parrot_path( $in_parrot_tree ) );
diag( my $path_sep          = get_path_separator() );

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

    sub ACTION_test
    {
        my \$self = shift;
        \$ENV{$dl_env_var} = join( '$path_sep',
            split( /$path_sep/, ( \$ENV{$dl_env_var} || '' ) ), '$libp' )
            if $in_parrot_tree;

        \$self->SUPER::ACTION_test( \@_ );
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
    add_to_cleanup       => [ 'Parrot-Embed-*' ],
    include_dirs         => [ $incp ],
    extra_compiler_flags => $cflags,
    extra_linker_flags   => $lflags,
);

$builder->create_build_script();

sub in_parrot_tree
{
    my $cwd     = cwd();
    return $cwd =~ /\bext\b.Parrot/;
}

sub get_dl_env_var
{
    return $Config{ldlibpthname} if $Config{ldlibpthname};
    return 'DYLD_LIBRARY_PATH' if $^O =~ /darwin/;
    return 'PATH'              if $^O =~ /Win32/;
    return 'LD_LIBRARY_PATH';
}

sub get_path_separator
{
    return ';' if $^O =~ /Win32/;
    return ':';
}

sub get_compiler_flags
{
    my $in_parrot_tree = shift;
    my $parrot_config = $in_parrot_tree ? "../../parrot_config" : "parrot_config";
    return (`$parrot_config embed-cflags`, `$parrot_config embed-ldflags`);
}

sub get_paths
{
    my $updir    = updir();
    my @lib_dir  = $^O =~ /Win32/ ? () : qw( blib lib );
    my $lib_path = rel2abs( catdir( ($updir) x 2, @lib_dir ) );
    my $inc_path = rel2abs( catdir( ($updir) x 2, 'include' ) );

    return( $lib_path, $inc_path );
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
