package Tester::Venus;
use Venus::Class;

attr 'hashref';
attr 'string';

sub DATA {
    {
        hashref => { key => 'value' },
        string  => 'string'
    }
}

sub change_hashref {
    my ( $self, $key, $val ) = @_;

    $self->hashref->{$key} = $val;
}

1;
