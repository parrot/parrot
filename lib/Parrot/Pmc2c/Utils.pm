# Copyright (C) 2004-2006, The Perl Foundation.
# $Id: Parrot::Pmc2c::Utils.pm 15044 2006-10-29 00:00:11Z jonathan $
package Parrot::Pmc2c::Utils;
use strict;
use warnings;
use FindBin;
use Data::Dumper;
use Parrot::Vtable;
use Parrot::Pmc2c::Library;
use Parrot::Pmc2c qw(count_newlines);
use Cwd qw(cwd realpath);
use File::Basename;
use Carp;

=head1 NAME

Parrot::Pmc2c::Utils - Functions called within F<tools/build/pmc2c.pl>

=head1 SYNOPSIS

    use Parrot::Pmc2c::Utils;

=head1 DESCRIPTION

Parrot::Pmc2c::Utils holds subroutines called within F<tools/build/pmc2c.pl>.

=cut

=head1 FUNCTIONS

=head2 Publicly Available Methods

=head3 C<new()>

    $self = Parrot::Pmc2c::Utils->new( {
        include => \@include,
        opt     => \%opt,
        args    => \@args,
    } );

B<Purpose:>  Parrot::Pmc2c::Utils constructor.

B<Arguments:>  Reference to a hash holding 3 required keys:

=over 4

=item * C<include>

Array reference.  Array passed holds list of paths in which various methods
should try to locate files.

=item * C<opt>

Hash reference.  Holds results of processing of options to C<pmc2c.pl()>.

=item * C<args>

Array reference.  In most cases, the array passed will hold the elements of
C<@ARGV> remaining after options processing.

=back

B<Return Values:>  Parrot::Pmc2c::Utils object.  Will C<die> with error
message if arguments are defective.

=cut

sub new {
    my ($class, $allargsref) = @_;
    die "Must pass a hash ref to Parrot::Pmc2c::Utils::new"
        unless ref($allargsref) eq q{HASH};
    die "Must have key 'include' which is a reference to an array of directories"
        unless (defined $allargsref->{include} and ref($allargsref->{include}) eq q{ARRAY});
    die "Must have key 'opt' which is a reference to a hash of option values"
        unless (defined $allargsref->{opt} and ref($allargsref->{opt}) eq q{HASH});
    die "Must have key 'args' which is a reference to a list of the remaining arguments"
        unless (defined $allargsref->{args} and
                ref($allargsref->{args}) eq q{ARRAY}
        );
    unshift @{$allargsref->{include}}, (
        ".",
        "$FindBin::Bin/../..",
        "$FindBin::Bin/../../src/pmc/"
    );
    foreach my $opt qw(nobody nolines debug verbose) {
        if (! defined $allargsref->{opt}{$opt}) {
            $allargsref->{opt}{$opt} = 0;
        }
    }
    return bless( $allargsref, $class );
}


=head3 C<get_included_paths()>

    @included = $self->get_included_paths()

B<Purpose:>  Accessor to C<include> key inside Parrot::Pmc2c::Utils object.

B<Arguments:>  None.

B<Return Values:>  List referenced by the value of the C<include> key in
the hash passed by reference to C<Parrot::Pmc2c::Utils->new()>.

B<Comment:>  Used internally in C<find_file()>.

=cut

sub get_included_paths {
    my $self = shift;
    return @{$self->{include}};
}


=head3 C<find_file()>

    $path = $self->find_file($file, $die_unless_found_flag);

B<Purpose:>  Return the full path to C<$file>.  (Search in the directories
listed in the C<include> key in the hash passed by reference to the
constructor).  Optionally, die with an error message if that file cannot
be found.

B<Arguments:>  Two arguments.  Required:  string holding name of the file
sought.  Optional:  a flag variable which, if set to a true value, will cause
program to die if file is not located.

B<Return Values:>  Upon success, string holding a path.  Upon failure,
C<undef> (unless C<$die_unless_found_flag> is set to a true value, in which
case program C<die>s).

B<Comment:>  Called inside C<read_dump()> and C<dump_pmc()>.

=cut

sub find_file {
    my ($self, $file, $die_unless_found) = @_;

    if (File::Spec->file_name_is_absolute($file) && -e $file) {
        return $file;
    }

    my @includes = $self->get_included_paths();
    foreach my $dir ( @includes ) {
        my $path = File::Spec->catfile( $dir, $file );
        return $path if -e $path;
    }

    die "cannot find file '$file' in path '", join("', '", @includes), "'"
        if $die_unless_found;

    return;
}


=head3 C<dump_vtable()>

    $self->dump_vtable("$FindBin::Bin/../../vtable.tbl");

B<Purpose:>  Create a F<.dump> file for the default vtable (from which
all PMCs inherit).

B<Arguments:>  Scalar holding filename of vtable.

B<Return Values:>  Scalar holding path to F<.dump> file.

B<Comments:>  In earlier version of F<pmc2c.pl>, this subroutine returned
C<undef> upon success.  This was changed to more Perl-ish C<1>.

If the caller of this subroutine has C<chdir>-ed to a tempdir before this
subroutine is called -- as ought to be the case during testing of build
tools -- then F<vtable.dump> will be created within that tempdir.
Otherwise, F<vtable.dump> is created in the caller's working directory.
When the caller is F<make>, that directory is the top-level Parrot directory.

=cut

