package Regex::State;

sub new {
    my ($class, %options) = @_;
    my $self = bless { _markers => {},
                       %options
                     }, ref($class) || $class;
    return $self;
}

sub literal_label {
    my ($self, $label, $desc) = @_;
    $desc ||= '';
    return bless { name => 'LABEL',
                   label => $label,
                 }, 'Regex::Ops::Label';
}

sub genlabel {
    my ($self, $desc) = @_;
    my $number = ++$self->{_markers}->{$desc};
    $number = '' if ($number == 1) && ($desc ne '');
    return $self->literal_label("\@$desc$number", $desc);
}

1;
