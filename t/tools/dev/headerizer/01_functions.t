#! perl
# Copyright (C) 2010-2011, Parrot Foundation.

use strict;
use warnings;
use Test::More tests => 67;
use Carp;
use Cwd;
use File::Copy;
use File::Path qw( mkpath );
use File::Spec;
use File::Temp qw( tempdir );
use lib qw( lib );
use Parrot::Config;
use Parrot::Headerizer::Functions qw(
    process_argv
    read_file
    write_file
    qualify_sourcefile
    replace_pod_item
    no_both_PARROT_EXPORT_and_PARROT_INLINE
    validate_prototype_args
    no_both_static_and_PARROT_EXPORT
    handle_split_declaration
    asserts_from_args
    handle_modified_args
    add_newline_if_multiline
    add_asserts_to_declarations
    func_modifies
    add_headerizer_markers
);

use IO::CaptureOutput qw| capture |;

my $cwd = cwd();
my (@ofiles, $rv, $expected);

# process_argv()
eval {
    @ofiles = process_argv();
};
like($@, qr/No files specified/,
    "Got expected error message for no files specified");

@ofiles = qw( alpha.o beta.o gamma.o alpha.o );
{
    my ($stdout, $stderr);
    capture(
        sub { @ofiles = process_argv(@ofiles); },
        \$stdout,
        \$stderr,
    );
    is(@ofiles, 3, "Got expected number of ofiles");
    like( $stdout,
        qr/alpha\.o is specified more than once/s,
        "Got expected message for an argument supplied more than once"
    );
}

@ofiles = qw( alpha.o beta.o gamma.o );
is(@ofiles, 3, "Got expected number of ofiles");

# read_file; write_file
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir;
    my $file = "filename$$";
    my @lines_to_write = (
        "Goodbye\n",
        "cruel\n",
        "world\n",
    );
    my $text = join( '' => @lines_to_write );
    write_file($file, $text);
    ok(-f $file, "File was written");

    my $text_returned = read_file($file);
    ok($text_returned, "Got non-empty string back from read_file()");
    my @lines_read = split /\n/, $text_returned;
    is($lines_read[0], 'Goodbye', "Got first line");
    is($lines_read[1], 'cruel', "Got second line");
    is($lines_read[2], 'world', "Got third line");
    chdir $cwd or die "Unable to chdir: $!";
}