sub dump_vtable {
    my ($self, $file) = @_;
    my $default = parse_vtable($file);
    my $dump    = $file;
    $dump =~ s/\.\w+$/\.dump/;
    $dump = cwd() . q{/} . basename($dump);

    my $vtd = open_file( ">", $dump, $self->{opt}{verbose} );

    my %vtable = (
        flags   => {},
        pre     => '',
        post    => '',
    );
    my %meth_hash;
    my $i = 0;
    foreach my $entry (@$default) {
        $meth_hash{$entry->[1]} = $i++;
        push @{$vtable{methods}},
            {
                parameters  => $entry->[2],
                meth        => $entry->[1],
                type        => $entry->[0],
                section     => $entry->[3],
                mmd         => $entry->[4],
                attr        => $entry->[5]
            };
    }
    $vtable{'has_method'} = \%meth_hash;

    my $Dumper = Data::Dumper->new([\%vtable], ['class']);
    $Dumper->Indent(3);
    print $vtd $Dumper->Dump();
    close $vtd;

    return $dump;
}


=head3 C<print_tree()>

    $self->print_tree( {
        depth   => 0,
        files   => [ @files_to_be_printed ],    # optional
    } );

B<Purpose:>  Print the inheritance tree for each of the files, using the
given directories to search for all of correct PMCs.

B<Arguments:>  Reference to hash holding key-value pairs.

=over 4

=item * depth

Number holding the display depth.  Used for the recursive
definition of this function.  Defaults to C<0> if not specified.

=item * files

Optional.  Reference to an array holding a list of files.  If not supplied, the
value of the C<args> key in C<Parrot::Pmc2c::Utils::new()> will be used.
(This is used for the recursive call.)

=back

B<Return Values:>  C<1> upon successful printing.

B<Comment:>  In earlier version of F<pmc2c.pl>, this subroutine returned
C<undef> upon success.  This was changed to more Perl-ish C<1>.

The purpose of this method is unclear.  (1) It is not called by Makefile.  (2)
Since internally calls read_dump(), a F<.dump> file must already exist for
this method to generate meaningful output.  But since F<.dump> files do B<not>
exist prior to calling F<make>, this can only be viewed as an attempt at a
utility method to be called B<after> F<make> has run.  That might be useful.
It would be responding to a request such as, "Given these F<.dump> files,
reconstruct the inheritance trees of their ancestral F<.pmc> files."  But
that's a very different purpose from the other methods in this program, whose
point is to go from F<.pmc> to F<.c> files.

=cut

sub print_tree {
    my ($self, $argsref) = @_;
    my $depth = $argsref->{depth} || 0;
    my @files;
    # First, look for list of files provided as argument to 'files' key in
    # hash passed by ref to this method call.
    if (defined $argsref->{files}) {
        die "Value of 'files' key in call to print_tree() must be array ref"
            unless ref($argsref->{files}) eq 'ARRAY';
        die "Array ref which is value of 'files' key in call to print_tree() must hold positive number of files"
            unless scalar(@{$argsref->{files}});
        @files = @{$argsref->{files}};
    # Next, look for list of files provided as argument to 'args' key of
    # constructor.
    } else {
        if (@{$self->{args}}) {
            @files = @{$self->{args}};
        } else {
            die "print_tree() lacked files to print; nothing in constructor's 'args' key";
        }
    }

    for my $f (@files) {
        my $class = $self->read_dump($f);
        print "    " x $depth, $class->{class}, "\n";
        for my $k (keys %{$class->{flags}{extends}}) {
            $self->print_tree( {
                depth   => $depth + 1,
                files   => [ lc("$k.pmc") ],
            } );
        }
    }
    return 1;
}


=head3 C<read_dump()>

  $self->read_dump('filename');

B<Purpose:>  A F<.dump> file is the result of a call to C<dump_pmc()> and
consists of a print-out of a hash reference Data::Dumper-style.
C<read_dump()> reads in the F<.dump> file, recreates the data structure and
returns a new hash reference holding the data structure.

B<Arguments:>  Scalar holding name of file whose structure is to be dumped.
The method will only process F<foo.dump> files, but you can also pass
C<'foo.c'> or C<'foo.pmc'> as the argument and it will analyze the
corresponding F<foo.dump> file.

B<Return Values:>  Reference to hash holding recreated data structure.

B<Comment:>  If the appropriate F<.dump> file cannot be located, program
will die with error message (see C<find_file()> above).
Called internally by C<print_tree()>, C<gen_c()>, C<gen_parent_list()>,
C<dump_pmc()>.

=cut

sub read_dump {
    my ($self, $file) = @_;

    $file =~ s/\.\w+$/.dump/;
    $file = $self->find_file($file, 1);

    my $fh = open_file( "<", $file, $self->{opt}{verbose});

    my $class;
    eval do { local $/; <$fh> };
    die $@ if $@;

    close $fh;
    return $class;
}


=head3 C<gen_c()>

    $return_value = $self->gen_c();

B<Purpose:>  Generate the C source code file for each of the files passed in,
using the directories passed in to search for the PMC dump files.

B<Arguments:>  None.

B<Return Values:>  Returns C<1> upon success.

B<Comment:>  Internally calls C<Parrot::Pmc2c::Library::new()> and
C<write_all_files()>.  In earlier version of F<pmc2c.pl>, this
subroutine returned C<undef> upon success.  This was changed to more
Perl-ish C<1>.

=cut

