package Acme::Keyakizaka46::SuzukaTomita;

use strict;
use warnings;

use base qw(Acme::Keyakizaka46::Base);

sub info {
    return (
        first_name_en => 'Suzuka',
        family_name_en => 'Tomita',
        first_name_ja => '鈴花',
        family_name_ja => '富田',
        birthday => '20010118',
        zodiac_sign => 'やぎ座',
        height => '164',
        hometown => '神奈川',
        blood_type => 'A',
        team => 'hiragana',
        class => '2',
        center => undef,
    );
}

1;