my $filename = 'foobar';
eval {
    read_file($filename);
};
like($@, qr/couldn't read '$filename'/, "Got expected error message for read_file()");

# qualify_sourcefile()
my ($ofile, $is_yacc);
my ($sourcefile, $source_code, $hfile);
$ofile = 'foobar.xyz';
eval {
    my ($sourcefile, $source_code, $hfile) =
        qualify_sourcefile( {
            ofile           => $ofile,
            PConfig         => \%PConfig,
            is_yacc         => 0,
        } );
};
like($@, qr/$ofile doesn't look like an object file/,
    "Got expected die message for non-object, non-yacc file" );

# Testing Needs We don't really need a .o file, we just need its name.
# However, we do need one .c file and one .pmc file.  In order to have the
# codingstd tests skip these, we should name them .in and then copy them into
# position with the extensions we need.  We need one file where there is no
# HEADERIZER HFILE directive within the file.  We need a case where the
# HEADERIZER HFILE directive contains 'none'.  We need a case where the header
# file exists and one where it does not.

{
    my $tdir = tempdir( CLEANUP => 1 );
    my $stub = 'lack_directive';
    copy "$cwd/t/tools/dev/headerizer/testlib/$stub.in" =>
         "$tdir/$stub.c" or croak "Unable to copy file for testing";
    $ofile = "$tdir/$stub.o";
    my $expected_cfile = "$tdir/$stub.c";
    my $expected_cfile_qm = quotemeta $expected_cfile;
    eval {
        my ($sourcefile, $source_code, $hfile) =
            qualify_sourcefile( {
                ofile           => $ofile,
                PConfig         => \%PConfig,
                is_yacc         => 0,
            } );
    };
    like($@, qr/can't find HEADERIZER HFILE directive in "$expected_cfile_qm"/,
        "Got expected die message for file lacking HEADERIZER HFILE directive" );
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    my $stub = 'none';
    copy "$cwd/t/tools/dev/headerizer/testlib/$stub.in" =>
         "$tdir/$stub.c" or croak "Unable to copy file for testing";
    $ofile = "$tdir/$stub.o";
    my $expected_cfile = "$tdir/$stub.c";
    my ($sourcefile, $source_code, $hfile) =
        qualify_sourcefile( {
            ofile           => $ofile,
            PConfig         => \%PConfig,
            is_yacc         => 0,
        } );
    is( $sourcefile, $expected_cfile, "Got expected C source file" );
    like( $source_code, qr/This file has 'none'/,
        "Got expected source code" );
    is( $hfile, 'none', "As expected, no header file" );
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    my $stub = 'missingheaderfile';
    copy "$cwd/t/tools/dev/headerizer/testlib/$stub.in" =>
         "$tdir/$stub.c" or croak "Unable to copy file for testing";
    $ofile = "$tdir/$stub.o";
    my $expected_cfile = "$tdir/$stub.c";
    my $expected_cfile_qm = quotemeta $expected_cfile;
    eval {
        my ($sourcefile, $source_code, $hfile) =
            qualify_sourcefile( {
                ofile           => $ofile,
                PConfig         => \%PConfig,
                is_yacc         => 0,
            } );
    };
    like($@, qr/"$stub" not found \(referenced from "$expected_cfile_qm"\)/,
        "Got expected error message for missing header file" );
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    my $stub = 'validheader';
    copy "$cwd/t/tools/dev/headerizer/testlib/$stub.in" =>
         "$tdir/$stub.c" or croak "Unable to copy file for testing";
    copy "$cwd/t/tools/dev/headerizer/testlib/h$stub.in" =>
         "$tdir/$stub.h" or croak "Unable to copy file for testing";
    $ofile = "$tdir/$stub.o";
    my $expected_cfile = "$tdir/$stub.c";
    chdir $tdir;
    my ($sourcefile, $source_code, $hfile) =
        qualify_sourcefile( {
            ofile           => $ofile,
            PConfig         => \%PConfig,
            is_yacc         => 0,
        } );
    chdir $cwd;
    is( $sourcefile, $expected_cfile, "Got expected C source file" );
    like( $source_code, qr/This file has a valid HEADERIZER HFILE/,
        "Got expected source code" );
    is( $hfile, "$stub.h", "Got expected header file" );
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    my $stub = 'validheader';
    copy "$cwd/t/tools/dev/headerizer/testlib/$stub.in" =>
         "$tdir/$stub.pmc" or croak "Unable to copy file for testing";
    copy "$cwd/t/tools/dev/headerizer/testlib/h$stub.in" =>
         "$tdir/$stub.h" or croak "Unable to copy file for testing";
    $ofile = "$tdir/$stub.o";
    my $expected_cfile = "$tdir/$stub.pmc";
    chdir $tdir;
    my ($sourcefile, $source_code, $hfile) =
        qualify_sourcefile( {
            ofile           => $ofile,
            PConfig         => \%PConfig,
            is_yacc         => 0,
        } );
    chdir $cwd;
    is( $sourcefile, $expected_cfile, "Got expected PMC file" );
    like( $source_code, qr/This file has a valid HEADERIZER HFILE/,
        "Got expected source code" );
    is( $hfile, "$stub.h", "Got expected header file" );
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    my $stub = 'imcc';
    copy "$cwd/t/tools/dev/headerizer/testlib/$stub.in" =>
         "$tdir/$stub.y" or croak "Unable to copy file for testing";
    $ofile = "$tdir/$stub.y";
    my $expected_cfile = $ofile;
    my ($sourcefile, $source_code, $hfile) =
        qualify_sourcefile( {
            ofile           => $ofile,
            PConfig         => \%PConfig,
            is_yacc         => 1,
        } );
    is( $sourcefile, $expected_cfile, "Got expected C source file" );
    like( $source_code, qr/HEADERIZER HFILE: none/, "Got expected source code" );
    is( $hfile, 'none', "As expected, no header file" );
}

# replace_pod_item()
my ($text_in, $text_out, $name, $heading, $cfile_name);
{
    $name = 'Parrot_list_destroy';
    $text_in = "alpha\n=item C< $name >\n\n";
    $heading = 'item C<void Parrot_list_destroy(PARROT_INTERP, Linked_List* list)>';
    $cfile_name = 'src/list.c';
    $expected = "alpha\n$heading\n\n";
    $text_out = replace_pod_item( {
        text        => $text_in,
        name        => $name,
        heading     => $heading,
        cfile_name  => $cfile_name,
    } );
    is( $text_out, $expected,
        "POD heading transformed as expected" );
}

{
    $name = 'Parrot_list_destroy';
    $text_in = "alpha\n=item C<foobar>\n\n";
    $heading = 'item C<void Parrot_list_destroy(PARROT_INTERP, Linked_List* list)>';
    $cfile_name = 'src/list.c';
    {
        my ($stdout, $stderr);
        capture(
            sub {
                $text_out = replace_pod_item( {
                    text        => $text_in,
                    name        => $name,
                    heading     => $heading,
                    cfile_name  => $cfile_name,
                } );
            },
            \$stdout,
            \$stderr,
        );
        like($stderr, qr/$cfile_name: $name has no POD/,
            "Got expected warning");
    }
}

{
    $name = 'yy_Parrot_list_destroy';
    $text_in = "alpha\n=item C<foobar>\n\n";
    $heading = 'item C<void Parrot_list_destroy(PARROT_INTERP, Linked_List* list)>';
    $cfile_name = 'src/list.c';
    {
        my ($stdout, $stderr);
        capture(
            sub {
                $text_out = replace_pod_item( {
                    text        => $text_in,
                    name        => $name,
                    heading     => $heading,
                    cfile_name  => $cfile_name,
                } );
            },
            \$stdout,
            \$stderr,
        );
        ok(! $stderr, "yacc files exempt from POD requirement");
    }
}

# no_both_PARROT_EXPORT_and_PARROT_INLINE()
my ($text, $parrot_inline, $parrot_api);
{
    local $@ = '';
    $filename = 'foobar';
    $name = 'alpha';
    $parrot_inline = 1;
    $parrot_api = 0;
    no_both_PARROT_EXPORT_and_PARROT_INLINE( {
        file            => $filename,
        name            => $name,
        parrot_inline   => $parrot_inline,
        parrot_api      => $parrot_api,
    } );
    ok(! $@, "PARROT_EXPORT and PARROT_INLINE not both true: No 'die' message recorded, as expected" );
}

# no_both_PARROT_EXPORT_and_PARROT_INLINE
{
    local $@ = '';
    $filename = 'foobar';
    $name = 'alpha';
    $parrot_inline = 1;
    $parrot_api = 1;
    eval {
        no_both_PARROT_EXPORT_and_PARROT_INLINE( {
            file            => $filename,
            name            => $name,
            parrot_inline   => $parrot_inline,
            parrot_api      => $parrot_api,
        } );
    };
    like($@, qr/$filename $name: Can't have both PARROT_EXPORT and PARROT_INLINE/,
        "PARROT_EXPORT and PARROT_INLINE  both true: Got expected 'die' message" );
}

# validate_prototype_args
my ($args, $proto);
{
    local $@ = '';
    $args = join(' , ' => (
        'alpha beta',
        '...',
        'void',
        'PARROT_INTERP(interp)',
        'NULLOK_INTERP(interp)',
        'SHIM_INTERP',
    ) );
    $proto = 'myprototype';
    my @args_out = validate_prototype_args( $args, $proto );
    ok(! $@, "No error message recorded");

    $args .= ' , single';
    eval {
        @args_out = validate_prototype_args( $args, $proto );
    };
    like($@, qr/Bad args in $proto/,
        "Detected invalid prototype arg");
}

# no_both_static_and_PARROT_EXPORT
my ($return_type_in, $return_type_out, $is_static);
{
    local $@ = '';
    $filename = 'foobar';
    $name = 'alpha';
    $return_type_in = 'int';
    $parrot_api = 0;
    ($return_type_out, $is_static) = no_both_static_and_PARROT_EXPORT( {
        file            => $filename,
        name            => $name,
        return_type     => $return_type_in,
        parrot_api      => $parrot_api,
    } );
    is($return_type_out, $return_type_in, "Return type unaltered");
    ok(! $is_static, "Not static" );
}

{
    local $@ = '';
    $filename = 'foobar';
    $name = 'alpha';
    $return_type_in = 'static gamma';
    $parrot_api = 0;
    ($return_type_out, $is_static) = no_both_static_and_PARROT_EXPORT( {
        file            => $filename,
        name            => $name,
        return_type     => $return_type_in,
        parrot_api      => $parrot_api,
    } );
    is($return_type_out, 'gamma', "Return type altered");
    ok($is_static, "Is static" );
}

{
    local $@ = '';
    $filename = 'foobar';
    $name = 'alpha';
    $return_type_in = 'static gamma';
    $parrot_api = 1;
    eval {
        ($return_type_out, $is_static) = no_both_static_and_PARROT_EXPORT( {
            file            => $filename,
            name            => $name,
            return_type     => $return_type_in,
            parrot_api      => $parrot_api,
        } );
    };
    like($@, qr/$filename $name: Impossible to have both static and PARROT_EXPORT/,
        "Both static and PARROT_EXPORT: Got expected 'die' message" );
}

# handle_split_declaration()
my ($function_decl, $line_len);
my @first_list = qw(
    alpha beta gamma delta epsilon zeta eta theta
    iota kappa lambda mu nu xi omicron
);
my @second_list = qw( pi rho sigma tau );
$line_len = 80;
$function_decl = join(' ' => @first_list);
$expected = $function_decl;
is( handle_split_declaration( $function_decl, $line_len ),
    $expected,
    "function declaration was exactly $line_len characters long" );

$function_decl = join(' ' => (@first_list, @second_list));
$expected = join(' ' => @first_list) . "\n" . join(' ' => @second_list);
is( handle_split_declaration( $function_decl, $line_len ),
    $expected,
    "function declaration exceeded $line_len characters and so was split" );

# asserts_from_args()
my (@args, %asserts);
@args = (
    'SHIM_INTERP',
    'ARGIN(Linked_List *list)',
    'ARGIN(List_Item_Header *item)',
);
%asserts = map { $_ => 1 } asserts_from_args( @args );
is( keys %asserts, 2, "Got expected number of asserts" );
ok( exists $asserts{'PARROT_ASSERT_ARG(list)'}, "Got expected assert" );
ok( exists $asserts{'PARROT_ASSERT_ARG(item)'}, "Got expected assert" );

@args = (
    'PARROT_INTERP',
    'ARGIN(Linked_List *list)',
    'ARGIN(List_Item_Header *item)',
    'SHIM_INTERP',
);
%asserts = map { $_ => 1 } asserts_from_args( @args );
is( keys %asserts, 3, "Got expected number of asserts" );
ok( exists $asserts{'PARROT_ASSERT_ARG(list)'}, "Got expected assert" );
ok( exists $asserts{'PARROT_ASSERT_ARG(item)'}, "Got expected assert" );
ok( exists $asserts{'PARROT_ASSERT_ARG(interp)'}, "Got expected assert" );

@args = (
    'ARGFREE_NOTNULL(_abcDEF123)',
    'PARROT_INTERP',
    'ARGIN(Linked_List *list)',
    'ARGIN(List_Item_Header *item)',
    'SHIM_INTERP',
);
%asserts = map { $_ => 1 } asserts_from_args( @args );
is( keys %asserts, 4, "Got expected number of asserts" );
ok( exists $asserts{'PARROT_ASSERT_ARG(list)'}, "Got expected assert" );
ok( exists $asserts{'PARROT_ASSERT_ARG(item)'}, "Got expected assert" );
ok( exists $asserts{'PARROT_ASSERT_ARG(interp)'}, "Got expected assert" );
ok( exists $asserts{'PARROT_ASSERT_ARG(_abcDEF123)'}, "Got expected assert" );

# handle_modified_args()
my ($decl_in, $decl_out, $multiline);

my @modified_args;
$decl_in = 'void Parrot_list_append(';
@modified_args = qw( alpha beta gamma );
($decl_out, $multiline) = handle_modified_args(
    $decl_in, \@modified_args);
is( $decl_out, $decl_in . 'alpha, beta, gamma)',
    "Got expected portion of declaration (short)" );
ok( ! $multiline, "Short portion of declaration means no multiline" );

$decl_in = 'void Parrot_list_append(';
@modified_args = (
  'FOOBAR EXTRAORDINARY',
  'ARGMOD(Linked_List *list)',
  'ARGMOD(List_Item_Header *item)',
);
$expected = $decl_in .
    "\n\t$modified_args[0]" . ',' .
    "\n\t$modified_args[1]" . ',' .
    "\n\t$modified_args[2]" . ')';
($decl_out, $multiline) = handle_modified_args(
    $decl_in, \@modified_args);
is( $decl_out, $expected,
    "Got expected portion of declaration (long)" );
ok( $multiline, "Long portion of declaration means multiline" );

$decl_in = 'void Parrot_list_append(';
@modified_args = (
  'PARROT_INTERP',
  'ARGMOD(Linked_List *list)',
  'ARGMOD(List_Item_Header *item)',
);
$expected = $decl_in .
    $modified_args[0] . ',' .
    "\n\t$modified_args[1]" . ',' .
    "\n\t$modified_args[2]" . ')';
($decl_out, $multiline) = handle_modified_args(
    $decl_in, \@modified_args);
is( $decl_out, $expected,
    "Got expected portion of declaration (long SHIM)" );
ok( $multiline, "Long portion of declaration means multiline" );

$decl_in = 'void Parrot_list_append(';
@modified_args = (
  'PARROT_INTERP INCURABLY_EXTREMELY_EXTRAORDINARILY_ARGMOD(Linked_List *list)',
);
$expected = "$decl_in$modified_args[0])";
($decl_out, $multiline) = handle_modified_args(
    $decl_in, \@modified_args);
is( $decl_out, $expected,
    "Got expected portion of declaration (long SHIM one arg)" );
ok( $multiline, "Long portion of declaration means multiline" );

# add_newline_if_multiline()
$decl_in = 'alpha';
$multiline = 1;
$decl_out = add_newline_if_multiline($decl_in, $multiline);
is( $decl_out, "alpha;\n",
    "Got expected value from add_newline_if_multiline()" );

$decl_in = 'alpha';
$multiline = 0;
$decl_out = add_newline_if_multiline($decl_in, $multiline);
is( $decl_out, "alpha;",
    "Got expected value from add_newline_if_multiline()" );


# add_asserts_to_declarations()
my $funcs_ref = [
  {
    'macros' => [
      'PARROT_EXPORT'
    ],
    'return_type' => 'void',
    'is_api' => 1,
    'is_inline' => undef,
    'is_static' => undef,
    'args' => [
      'SHIM_INTERP',
      'ARGMOD(Linked_List *list)',
      'ARGMOD(List_Item_Header *item)'
    ],
    'name' => 'Parrot_list_append_and_append_and_append',
    'file' => 'src/list.c',
    'is_ignorable' => 0
  },
];
my $decls_ref = [];
my @decls = add_asserts_to_declarations($funcs_ref, $decls_ref);
$expected = <<'EXP';
#define ASSERT_ARGS_Parrot_list_append_and_append_and_append \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(list) \
EXP
$expected .= '    , PARROT_ASSERT_ARG(item))';
is( $decls[0], $expected,
    "Got expected declaration from add_asserts_to_declarations()" );

# func_modifies()
my ($arg, @mods, @mods_out);
$arg = 'ARGMOD(List_Item_Header *item)';
@mods = ( 'FUNC_MODIFIES(*list)' );
$expected = [
    'FUNC_MODIFIES(*list)',
    'FUNC_MODIFIES(*item)',
];
@mods_out = func_modifies($arg, \@mods);
is_deeply( \@mods_out, $expected,
    "Got expected output of func_modifies()" );

$arg = 'foobar';
@mods = ( 'FUNC_MODIFIES(*list)' );
$expected = [
    'FUNC_MODIFIES(*list)',
];
@mods_out = func_modifies($arg, \@mods);
is_deeply( \@mods_out, $expected,
    "Got expected output of func_modifies()" );

$arg = 'ARGMOD_NULLOK(List_Item_Header alpha)';
@mods = ( 'FUNC_MODIFIES(*list)' );
$expected = [
    'FUNC_MODIFIES(*list)',
    'FUNC_MODIFIES(alpha)',
];
@mods_out = func_modifies($arg, \@mods);
is_deeply( \@mods_out, $expected,
    "Got expected output of func_modifies()" );

eval {
   $arg = 'ARGMOD_NULLOK(List_Item_Header)';
   @mods = ( 'FUNC_MODIFIES(*list)' );
   $expected = [
       'FUNC_MODIFIES(*list)',
       'FUNC_MODIFIES(alpha)',
   ];
   @mods_out = func_modifies($arg, \@mods);
};
like($@, qr/Unable to figure out the modified/,
    "Got expected error message for func_modifies()" );


# add_headerizer_markers
#{
#    my $tdir = tempdir( CLEANUP => 1 );
#    chdir $tdir or croak "Unable to chdir during testing";
#
#    my $stub = 'list';
#    my $srcdir    = File::Spec->catpath( $tdir, 'src' );
#    mkpath( $srcdir, 0, 0777 );
#    my $srco      = File::Spec->catfile( $srcdir, "$stub.o" );
#    touchfile($srco);
#    my $srcc      = File::Spec->catfile( $srcdir, "$stub.c" );
#    copy "$cwd/t/tools/dev/headerizer/testlib/list.in" => $srcc
#        or croak "Unable to copy";
#    my $incdir    = File::Spec->catpath( $tdir, 'include', 'parrot' );
#    mkpath( $incdir, 0, 0777 );
#    my $inch      = File::Spec->catfile( $incdir, "$stub.h" );
#    copy "$cwd/t/tools/dev/headerizer/testlib/list_h.in" => $inch
#        or croak "Unable to copy";
#
#    my $source_code = read_file($srcc);
#    my $function_decls_file = "$tdir/function_decls";
#    copy "$cwd/t/tools/dev/headerizer/testlib/function_decls.in" =>
#        $function_decls_file or croak "Unable to copy";
#    my $intext = read_file($function_decls_file);
#    my @function_decls;
#    ( @function_decls ) = $intext =~ m/'([^,][^']*?)'/gs;
#
# TEST IS NOT SET UP PROPERLY YET.
#
#    my $headerized_source =  add_headerizer_markers( {
#        function_decls  => \@function_decls,
#        sourcefile      => $srcc,
#        hfile           => $inch,
#        code            => $source_code,
#    } );
#print STDERR $headerized_source;
#
#    chdir $cwd or croak "Unable to chdir back after testing";
#}

pass("Completed all tests in $0");

sub touchfile {
    my $filename = shift;
    open my $IN, '>', $filename or croak "Unable to open for writing";
    print $IN "\n";
    close $IN or croak "Unable to close after writing";
    return 1;
}

################### DOCUMENTATION ###################

=head1 NAME

01_functions.t - Test functions in Parrot::Headerizer::Functions.

=head1 SYNOPSIS

    % prove t/tools/dev/headerizer/01_functions.t

=head1 DESCRIPTION

The files in this directory test the publicly callable subroutines found in
F<lib/Parrot/Headerizer/Functions.pm>.  By doing so, they help test the functionality
of the F<tools/dev/headerizer.pl> utility.


=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

F<tools/dev/headerizer.pl>; F<lib/Parrot/Headerizer/Functions.pm>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