sub gen_c {
    my $self    = shift;
    my @files   = @{$self->{args}};
    my $optsref = $self->{opt};
    my %pmcs    = map { $_, $self->read_dump($_) } @files;

    Parrot::Pmc2c::Library
        ->new( $optsref, $self->read_dump("vtable.pmc"), %pmcs )
        ->write_all_files;

    return 1;
}


=head3 C<dump_pmc()>

    $return_value = $self->dump_pmc();

B<Purpose:>  Create a F<.dump> file for each file listed in the constructor's
C<arg> key (which can be found in the directories listed in the C<include> key).

A C<'*.pmc'> glob may also be passed to emulate a proper shell in the presence
of a dumb one.

    $self = Parrot::Pmc2c::Utils->new( {
        include => \@include,
        opt     => \%opt,
        args    => [ ( q{*.pmc} ) ],
    } );
    $self->dump_pmc();

B<Arguments:>  None.

B<Return Values:>  Returns 1 upon success.

B<Comments:>  Called when C<--dump> is specified as the command-line option to
F<pmc2c.pl>.

=cut

sub dump_pmc {
    my $self = shift;
    my $include = $self->{include};
    my @files = @{$self->{args}};
    my $opt = $self->{opt};

    # help these dumb 'shells' that are no shells
    if ($files[0] eq 'src/pmc/*.pmc') {
        @files = glob $files[0];
    }
    # make sure that a default.dump will always be created if it doesn't
    # already exist; do so by adding default.pmc to list of files for dumping
    unless (-e qq{./src/pmc/default.dump}) {
        unshift @files, qq{./src/pmc/default.pmc};
    }

    my $all;
    for my $file (@files) {
        my ($class, $result) = $self->find_and_parse_pmc($file);
        $result->{file} = $file;
        $all->{$class} = $result;
    }

    $all->{default} = $self->read_dump("default.pmc")
        if not $all->{default};

    my $vt = $self->read_dump("vtable.pmc");

    foreach my $e ( @{ $vt->{methods} } ) {
        my $meth = $e->{meth};
        $all->{default}->{super}{$meth} = 'default';
    }

    DO_A_DUMP: foreach my $name (keys %{$all}) {
        my $file = $all->{$name}->{file};
        my $dumpfile = $file;
        $dumpfile =~ s/\.\w+$/.dump/;

        my $existing = $self->find_file($dumpfile);

        # Am confused about what's intended here.  If the .dump file is OLDER
        # than the corresponding .pmc file (e.g., if it's some .dump file from
        # an earlier run of 'make'), shouldn't it be overwritten so that we
        # have an up-to-date .dump file?
        if (defined $existing && dump_is_newer($existing)) {
            if ($dumpfile =~ /default\.dump$/) {
                # don't overwrite default.dump
                # skip all preparations for dumping
                next DO_A_DUMP;
            }
            else {
                # overwrite anything else
                # continue with preparations for dumping
        # And what good is assigning the name of the existing dump file to
        # that of the newly-to-be-created dumpfile.  Wouldn't they have the
        # same name in any case?  (Or are we dealing with the possibility that
        # find_file() will return a file of the same basename but in a
        # different directory?  Is that a real possibility?)
                $dumpfile = $existing;
            }
        }

        $all = $self->gen_parent_list($name, $all);

        my $class = gen_super_meths($name, $all, $vt);
        my $Dumper = Data::Dumper->new([$class], ['class']);
        $Dumper->Indent(1);
        my $fh = open_file( ">", $dumpfile );
        print $fh $Dumper->Dump;
        close $fh;
    } # end foreach loop
    return 1;
}


=head2 Non-Public Methods

These functions are expressed as methods called on the Parrot::Pmc2c::Utils
object, but only because they make use of data stored in that object.  They
are called within the publicly available methods described above and are not
intended to be publicly callable.

=head3 C<find_and_parse_pmc()>

    ($class, $result) = $self->find_and_parse_pmc($file);

B<Purpose:>  Returns the class structure from C<$file> for a F<.dump> file.

B<Arguments:>  String holding a file name.  The file is one of those provided
by the C<arg> key of the constructor.

B<Return Values:>  C<find_and_parse_pmc()> internally calls C<parse_pmc> and directly
returns the latter's list of two return values:  a string holding a classname
and a reference to a hash holding the class's attributes.

B<Comments:>  Called internally by C<dump_pmc()>.  Formerly called
C<dump_1_pmc()>; name was changed because this function doesn't actually do
any 'dumping' in the sense of using Data::Dumper to print the contents of a
variable.  Rather, it is a step called by C<dump_pmc()> to prepare for dumping.

=cut

sub find_and_parse_pmc {
    my ($self, $file) = @_;
    my $opt = $self->{opt};
    $file =~ s/\.\w+$/.pmc/;
    $file = $self->find_file($file, 1);

    my $fh = open_file( "<", $file );
    my $contents = do { local $/; <$fh> };
    close $fh;
    my ($classname, $attributesref)  = parse_pmc($contents, $opt);
    return ($classname, $attributesref);
}


=head3 C<gen_parent_list()>

    $self->gen_parent_list($name, \%all);

B<Purpose:>  Generate an ordered list of parent classes to put in the
C<$classes->{class}->{parents}> array, using the given directories
to find parents.

B<Arguments:>  List of two arguments:

=over 4

=item *

String holding class name.

=item *

Hash reference holding data structure being built up within C<dump_pmc()>.

=back

