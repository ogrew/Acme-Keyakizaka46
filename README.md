
# NAME
Acme::Keyakizaka46 - All about Japanse idol group "Keyakizaka46"

# SYNOPSIS

```perl
  use Acme::Keyakizaka46;

  my $keyaki = Acme::Keyakizaka46->new;

  # retrieve the members on their activities
  my @members              = $keyaki->members;
  my @kanji_members        = $keyaki->members('kanji');
  my @hiragana_members     = $keyaki->members('hiragana');

  # retrieve the members under some conditions
  my @sorted_by_age        = $keyaki->sort('age', 1);
  my @sorted_by_class      = $keyaki->sort('class', 1);
  my @selected_by_age      = $keyaki->select('age', 18, '>=');
  my @selected_by_class    = $keyaki->select('class', 2, '==');
```

# DESCRIPTION

"Keyakizaka46" is a Japanese famous idol group.  
This module, Acme::Keyakizaka46, provides an easy method to catch up
with Keyakizaka46.

# METHODS

## new

```perl
  my $keyaki = Acme::Keyakizaka46->new;
```
Creates and returns a new Acme::Keyakizaka46 object.

## members ( $type )

```perl
  # $type can be one of the values below:
  #  + kanji               : KANJI KEYAKI MEMBERS
  #  + hiragana            : HIRAGANA KEYAKI MEMBERS
  #  + undef               : ALL MEMBERS

  my @members = $keyaki->members('kanji');
```

Returns the members as a list of the `Acme::Keyakizaka46::Base`
based object represents each member.

## sort ( $type, $order [ , @members ] )

```perl
  # $type can be one of the values below:
  #  + age   :  sort by age
  #  + class :  sort by class
  #
  # $order can be a one of the values below:
  #  + desc                :  sort in descending order
  #  + asc (anything else) :  sort in ascending order

  my @sorted_members = $keyaki->sort('age', 'desc'); # sort by age in descending order
```

Returns the members sorted by the `$type` field.

## select ( $type, $number, $operator [, @members] )

```perl
  # $type can be one of the same values above:
  my @selected_members = $keyaki->select('age', 18, '>=');
```

Returns the members satisfy the given `$type` condition. `$operator`
must be a one of `'==', '>=', '<=', '>', '<'`.

This method compares the given `$type` to the member's one in the order below:

```perl
  $number $operator $member_value
```

# SEE ALSO

* [Keyakizaka46 (Official Site)](http://www.keyakizaka46.com/)

* [Acme::Nogizaka46](http://search.cpan.org/~twogmon/Acme-Nogizaka46-0.3/lib/Acme/Nogizaka46.pm)

# AUTHOR

Okawara Ayato

# LICENSE

Copyright (C) Okwara Ayato.

This library is free software; you can redistribute it and/or modify it under the same terms as Perl itself.
