package Regex::State;

sub new {
    my ($class, %options) = @_;
    my $self = bless { _markers => {},
                       %options
                     }, ref($class) || $class;
    return $self;
}

sub genlabel {
    my ($self, $desc) = @_;
    $desc ||= '';
    my $number = ++$self->{_markers}->{$desc};
    $number = '' if ($number == 1) && ($desc ne '');
    return bless { name => 'LABEL',
                   label => "\@$desc$number",
                 }, 'Regex::Ops::Label';
}

1;