B<Return Value:>  Reference to hash holding the data structure being built up
within C<dump_pmc()>, suitably modified.

B<Comments:>  Called within C<dump_pmc()>.

=cut

sub gen_parent_list {
    my ($self, $name, $all) = @_;
    my $class = $all->{$name};

    # An interesting construction:  note below that in the course of processing
    # @todo, new elements can be pushed on to it.  So it's not necessarily
    # exhausted when $n is shifted off it.
    my @todo  = ($name);
    while (@todo) {
        my $n   = shift @todo;
        my $sub = $all->{$n};
        next if $n eq 'default';

        my %parent_hash = %{$sub->{flags}{extends}};
        my @parents =
            sort { $parent_hash{$a} <=> $parent_hash{$b} } keys %parent_hash;
        for my $parent (@parents) {
            $all->{$parent} = $self->read_dump(lc("$parent.pmc"))
                if not $all->{$parent};

            $class->{has_parent}{$parent} = { %{$all->{$parent}{has_method} }};
            push @todo, $parent;
            push @{ $class->{parents} }, $parent;
        }
    }
    return $all;
}


=head2 Subroutines

These are auxiliary subroutines called inside the methods described above.

=head3 C<open_file()>

    $fh = open_file( "<", $file, $verbose);

B<Purpose:>  Utility subroutine.

B<Arguments:>  List of scalars:  two required, one optional.

=over 4

=item * action

String holding action/direction desired:   C<E<lt>> for
reading or C<E<gt>E<gt>> for writing or appending.

=item * filename

String holding name of file to be opened.

=item * verbose

Optional.  True value if verbose output is desired.  That output will be the
action followed by the filename.
In most cases, the third argument will be C<$self->{opt}{verbose}>.

=back

B<Return Values:>  Filehandle to file so opened.

B<Comment:>  Called within C<dump_vtable()>, C<read_dump()>, C<find_and_parse_pmc()>,
and C<dump_pmc()>.

=cut

sub open_file {
    my ($direction, $filename, $verbose) = @_;

    my $action =
        ($direction eq "<")  ? "Reading"    :
        ($direction eq ">>") ? "Appending"  :
                               "Writing";

    print "$action $filename\n" if $verbose;
    open my $fh, $direction, $filename or die "$action $filename: $!\n";
    return $fh;
}


=head3 C<parse_pmc()>

    ($classname, $attributesref)  = parse_pmc($contents, $opt);

B<Purpose:>  Parse PMC code and return the class name and a hash ref of
attributes.

B<Arguments:>  List of two arguments:

=over 4

=item *

Code reference holding results of parsing PMC code found in file provided
as argument to C<find_and_parse_pmc()>.

=item *

The hash reference which is the value of the C<opt> key provided to constructor.

=back

B<Return Values:>  List of two elements:

=over 4

=item *

String holding a classname.

=item *

Reference to a hash of the class's attributes.  Keys:

    pre
    flags
    methods
    post
    class
    has_method

=back

B<Comments:>  Called internally by C<find_and_parse_pmc()>.

=cut

