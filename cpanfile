requires 'Exporter';
requires 'Scope::Guard';

on 'test' => sub {
    requires => 'Test::More';
    requires => 'Test::Requires';
    recommends => 'Moose';
    recommends => 'Moo';
    recommends => 'Mo';
    recommends => 'Mouse';
    recommends => 'Class::Accessor';
    recommends => 'Mojolicious';
};