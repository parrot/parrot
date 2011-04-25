# Copyright (C) 2004-2006, Parrot Foundation.
package Parrot::Pmc2c::Emitter;
use strict;
use warnings;
use Parrot::Pmc2c::UtilFunctions qw(count_newlines spew);
use Parrot::Pmc2c::Pmc2cMain ();
use overload '""'   => \&stringify;
use overload 'bool' => \&boolify;

sub new {
    my ( $class, $filename ) = @_;
    my $self = { filename => $filename, };
    bless $self, ( ref($class) || $class );
    $self;
}

sub text {
    my ( $class, $data, $filename, $bline ) = @_;
    $filename ||= "";
    $bline    ||= -1;
    my $self = {
        data     => $data,
        filename => $filename,
        bline    => $bline,
        eline    => $bline + count_newlines($data),
    };
    bless $self, ref($class) || $class;
    $self;
}

sub find {
    my ( $self, $regex ) = @_;
    if ( $self->{items} ) {
        for my $x ( @{ $self->{items} } ) {
            my $matched = $x->find($regex);
            return $matched if $matched;
        }
    }
    else {
        return $self if ( $self->{data} =~ /$regex/ );
    }
    return 0;
}

sub subst {
    my ( $self, $regex, $replacement ) = @_;
    if ( $self->{items} ) {
        for my $x ( @{ $self->{items} } ) {
            $x->subst( $regex, $replacement );
        }
    }
    else {
        while ( $self->{data} =~ m/$regex/ ) {
            my $result = $replacement->();
            $self->{data} =~ s/$regex/$result/x;
        }
    }
    return 1;
}

sub replace {
    my ( $self, $regex, $replacement ) = @_;
    my $m = $self->{data} =~ /((.*)\Q$regex\E)(.*)/s;
    my ( $all, $pre, $post ) = ( $1, $2, $3 );
    $self->emit( $pre, $self->filename, $self->{bline} );
    $self->add_fragment($replacement);
    $self->emit( $post, $self->filename, $self->{bline} + count_newlines($all) );

    for my $x (qw( data bline eline )) {
        delete $self->{$x};
    }
    return 1;
}

sub stringify {
    my ($self) = @_;
    my $out = "";

    if ( $self->{items} ) {
        for my $x ( @{ $self->{items} } ) {
            $out .= $x->stringify;
        }
    }
    else {
        $out .= $self->{data};
    }
    return $out;
}

sub boolify {
    my ($self) = @_;
    return $self;
}

sub annotate {
    my ($self) = @_;
    $self->{output}       = "";
    $self->{current_file} = $self->filename;
    $self->{current_line} = 1;

    $self->annotate_worker($self);

    my $output = $self->{output};

    for my $x (qw( output current_line current_file )) {
        delete $self->{$x};
    }

    return $output;
}

sub annotate_worker {
    my ( $self, $it ) = @_;

    if ( $it->{items} ) {
        for my $x ( @{ $it->{items} } ) {
            $self->annotate_worker($x);
        }
    }
    else {
        my $data;
        my $filename = $it->{filename} || $self->filename;
        my $line = $it->{bline};

        #no need to emit uneccessary #line directive
        if ( $line == -1 and $self->filename eq $self->{current_file} ) {
            $data = $it->{data};
        }
        else {
            $line = $self->{current_line} if $line == -1;
            if (!$Parrot::Pmc2c::Pmc2cMain::OPTIONS->{nolines}) {
                ( my $filename_escaped = $filename ) =~ s|\\|/|g;
                $data .= "/* LINE $line \"$filename_escaped\" */\n";
            }
            $data .= $it->{data};
        }
        $self->{output} .= $data;
        $self->{current_file} = $filename;
        $self->{current_line} += count_newlines($data);
    }
}

sub emit {
    my ( $self, $item, $file, $line ) = @_;
    unless ( ref($item) eq 'Parrot::Pmc2c::Emitter' ) {
        $file ||= $self->filename;
        $line ||= -1;
        $item = $self->text( $item, $file, $line );
    }
    $self->add_fragment($item);
}

sub add_fragment {
    my ( $self, $item ) = @_;
    push @{ $self->{items} }, $item;
}

sub filename {
    my ( $self, $value ) = @_;
    $self->{filename} = $value if $value;
    return $self->{filename};
}

sub write_to_file {
    my ($self) = @_;
    spew( $self->filename, $self->annotate );
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