sub parse_pmc {
    my ($code, $opt) = @_;

    my ($pre, $classname, $flags_ref) = parse_flags(\$code);
    my ($classblock, $post) = extract_balanced($code);

    my $lineno  = 1 + count_newlines($pre);
    $classblock = substr($classblock, 1,-1); # trim out the { }

    my (@methods, %meth_hash, $class_init);
    my $signature_re = qr{
    ^
    (?:                 #blank spaces and comments and spurious semicolons
      [;\n\s]*
      (?:/\*.*?\*/)?    # C-like comments
    )*

    (P?METHOD\s+)?        #method flag

    (\w+\**)            #type
      \s+
        (\w+)           #method name
      \s*
        \( ([^\(]*) \)  #parameters
    \s*
    ((?::(\w+)\s*)*)    #method attrs
    }sx;


    while ($classblock =~ s/($signature_re)//) {
        $lineno += count_newlines($1);
        my ($flag, $type, $methodname, $parameters) = ($2,$3,$4,$5);
        my $attrs = parse_method_attrs($6);
        my ($methodblock, $remainder_part) = extract_balanced($classblock);
        $methodblock = "" if $opt->{nobody};

        my $method_hash = {
                    meth        => $methodname,
                    body        => $methodblock,
                    line        => $lineno,
                    type        => $type,
                    parameters  => $parameters,
                    loc         => "vtable",
                    attrs       => $attrs,
                  };

        if ($flag and $flag =~ /PMETHOD/) {
            rewrite_pmethod($method_hash);
        }


        if ($methodname eq 'class_init') {
            $class_init = $method_hash;
        }
        else {
            # name => method idx mapping
            $meth_hash{$methodname} = scalar @methods;

            $method_hash->{loc}  = "nci" if $flag;
            $method_hash->{mmds} = [ ($methodblock =~ /MMD_(\w+):/g) ];
            push @methods, $method_hash;
        }

        $classblock = $remainder_part;
        $lineno += count_newlines($methodblock);
    }

    if ($class_init) {
        $meth_hash{'class_init'} = scalar @methods;
        push @methods, $class_init;
    }
    return $classname, {
        pre          => $pre,
        flags        => $flags_ref,
        methods      => \@methods,
        post         => $post,
        class        => $classname,
        has_method   => \%meth_hash,
    };
}

# Declare the subroutines
sub trim($);
sub ltrim($);
sub rtrim($);

# Perl trim function to remove whitespace from the start and end of the string
sub trim($)
{
  my $string = shift;
  $string =~ s/^\s+//;
  $string =~ s/\s+$//;
  return $string;
}
# Left trim function to remove leading whitespace
sub ltrim($)
{
  my $string = shift;
  $string =~ s/^\s+//;
  return $string;
}
# Right trim function to remove trailing whitespace
sub rtrim($)
{
  my $string = shift;
  $string =~ s/\s+$//;
  return $string;
}

use constant REGNO_INT => 0;
use constant REGNO_NUM => 1;
use constant REGNO_STR => 2;
use constant REGNO_PMC => 3;

  #/* 4 low bits are argument types */
use constant  PARROT_ARG_INTVAL           => 0x000;
use constant  PARROT_ARG_STRING           => 0x001;
use constant  PARROT_ARG_PMC              => 0x002;
use constant  PARROT_ARG_FLOATVAL         => 0x003;
use constant  PARROT_ARG_TYPE_MASK        => 0x00f;
  #/* argument meaning and conversion bits */
use constant  PARROT_ARG_CONSTANT         => 0x010;
  #/* bits a user has to define */
use constant  PARROT_ARG_FLATTEN          => 0x020; #      /* .flatten_arg */
use constant  PARROT_ARG_SLURPY_ARRAY     => PARROT_ARG_FLATTEN; # /* i.e. foldup  */
  #/* unused - 0x040 */

use constant  PARROT_ARG_OPTIONAL         => 0x080;
use constant  PARROT_ARG_OPT_FLAG         => 0x100; #/* prev optional was set */
use constant  PARROT_ARG_NAME             => 0x200; #/* this String is an arg name */

our $arg_type_flags = {
+(REGNO_INT) => PARROT_ARG_INTVAL,
+(REGNO_NUM) => PARROT_ARG_FLOATVAL,
+(REGNO_STR) => PARROT_ARG_STRING,
+(REGNO_PMC) => PARROT_ARG_PMC
};

sub parse_arg_attrs {
  my $flags = shift;
  my %result;
  if ( defined $flags ) {
    ++$result{$1} while $flags =~ /:(\S+)/g;
  }
  return \%result;
}

sub get_arg_type {
    ($_) = @_;
    if (/INTVAL|int/i) {
      return REGNO_INT;
      return "INTVAL";
    }
    elsif (/FLOATVAL|double/i) {
      return REGNO_NUM;
      return "FLOATVAL";
    }
    elsif (/STRING/i) {
      return REGNO_STR;
      return "STRING";
    }
    elsif (/PMC/i) {
      return REGNO_PMC;
      return "PMC";
    }
    croak "$_ not recognized as INTVAL, FLOATVAL, STRING, or PMC";
}


sub gen_arg_flags {
  my ($param) = @_;
  my $flag = $arg_type_flags->{$param->{type}};
  my $is_constant = 0;
  my $is_optional = 0;
  $is_constant = PARROT_ARG_CONSTANT if exists $param->{attrs}->{constant};
  $is_optional = PARROT_ARG_OPTIONAL if exists $param->{attrs}->{optional};
  $flag |= $is_constant | $is_optional;
  $flag |= PARROT_ARG_FLATTEN if exists $param->{attrs}->{flatten};
  $flag |= PARROT_ARG_SLURPY_ARRAY if exists $param->{attrs}->{slurpy};
  $flag |= PARROT_ARG_NAME if exists $param->{attrs}->{name};

  if (exists $param->{attrs}->{opt_flag}) {
    return PARROT_ARG_INTVAL | PARROT_ARG_OPT_FLAG;
  }

  return $flag;
}

sub gen_arg_accessor {
  my ($name, $type_number, $index, $arg_type) = @_;
  my $type;
  if ($type_number == REGNO_INT) {
    $type = { s => "INTVAL", l => "INT" };
  }
  elsif ($type_number == REGNO_NUM) {
    $type = { s => "FLOATVAL", l => "NUM" };
  }
  elsif ($type_number == REGNO_STR) {
    $type = { s => "STRING*", l => "STR" };
  }
  elsif ($type_number == REGNO_PMC) {
    $type = { s => "PMC*", l => "PMC" };
  }
  else {
    croak "$_ not recognized as INTVAL, FLOATVAL, STRING, or PMC";
  }

  if ($arg_type eq 'param') {
    return "    $type->{s} $name = CTX_REG_$type->{l}(ctx, $index);\n";
  }
  elsif ($arg_type eq 'name') {
    return "    CTX_REG_$type->{l}(ctx, $index) = string_from_cstring(interp, $name, 0);\n";
  }
  else { #$arg_type eq 'result'
    return "    CTX_REG_$type->{l}(ctx, $index) = $name;\n";
  }
}

=head3 C<rewrite_pmethod($class, $method, $body)>

Rewrites the method body performing the various macro substitutions for
pmethod bodies (see F<tools/build/pmc2c.pl>).

=cut

sub rewrite_pmethod_returns {
  my ( $method, $body) = @_;
  my $signature_re = qr{
  (preturn         #method name
  \s*              #optional whitespace
  \( ([^\(]*) \)   #parameters
  ;?)
  }sx;

  my $regs_used = [];
  if($_ and m/\breturn\b/) {
    croak "return not allowed in pmethods, use preturn instead";
  }

  while ($$body and $$body =~ m/$signature_re/) {
    my $goto_string = "goto $method"."_returns;";
    my ($returns_n_regs_used, $returns_indexes, $returns_flags, $returns_accessors)
        = parse_pmethod_args_normal($2, 'result');
    push @$regs_used, $returns_n_regs_used;
    my $file = '"' . __FILE__ . '"';
    my $lineno = __LINE__ + 6;
    my $replacement = <<END;

    /*BEGIN PRETURN $2 */
$returns_accessors
#line $lineno $file
    {
        int temp_return_indexes[] = { $returns_indexes };
        return_indexes = (opcode_t *) temp_return_indexes;
    }
    return_sig = Parrot_FixedIntegerArray_new_from_string(interp, type,
        string_from_cstring(interp, $returns_flags, 0), PObj_constant_FLAG);
    $goto_string
    /*END PRETURN $2 */
END
    $$body =~ s/\Q$1\E/$replacement/;
  }

  return $regs_used;
}

sub parse_pmethod_args_normal {
  my $linear_args = parse_pmethod_args($_[0]);
  process_pmethod_args( $linear_args, $_[1] );
}

sub parse_pmethod_args_add_obj {
  my $linear_args = parse_pmethod_args($_[0]);
  my $arg = {
    type => get_arg_type('PMC'),
    name => 'self',
    attrs => parse_arg_attrs(':object')
  };
  unshift @$linear_args, $arg;
  process_pmethod_args( $linear_args, $_[1] );
}

sub parse_pmethod_args {
  my ($parameters) = @_;
  my $linear_args = [];
  for my $x (split /,/, $parameters) {
    my ($type, $name, $rest) = split / /, trim($x), 3;
    $name =~ /[\**]?(\"?[\w_]+\"?)/;
    my $arg = {
      type => get_arg_type($type),
      name => $1,
      attrs => parse_arg_attrs($rest)
    };
    push @$linear_args, $arg;
  }
  $linear_args;
}

sub is_named {
  my ($arg) = @_;
  while (my ($k, $v) = each(%{ $arg->{attrs} })) {
    if ($k =~ /named\[(.*)\]/)
    {
      return (1, $1);
    }
  }
  return (0, '');
}

sub process_pmethod_args {
  my ($linear_args, $arg_type) = @_;
  my $n_regs_used_a = [ 0, 0, 0, 0 ];
  my $args = [ [], [], [], [] ];
  my $args_indexes_a = [];
  my $args_flags_a = [];
  my $args_accessors = "";
  my $named_names = "";

  for my $arg (@$linear_args)
  {
    my ($named, $named_name) = is_named($arg);
    if($named)
    {
      my $argn = {
        type => +(REGNO_STR),
        name => $named_name,
      };
      $arg->{named_arg} = $argn;
      $arg->{named_name} = $named_name;

      push @{ $args->[+(REGNO_STR)] }, $argn;
      $argn->{index} = $n_regs_used_a->[+(REGNO_STR)]++;
      push @$args_indexes_a, $argn->{index};
      push @$args_flags_a, PARROT_ARG_STRING | PARROT_ARG_NAME;
      $named_names .= gen_arg_accessor($argn->{name}, $argn->{type}, $argn->{index}, 'name');
    }

    push @{ $args->[$arg->{type}] }, $arg;
    $arg->{index} = $n_regs_used_a->[$arg->{type}]++;
    push @$args_indexes_a, $arg->{index};
    push @$args_flags_a, gen_arg_flags($arg);
    $args_accessors .= gen_arg_accessor($arg->{name}, $arg->{type}, $arg->{index}, $arg_type);
  }

  my $n_regs_used = join(", ", @$n_regs_used_a);
  my $args_indexes = join(", ", @$args_indexes_a);
  my $args_flags = '"(' . join(", ", @$args_flags_a) . ')"';
  return ($n_regs_used_a, $args_indexes, $args_flags, $args_accessors, $named_names);
}

sub find_max_regs {
  my ($n_regs) = @_;
  my $n_regs_used_a = [ 0, 0, 0, 0 ];
  for my $x ( @$n_regs ) {
    for my $i (0..3) {
      $n_regs_used_a->[$i] = $n_regs_used_a->[$i] > $x->[$i] ? $n_regs_used_a->[$i] : $x->[$i];
    }
  }
  return join(", ", @$n_regs_used_a);
}

=head3 C<rewrite_pmethod()>

    rewrite_pmethod($method_hash);

=cut


sub rewrite_pmethod {
    #"include pmc_fixedintegerarray.h";
    my ($self) = @_;
    croak "return method of PMETHOD must be void, not $self->{type}" if $self->{type} ne 'void';
    my $parameters = $self->{parameters};
    my ($params_n_regs_used, $params_indexes, $params_flags, $params_accessors, $named_names)
        = parse_pmethod_args_add_obj($parameters, 'param');
    my $n_regs = rewrite_pmethod_returns($self->{meth}, \$self->{body});
    unshift @$n_regs, $params_n_regs_used;
    my $n_regs_used = find_max_regs($n_regs);

    my $file = '"' . __FILE__ . '"';
    my $lineno = __LINE__ + 4;
    my $PRE_STUB = <<END;
{
#line $lineno $file
    INTVAL n_regs_used[] = { $n_regs_used };
    opcode_t param_indexes[] = { $params_indexes };
    opcode_t *return_indexes;
    opcode_t *current_args;
    PMC* type = pmc_new(interp, enum_class_FixedIntegerArray);
    PMC* param_sig = Parrot_FixedIntegerArray_new_from_string(interp, type,
        string_from_cstring(interp, $params_flags, 0), PObj_constant_FLAG);
    PMC* return_sig = PMCNULL;
    parrot_context_t *caller_ctx = CONTEXT(interp->ctx);
    parrot_context_t *ctx = Parrot_push_context(interp, n_regs_used);
    PMC *ccont = caller_ctx->current_cont;
    opcode_t *pc;
    struct call_state st;

    current_args = interp->current_args;
    interp->current_args = NULL;

$named_names

    Parrot_init_arg_op(interp, caller_ctx, current_args, &st.src);
    Parrot_init_arg_indexes_and_sig_pmc(interp, ctx, param_indexes, param_sig, &st.dest);
    Parrot_process_args(interp, &st, PARROT_PASS_PARAMS);

    if (PObj_get_FLAGS(ccont) & SUB_FLAG_TAILCALL) {
        PObj_get_FLAGS(ccont) &= ~SUB_FLAG_TAILCALL;
        --ctx->recursion_depth;
        ctx->caller_ctx = caller_ctx->caller_ctx;
        Parrot_free_context(interp, caller_ctx, 0);
        interp->current_args = NULL;
    }
    /* BEGIN PARMS SCOPE */
    {
$params_accessors

    /* BEGIN PMEHTOD BODY */
END

    my $method_returns = $self->{meth} . "_returns:";
    $lineno = __LINE__ + 4;
    my $POST_STUB = <<END;

#line $lineno $file
    goto no_return;
    /* END PMEHTOD BODY */
    $method_returns

    //if (PMC_cont(ccont)->address) {
    {
        //parrot_context_t * const caller_ctx = PMC_cont(ccont)->to_ctx;
        if (! caller_ctx) {
            /* there is no point calling real_exception here, because
               PDB_backtrace can't deal with a missing to_ctx either. */
            internal_exception(1, "No caller_ctx for continuation \%p.", ccont);
        }

        Parrot_init_arg_indexes_and_sig_pmc(interp, ctx, return_indexes, return_sig, &st.src);
        Parrot_init_arg_op(interp, caller_ctx, caller_ctx->current_results, &st.dest);
        Parrot_process_args(interp, &st, PARROT_PASS_RESULTS);
    }


    /* END PARAMS SCOPE */
    }
    no_return:
    PObj_live_CLEAR(type);
    PObj_live_CLEAR(param_sig);
    PObj_live_CLEAR(return_sig);
    Parrot_pop_context(interp);
END
    ($self->{parameters}, $self->{pre_block}, $self->{post_block}) = ("", $PRE_STUB, $POST_STUB);
    return;
}

=head3 C<parse_flags()>

    ($pre, $classname, $flags_ref)   = parse_flags(\$code);

B<Purpose:>  Extract a class signature from the code ref.

B<Argument:>  De-reference the code ref which was the first argument
provided to C<parse_pmc()>.

B<Return Values:>  List of three elements:

=over 4

=item *

the code found before the class signature;

=item *

the name of the class; and

=item *

a hash ref containing the flags associated with the class (such as
C<extends> and C<does>).

=back

B<Comments:>  Called internally by C<parse_pmc()>.

=cut

sub parse_flags {
    my $c = shift;

    $$c =~ s/^(.*?^\s*)pmclass ([\w]*)//ms;
    my ($pre, $classname) = ($1, $2);

    # flags that have values passed with them
    my %has_value = map { $_ => 1 } qw(does extends group lib hll maps);

    my (%flags, $parent_nr);
    # look through the pmc declaration header for flags such as noinit
    while ($$c =~ s/^\s*(\w+)//s) {
        my $flag = $1;
        if ($has_value{$flag}) {
            $$c =~ s/^\s+(\w+)//s
                or die "Parser error: no value for '$flag'";

            $flags{$flag}{$1} =
                $flag eq 'extends' ? ++$parent_nr : 1;
        }
        else {
            $flags{$flag} = 1;
        }
    }

    # setup some defaults
    if ($classname ne 'default') {
        $flags{extends}{default} = 1 unless $flags{extends};
        $flags{does}{scalar}     = 1 unless $flags{does};
    }

    return $pre, $classname, \%flags;
}


=head3 C<extract_balanced()>

    ($classblock, $post) = extract_balanced($code);

B<Purpose:>  Remove a balanced C<{}> construct from the beginning of C<$code>.
Return it and the remaining code.

B<Argument:>  The code ref which was the first argument provided to
C<parse_pmc()>.

B<Return Values:>  List of two elements:

=over 4

=item *

String beginning with C<{> and ending with C<}>.  In between is found C code
where the comments hold strings of Perl comments written in POD.

=item *

String holding the balance of the code.  Same style as first element, but
without the braces.

=back

B<Comments:>  Called twice within C<parse_pmc()>.  Will die with error message
C<Badly balanced> if not balanced.

=cut

sub extract_balanced {
    my $code    = shift;
    my $balance = 0;

    $code =~ s/^\s+//;

    # create a copy and remove strings and comments so that
    # unbalanced {} can be used in them in PMCs, being careful to
    # preserve string length.
    local $_ = $code;
    s[
        ( ' (?: \\. | [^'] )* '     # remove ' strings
        | " (?: \\. | [^"] )* "     # remove " strings
        | /\* .*? \*/ )             # remove C comments
    ]
    [ "-" x length $1 ]sexg;

    /^\{/ or die "bad block open: ", substr($code,0,10), "...";

    while (/ (\{) | (\}) /gx) {
        if($1) {
            $balance++;
        } else { # $2
            $balance--;
            return substr($code, 0, pos, ""), $code
                if not $balance;
        }
    }
    die "Badly balanced" if $balance;
    return;
}


=head3 C<parse_method_attrs()>

    $attrs = parse_method_attrs($method_attributes);

B<Purpose:>  Parse a list of method attributes and return a hash ref of them.

B<Arguments:>  String captured from regular expression.

B<Return Values:>  Reference to hash of attribute values.

B<Comments:>  Called within C<parse_pmc()>.

=cut

sub parse_method_attrs {
    my $flags = shift;
    my %result;
    ++$result{$1} while $flags =~ /:(\w+)/g;
    return \%result;
}


=head3 C<dump_is_newer()>

    dump_is_newer($existing);

B<Purpose:>  Determines whether the dump of a file is newer than the PMC file.
(If it's not, then the PMC file has changed and the dump has not been updated.)

B<Arguments:>  String holding filename.

B<Return Values:>  Returns true if timestamp of existing is more recent than
that of PMC.

B<Comments:>  Called within C<find_and_parse_pmc()>.

=cut

sub dump_is_newer {
    my $dumpfile = shift;
    # Extract name of .pmc file corresponding to .dump file
    my $pmc = $dumpfile;
    $pmc =~ s/\.\w+$/.pmc/;

    my $pmc_dt  = 0;
    my $dump_dt = 0;
    $pmc_dt  = (stat $pmc)[9];
    $dump_dt = (stat $dumpfile)[9];
    return $dump_dt > $pmc_dt;
}


=head3 C<gen_super_meths()>

    $class = gen_super_meths($name, $all, $vt);

B<Purpose:>  Generate a list of inherited methods for C<$name> by searching the
inheritance tree. The method list is found in C<$vt>.

B<Arguments:>  List of three elements:

=over 4

=item *

String holding name of class being dumped.

=item *

Reference to the hash holding the data structure being built up within
C<dump_pmc()>.

=item *

The result of a call of C<read_dump()> on F<vtable.pmc>.

=back

B<Return Value:>  Hash reference representing the class being dumped.

B<Comments:>  Called within C<dump_pmc()>.

=cut

sub gen_super_meths {
    my ($name, $all, $vt) = @_;
    my $class = $all->{$name};

    # look through all meths in class and locate the nearest parent
    foreach my $entry (@{ $vt->{methods} } ) {
        my $meth = $entry->{meth};
        next if exists $class->{super}{$meth};
        foreach my $pname (@{ $class->{parents} } ) {
            if (exists ($class->{has_parent}{$pname}{$meth} )) {
                $class->{super}{$meth} = $pname;
                my $n = $class->{has_parent}{$pname}{$meth};
                $class->{super_attrs}{$meth} =
                    $all->{$pname}{methods}[$n]{attrs};
                if (exists $class->{has_method}{$meth}) {
                    $class = inherit_attrs($class, $meth);
                }
                my $super_mmd = $all->{$pname}{methods}[$n]{mmds};
                if ($super_mmd && scalar @{ $super_mmd }) {
                    push @{ $class->{super_mmd} }, {
                        $pname => $super_mmd,
                        'meth' => $meth,
                    };
                }
                last;
            }
        }
        unless (exists $class->{super}{$meth}) {
            # XXX this is a quick hack to get the inheritance
            # ParrotClass isa delegate
            #
            # delegate has everything autogenerated, so these
            # methods aren't seen and not inherited properly
            #
            # the correct way would be to look at
            # $class->implements but when dumping there isn't
            # a $class object
            $class->{super}{$meth} =
                $class->{class} eq 'ParrotObject' ||
                $class->{class} eq 'ParrotClass' ?
                'delegate' :
                'default';
        }
    }
    return $class;
}


=head3 C<inherit_attrs()>

    $class = inherit_attrs($class, $meth);

B<Purpose:>  Modify $attrs to inherit attrs from $super_attrs as appropriate.

B<Arguments:>  List of two arguments:

=over 4

=item *

Reference to hash holding the data structure being built up within
C<dump_pmc()>.

=item *

Method name.

=back

B<Return Values:>  Reference to hash holding the data structure being built up
within C<dump_pmc()>.

B<Comments:> Called within C<gen_super_meths()>.

=cut

sub inherit_attrs {
    my ($class, $meth) = @_;
    my $super_attrs = $class->{methods}[$class->{has_method}{$meth}]->{attrs};
    my $attrs       = $class->{super_attrs}{$meth};
    if (
        ($super_attrs->{read} or $super_attrs->{write})
        and
        not ($attrs->{read} or $attrs->{write})
    ) {
        $attrs->{read} = $super_attrs->{read}
            if exists $super_attrs->{read};
        $attrs->{write} = $super_attrs->{write}
            if exists $super_attrs->{write};
    }
    return $class;
}


=head1 AUTHOR

Leopold Toetsch wrote F<pmc2c.pl>.  It was cleaned up by Matt Diephouse.
James E Keenan extracted the subroutines into F<lib/Parrot/Pmc2c/Utils.pm> and
wrote the accompanying test suite.

=head1 SEE ALSO

F<tools/build/pmc2c.pl>, Parrot::Pmc2c, Parrot::Pmc2c::Library.

=cut

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
