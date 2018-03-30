use strict;
use DateTime;
use Acme::Keyakizaka46;
use Test::More tests => 2;

my $keyaki  = Acme::Keyakizaka46->new;

my @neru = $keyaki->select('family_name_en', 'Nagahama', 'eq');
is $neru[0]->name_en, 'Neru Nagahama', "select('first_name_en')";

is $keyaki->select('center', undef, 'ne'), 1; # センター経験者はてちのみ
