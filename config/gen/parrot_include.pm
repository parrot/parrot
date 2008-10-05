# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$

=head1 NAME

config/gen/parrot_include.pm - Runtime Includes

=head1 DESCRIPTION

Generates the F<runtime/parrot/include> files.

=cut

package gen::parrot_include;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':gen';


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Generate runtime/parrot/include};
    $data{result} = q{};
    $data{source_files} = [ qw(
        include/parrot/cclass.h
        include/parrot/datatypes.h
        include/parrot/enums.h
        include/parrot/events.h
        include/parrot/scheduler.h
        include/parrot/exceptions.h
        include/parrot/interpreter.h
        include/parrot/io.h
        include/parrot/longopt.h
        include/parrot/multidispatch.h
        include/parrot/resources.h
        include/parrot/stat.h
        include/parrot/string.h
        include/parrot/pmc.h
        include/parrot/warnings.h
        src/pmc/timer.pmc
        src/utils.c
    ) ];
    $data{generated_files} = [ qw(
        include/parrot/vtable.h
        include/parrot/core_pmcs.h
    ) ];
    $data{destdir} = 'runtime/parrot/include';
    return \%data;
}

sub const_to_parrot {
    map ".macro_const $_->[0]\t$_->[1]", @_;
}

# refactor to generate 'use constant' statements, RT#42286
sub const_to_perl {
    map "$_->[0] => $_->[1],", @_;
}

sub transform_name {
    my $action = shift;

    return map { [ $action->( $_->[0] ), $_->[1] ] } @_;
}

sub prepend_prefix {
    my $prefix = shift;

    transform_name( sub { $prefix . $_[0] }, @_ );
}

sub perform_directive {
    my ($d) = @_;

    my @defs = prepend_prefix $d->{prefix}, @{ $d->{defs} };
    if ( my $subst = $d->{subst} ) {
        @defs = transform_name( sub { local $_ = shift; eval $subst; $_ }, @defs );
    }
    @defs;
}

sub parse_file {
    my ( $file, $fh ) = @_;

    my ( @d, %values, $last_val, $cur, $or_continues );
    while ( my $line = <$fh> ) {
        if (
            $line =~ m!
            &gen_from_(enum|def) \( ( [^)]* ) \)
            (?: \s+ prefix \( (\w+) \) )?
            (?: \s+ subst \( (s/.*?/.*?/[eig]?) \) )?
            !x
            )
        {
            $cur and die "Missing '&end_gen' in $file\n";
            $cur = {
                type   => $1,
                files  => [ split ' ', $2 ],
                prefix => defined $3 ? $3 : '',
                defined $4 ? ( subst => $4 ) : (),
            };
            $last_val = -1;
        }
        elsif ( $line =~ /&end_gen\b/ ) {
            $cur or die "Missing &gen_from_(enum|def) in $file\n";
            push @d, $cur;
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
            elsif ( $line =~ m!^\s*(\w+)\s*(?:,\s*)?(?:/\*|$)! ) {
                my $k = $1;
                my $v = $values{$k} = ++$last_val;
                push @{ $cur->{defs} }, [ $k, $v ];
            }
        }
    }
    $cur and die "Missing '&end_gen' in $file\n";

    return @d;
}

sub runstep {
    my ( $self, $conf ) = @_;
    my $verbose = $conf->options->get('verbose');

    # need vtable.h now
    system( $^X, "tools/build/vtable_h.pl" );

    my @generated;
    for my $file ( @{ $self->{source_files} }, @{ $self->{generated_files} } ) {
        open my $fh, '<', $file or die "Can't open $file: $!\n";
        my @directives = parse_file $file, $fh;
        close $fh;
        for my $d (@directives) {
            my @defs = perform_directive $d;
            for my $target ( @{ $d->{files} } ) {
                $verbose and print "$target ";
                my $gen = join "\n",
                    ( $target =~ /\.pl$/ ? \&const_to_perl : \&const_to_parrot )->(@defs);
                $conf->append_configure_log(qq{$self->{destdir}/$target});
                my $target_tmp = "$target.tmp";
                open my $out, '>', $target_tmp or die "Can't open $target_tmp: $!\n";

                # refactor to include package declarations and Export
                # declarations for generated Perl constant modules, RT#42286
                print $out <<"EOF";
# DO NOT EDIT THIS FILE.
#
# This file is generated automatically from
# $file by config/gen/parrot_include.pm
#
# Any changes made here will be lost.
#
$gen
EOF
                close $out or die "Can't write $target_tmp: $!\n";
                $target =~ m[/] or $target = "$self->{destdir}/$target";
                move_if_diff( $target_tmp, $target );
                push @generated, $target;
            }
        }
    }
    $conf->data->set( TEMP_gen_pasm_includes => join( " \\\n    ", @generated ) );

    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
