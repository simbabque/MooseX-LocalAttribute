use strict;
use warnings;

on 'runtime' => sub {
    requires 'perl' => '5.008';
    requires 'Exporter';
    requires 'Scope::Guard';
};

on 'test' => sub {
    requires 'FindBin';
    requires 'Test::Exception';
    requires 'Test::More';
    requires 'Test::Requires';
    recommends 'Moose';
    recommends 'Moo';
    recommends 'Mo';
    recommends 'Mouse';
    recommends 'Class::Accessor';
    recommends 'Util::H2O';
    suggests 'Mojolicious';
};
