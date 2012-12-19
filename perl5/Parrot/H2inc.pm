package Parrot::H2inc;
# Copyright (C) 2010, Parrot Foundation.

use strict;
use warnings;
use Exporter;
our @ISA = qw( Exporter );
our @EXPORT_OK = qw(
    parse_file
    perform_directive
    generate_text
    print_generated_file
);

=head1 NAME

Parrot::H2inc - Subroutines used in F<tools/build/h2inc.pl>

=head1 DESCRIPTION

This package exports on demand only four subroutines used in
F<tools/build/h2inc.pl>.

=head1 SUBROUTINES

=head2 C<parse_file()>

=over 4

=item * Arguments

    $directive = parse_file($in_file, $out_file);

List of 2 elements: string holding name of incoming file; string holding name of outgoing file.

=item * Return Value

If successful, returns a hash reference.

=back

=cut

sub parse_file {
    my ( $in_file, $out_file) = @_;
    $out_file =~ s{\\}{/}g; # transform Windows backslash

    my ( %values, $last_val, $cur, $or_continues );
    open my $fh, '<', $in_file or die "Can't open $in_file: $!\n";
    while ( my $line = <$fh> ) {
        if (
            $line =~ m{
            &gen_from_(enum|def) \( ( [^)]* ) \)
            (?: \s+ prefix \( (\w+) \) )?
            (?: \s+ subst \( (s/.*?/.*?/[eig]?) \) )?
            }x
            )
        {
            $cur and die "Missing '&end_gen' in $in_file\n";
            my $file;
            foreach (split ' ', $2) {
                $file = $_ if $out_file =~ /$_$/;
            }
            $cur = {
                type   => $1,
                file   => $file,
                prefix => defined $3 ? $3 : '',
                defined $4 ? ( subst => $4 ) : (),
            };
            $last_val = -1;
        }
        elsif ( $line =~ /&end_gen\b/ ) {
            $cur or die "Missing &gen_from_(enum|def) in $in_file\n";
            return $cur if defined $cur->{file};
            $cur = undef;
        }

        $cur or next;

        if ( $cur->{type} eq 'def' && $line =~ /^\s*#define\s+(\w+)\s+(-?\w+|"[^"]*")/ ) {
            push @{ $cur->{defs} }, [ $1, $2 ];
        }
        elsif ( $cur->{type} eq 'enum' ) {
            # Special case: enum value is or'd combination of other values
            if ( $or_continues ) {
                $or_continues = 0;
                my $last_def = $cur->{defs}->[-1];
                my ($k, $v) = @{$last_def};
                my @or_values = grep {defined $_} $line =~ /^\s*(-?\w+)(?:\s*\|\s*(-?\w+))*/;
                for my $or (@or_values) {
                    if ( defined $values{$or} ) {
                        $v |= $values{$or};
                    }
                    elsif ( $or =~ /^0/ ) {
                        $v |= oct $or;
                    }
                }
                if ($line =~ /\|\s*$/) {
                    $or_continues = 1;
                }
                $values{$k} = $last_val = $v;
                $cur->{defs}->[-1]->[1] = $v;
            }
            elsif ( $line =~ /^\s*(\w+)\s*=\s*(-?\w+)\s*\|/ ) {
                my ( $k, $v ) = ( $1, $2 );
                my @or_values = ($v, $line =~ /\|\s*(-?\w+)/g);
                $v = 0;
                for my $or (@or_values) {
                    if ( defined $values{$or} ) {
                        $v |= $values{$or};
                    }
                    elsif ( $or =~ /^0/ ) {
                        $v |= oct $or;
                    }
                }
                if ($line =~ /\|\s*$/) {
                    $or_continues = 1;
                }
                $values{$k} = $last_val = $v;
                push @{ $cur->{defs} }, [ $k, $v ];
            }
            elsif ( $line =~ /^\s*(\w+)\s*=\s*(-?\w+)/ ) {
                my ( $k, $v ) = ( $1, $2 );
                if ( defined $values{$v} ) {
                    $v = $values{$v};
                }
                elsif ( $v =~ /^0/ ) {
                    $v = oct $v;
                }
                $values{$k} = $last_val = $v;
                push @{ $cur->{defs} }, [ $k, $v ];
            }
            elsif ( $line =~ m{^\s*(\w+)\s*(?:,\s*)?(?:/\*|$)} ) {
                my $k = $1;
                my $v = $values{$k} = ++$last_val;
                push @{ $cur->{defs} }, [ $k, $v ];
            }
        }
    }
    close $fh or die "Could not close handle to $in_file after reading: $!";
    $cur and die "Missing '&end_gen' in $in_file\n";

    return;
}

