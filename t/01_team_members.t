use strict;
use DateTime;
use Acme::Keyakizaka46;
use Test::More tests => 3;

my $keyaki = Acme::Keyakizaka46->new;

is scalar($keyaki->team_members),             41, " members(undef) retrieved all";
is scalar($keyaki->team_members('kanji')),    21, " members('kanji')";
is scalar($keyaki->team_members('hiragana')), 20, " members('hiragana')";
