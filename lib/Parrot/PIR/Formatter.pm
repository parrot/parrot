# Copyright (C) 2004-2005, The Perl Foundation.
# $Id$

package Parrot::PIR::Formatter;

use strict;
use warnings;

sub new {
    my $class = shift;
    my $code  = shift;

    my $self = {};

    $self->{indent} = q{ } x 4;
    my $pir = [];
    if ( defined($code) ) {
        $pir = [ split "\n", $code ];
    }
    $self->{raw_pir} = $pir;

    bless $self, $class;
    return $self;
}

sub add_pir {
    my $self = shift;
    my @code = @_;

    foreach my $chunk (@code) {
        if ($chunk eq "\n") {
            push @{ $self->{raw_pir} }, "\n";
        } else {
            push @{ $self->{raw_pir} }, split /\n/, $chunk;
        }
    }
    return;    #void
}

# XXX we should check for proper nesting

my $block_begin = qr{ ( ^ \.sub | ^push_eh) }smx;

my $block_end = qr{
  (
    ^\.end$
    |
    ^clear_eh$
  )
}smx;

my $blank_before = qr { : $}smx;    #labels

my $verbatim_begin = qr{ ^= }smx;
my $verbatim_end   = qr{ ^=cut }smx;

sub get_formatted {
    my ($self) = shift;

    my $level    = 0;
    my $verbatim = 0;

    # Step one - indent, and add in extra blank lines.

    my @output;
    my $verbatim_chunk;

    foreach my $line ( @{ $self->{raw_pir} } ) {
        if ( $line =~ $verbatim_begin ) {
            $verbatim = 1;
        }
        if ( $line =~ $verbatim_end ) {
            $verbatim_chunk .= $line;
            $verbatim_chunk .= "\n";

            # bracket the verbatim chunk with whitespace.
            push @output, [ 1, q{} ];
            push @output, [ 0, $verbatim_chunk ];
            push @output, [ 1, q{} ];
            undef $verbatim_chunk;
            $verbatim = 0;
            next;
        }

        if ($verbatim) {
            $verbatim_chunk .= $line;
            $verbatim_chunk .= "\n";
            next;
        }
        else {

            # strip whitespace
            $line =~ s{ ^ \s+ }{}xms;
            $line =~ s{ \s+ $ }{}xms;

            if ( $line =~ $blank_before ) {
                push @output, [ 1, q{} ];
            }

            if ( $line ne q{} ) {
                if ( $line =~ $block_end ) {
                    $level--;
                }
                $line = ( $self->{indent} x $level ) . $line;
                if ( $line =~ $block_begin ) {
                    push @output, [ 1, q{} ];
                    $level++;
                }
            }
            push @output, [ 1, $line ];
            if ( $line =~ $block_end ) {
                push @output, [ 1, q{} ];
            }
        }
    }
    # Badly formatted pir might end in the middle of a verbatim chunk.
    if ($verbatim) {
      die "POD unclosed at end of file\n";
    }

    # Remove leading and final blank lines.
    while ( $output[0][0] && $output[0][1] eq q{} ) {
        shift @output;
    }
    while ( $output[1][0] && $output[-1][1] eq q{} ) {
        pop @output;
    }

    # Compose the return string - skip any
    # adjancent blank lines.

    my $result;
    my $seen_blank;
    foreach my $item (@output) {
        my ( $type, $code ) = ( @{$item} );
        if ($type) {
            if ( $code eq q{} ) {
                $seen_blank = 1;
                next;
            }
            if ($seen_blank) {

                # Add in our one blank line.
                $seen_blank = 0;
                $result .= "\n";
            }
            $result .= $code;
            $result .= "\n";
        }
        else {
            if ($seen_blank) {
              $result .= "\n";
              $seen_blank = 0;
            }
            # verbatim hunk.
            $result .= $code;
        }
    }

    return $result;
}

# vim: expandtab shiftwidth=4:
1;

__END__

=head1 NAME

Parrot::PIR::Formatter - Given ugly PIR, format it nicely.

=head1 SYNOPSIS

 use Parrot::PIR::Formatter;

=head1 DESCRIPTION

Primarily intended to be used by C<pirtidy.pl>. Given some ugly PIR,
format it nicely.

=head2 SUBROUTINES/METHODS

=over 4

=item $obj = C<new([code])>

Returns C<$obj> as a new instance.

=item C<$obj->add_pir($code, $code, ...)>

Add more pir to be processed. 

=item C<$code = $obj->get_formatted()>

Return the nicely formatted code for the raw PIR that's been provided.

=for XXX

Many things to muck with line could be done here:

 o remove extraneous spaces.
 o add in "proper" spacing (after commas, etc.)
 o heredocs could be treated as blocks to set them off visually.
 o could remove/add explicit declarations of string type
 o could convert double to single quotes when possible.
 o could convert strings with embedded newlines to heredocs.

Things that might ease deprecation, but probably won't get done until
after these items are already deprecated.

 o could fixup Pmc vs. .Pmc
 o could undo usage of '<reg> = opcode' syntax where that syntax will
   eventually be prohibited.

Or not. =-)

=back

=head1 BUGS AND LIMITATIONS

Does not play well with heredocs. Should arguably be part of IMCC,
which already knows how to parse PIR.

=cut