=head2 C<perform_directive()>

=over 4

=item * Arguments

    $defs_ref = perform_directive($directive);

Single hash reference (which is the return value from a successful run of
C<parse_file()>.

=item * Return Value

Array reference.

=back

=cut

sub perform_directive {
    my ($d) = @_;

    my @defs = prepend_prefix( $d->{prefix}, @{ $d->{defs} } );
    if ( my $subst = $d->{subst} ) {
        @defs = transform_name( sub { local $_ = shift; eval $subst; $_ }, @defs );
    }
    return \@defs;
}

=head2 C<const_to_parrot()>

=over 4

=item * Arguments

    $gen = join "\n", const_to_parrot(@defs);

List.

=item * Return Value

String.

=back

=cut

sub const_to_parrot {

    my $keylen = (sort { $a <=> $b } map { length($_->[0]) } @_ )[-1] ;
    my $vallen = (sort { $a <=> $b } map { length($_->[1]) } @_ )[-1] ;

    return map {sprintf ".macro_const %-${keylen}s %${vallen}s", $_->[0], $_->[1]} @_;
}

=head2 C<const_to_perl()>

=over 4

=item * Arguments

    $gen = join "\n", const_to_perl(@defs);

List.

=item * Return Value

String.

=back

=cut

sub const_to_perl {

    my $keylen = (sort { $a <=> $b } map { length($_->[0]) } @_ )[-1] ;

    return map {sprintf "use constant %-${keylen}s => %s;", $_->[0], $_->[1]} @_;
}

=head2 C<transform_name()>

=over 4

=item * Arguments

    transform_name( sub { $prefix . $_[0] }, @_ );

List of two or more elements, the first element of which is a subroutine
reference.

=item * Return Value

List which is a mapping of the transformations executed by the first argument
upon the remaining arguments.

=back

=cut

sub transform_name {
    my $action = shift;

    return map { [ $action->( $_->[0] ), $_->[1] ] } @_;
}

=head2 C<prepend_prefix()>

=over 4

=item * Arguments

    @defs = prepend_prefix $d->{prefix}, @{ $d->{defs} };

List of two or more elements, the first element of which is a string.

=item * Return Value

List.

=back

=cut

sub prepend_prefix {
    my $prefix = shift;

    return transform_name( sub { $prefix . $_[0] }, @_ );
}

=head2 C<generate_text()>

=over 4

=item * Argument

    $generated_text = generate_text($directive, \@defs);

List of two arguments: Directive hashref; reference to array of definitions.

=item * Return Value

String holding main text to be printed to new file.

=back

=cut

sub generate_text {
    my ($directive, $defs_ref) = @_;

    my $target  = $directive->{file};
    my $generated_text;
    if ($target =~ /\.pm$/) {
        $generated_text = join "\n", const_to_perl(@{ $defs_ref });
        $generated_text .= "\n1;";
    }
    else {
        $generated_text = join "\n", const_to_parrot(@{ $defs_ref });
    }
    return $generated_text;
}

=head2 C<print_generated_file()>

=over 4

=item * Argument

    print_generated_file( {
        in      => $in_file,
        out     => $out_file,
        script  => $0,
        gen     => $generated_text,
    } );

Hash reference.  Elements pertain to file being read, file being created,
calling program (typically, F<tools/build/h2inc.pl>) and string of text to be
printed to file.

=item * Return Value

Implicitly returns true upon success.

=back

=cut

sub print_generated_file {
    my $args = shift;
    open my $out_fh, '>', $args->{out} or die "Can't open $args->{out}: $!\n";
    print {$out_fh} <<"EOF";
# DO NOT EDIT THIS FILE.
#
# This file is generated automatically from
# $args->{in} by $args->{script}
#
# Any changes made here will be lost.
#
$args->{gen}
EOF
    close $out_fh;

    return;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
