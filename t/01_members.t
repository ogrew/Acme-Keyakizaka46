use strict;
use DateTime;
use Acme::Keyakizaka46;
use Test::More tests => 7;

my $keyaki = Acme::Keyakizaka46->new;

is scalar($keyaki->members),             51, " members(undef) retrieved all";
is scalar($keyaki->members('kanji')),    35, " members('kanji')";
is scalar($keyaki->members('graduate')), 16, " members('hiragana')";
is scalar($keyaki->members(DateTime->new(year => 2011, month => 8, day => 20))), 0, " members('date_simple_object')";
is scalar($keyaki->members(DateTime->new(year => 2011, month => 8, day => 21))), 36, " members('date_simple_object')";
is scalar($keyaki->members(DateTime->new(year => 2014, month => 8, day => 21))), 43, " members('date_simple_object')";
is scalar($keyaki->members(DateTime->new(year => 2016, month => 3, day => 23))), 36, " members('date_simple_object')";