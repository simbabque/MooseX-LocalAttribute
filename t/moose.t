use strict;
use warnings;

use Test::More;
use Test::Requires 'Moose';


package Foo;
use Moose;

has bar => (
    is => 'rw',
    isa => 'HashRef',
    default => sub {{}},
);

