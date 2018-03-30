package Acme::Keyakizaka46::ShioriSato;

use strict;
use warnings;

use base qw(Acme::Keyakizaka46::Base);

sub info {
    return (
        first_name_en => 'Shiori',
        family_name_en => 'Sato',
        first_name_ja => '詩織',
        family_name_ja => '佐藤',
        birthday => '19961116',
        zodiac_sign => 'さそり座',
        height => '161',
        hometown => '東京',
        blood_type => 'A',
        team => 'kanji',
        class => '1',
        center => undef,
    );
}

1;
