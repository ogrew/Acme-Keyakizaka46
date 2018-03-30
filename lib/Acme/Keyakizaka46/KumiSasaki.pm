package Acme::Keyakizaka46::KumiSasaki;

use strict;
use warnings;

use base qw(Acme::Keyakizaka46::Base);

sub info {
    return (
        first_name_en => 'Kumi',
        family_name_en => 'Sasaki',
        first_name_ja => '久美',
        family_name_ja => '佐々木',
        birthday => '19960122',
        zodiac_sign => 'みずがめ座',
        height => '167',
        hometown => '千葉',
        blood_type => 'O',
        team => 'hiragana',
        class => '1',
        center => undef,
    );
}

1;
