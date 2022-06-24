# NAME

MooseX::LocalAttribute - local-ize attributes on Moose-ish objects

# SYNOPSIS

    use MooseX::LocalAttribute;

    my $freddy = Person->new( name => 'Freddy' );
    print $freddy->name; # Freddy
    {
        my $temporary_name = 'Mr Orange';
        my $guard = local_attribute( $freddy, "name", \$temporary_name );
        print $freddy->name; # Mr Orange
        steal_diamonds( $freddy );
    }
    print $freddy->name; # Freddy

# DESCRIPTION

This module provides a mechanism to temporarily replace the value of an
object attribute with a different variable. In typical object oriented Perl
code, an object contains a blessed hash reference, so it's possible to reach
into the internals to localise data.

    my $local_bar;
    local $foo->{bar} = \$local_bar;

This has a few problems though. It is generally a better idea to use accessors
rather than to rumage around in the internals of an object. This is especially
true if one does not know whether the object is in fact a hash reference under
the hood.

When a variable is localised with `local`, a backup of that variable is made.
Perl then places a directive on the stack that restores the variable when it
is goes out of scope. This module does the same thing for attributes of
objects.

# WHICH OBJECTS DOES THIS WORK FOR

While this module is called MooseX::LocalAttribute, it will work for all kinds
of objects, as long as there is a read/write accessor. It has been tested for
[Moose](https://metacpan.org/pod/Moose), [Mouse](https://metacpan.org/pod/Mouse), [Moo](https://metacpan.org/pod/Moo), [Mo](https://metacpan.org/pod/Mo), [Mojo::Base](https://metacpan.org/pod/Mojo%3A%3ABase), [Class::Accessor](https://metacpan.org/pod/Class%3A%3AAccessor),
[Util::H2O](https://metacpan.org/pod/Util%3A%3AH2O) and classic Perl OO code using `bless` and hand-rolled accessors,
but there is a good chance it will work on other object implementations too.

# EXPORTS

## local\_attribute($obj, $attr, $val)

Takes an object `$obj` and temporarily localizes the attribute `$attr` on
it to `$val`. It returns a [Scope::Guard](https://metacpan.org/pod/Scope%3A%3AGuard) object that will restore the
original value of `$attr` when it goes out of scope.

    my $guard = local_attribute( $bob, 'name', 'joe' ); # $bob->name eq 'joe'

You **must** always capture the return value of `local_attribute` and store it
in a variable. It will die if called in void context, because the underlying
[Scope::Guard](https://metacpan.org/pod/Scope%3A%3AGuard) object cannot work in void context. Your attribute would be
replaced permanently.

    local_attribute( $foo, 'attr', 'new value' ); # BOOM

This function is exported by default.

# SEE ALSO

- [Scope::Guard](https://metacpan.org/pod/Scope%3A%3AGuard)
- [Moose](https://metacpan.org/pod/Moose)
- [Moo](https://metacpan.org/pod/Moo)

# AUTHOR

Julien Fiegehenn <simbabque@cpan.org>

# COPYRIGHT

Copyright (c) 2022, Julien Fiegehenn.

This is free software; you can redistribute it and/or modify it under the same
terms as the Perl 5 programming language system itself.
