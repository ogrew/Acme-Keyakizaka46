import requests
from datetime import datetime
from bs4 import BeautifulSoup

for i in range(1, 43):

    if i == 16: # 原田◯ゆ
        continue

    # url_paramの都合
    if i < 10:
        num = "0" + str(i)
    else:
        num = str(i)

    member_url = "http://www.keyakizaka46.com/s/k46o/artist/" + num

    r = requests.get(member_url)
    soup = BeautifulSoup(r.text,"html.parser")

    # 「KOIKE MINAMI」
    en     = soup.find('span', class_='en').string.strip()
    # 公式サイトが悪い
    if i < 23:
        en_s   = en.split("　")
        name_formatted = en.title().replace("　","")
    else:
        en_s   = en.split(" ")
        name_formatted = en.title().replace(" ","")
    # 「小池 美波」
    name   = soup.find('p', class_='name').string.strip()
    name_s = name.split(" ")


    # ローマ字読みはファイル名に使いたい
    # 「KoikeMinami」
    
    file_name = name_formatted + ".pm"
    print (name_formatted)
    # print ("now generating... " + file_name)

    personal_f = open("Keyakizaka46/" + file_name,'w')

    package_name = "package Acme::Keyakizaka46::" + name_formatted + ";\n"
    personal_f.write(package_name)

    header = """
use strict;
use warnings;

use base qw(Acme::Keyakizaka46::Base);

sub info {
    return (
"""

    personal_f.write(header)
    
    name_en_str = "        first_name_en => '" + en_s[0].title() + "',\n" + "        family_name_en => '" + en_s[1].title() + "',\n"
    personal_f.write(name_en_str)

    name_ja_str = "        first_name_ja => '" + name_s[1] + "',\n" + "        family_name_ja => '" + name_s[0] + "',\n"
    personal_f.write(name_ja_str)

    # あとで直接Perlで取り扱うので先にtopic名として英語に変更しておく
    topic = ["birthday", "zodiac_sign", "height", "hometown", "blood_type", "team","class"]
    datas = [d.string for d in soup.find_all("dt")]

    # 欅坂かけやき坂か
    if i < 23:
        datas.append("kanji")
        if i == 22: # ねる
            datas.append("special")
        else:
            datas.append("1")
    else:
        datas.append("hiragana")
        if i < 34:
            datas.append("1")
        else:
            datas.append("2")

    for j in range(len(topic)):
        data = datas[j].strip()

        if j == 0:      # birtyday
            dt = datetime.strptime(data, '%Y年%m月%d日')
            data = dt.strftime("%Y%m%d")
        elif j == 4:    # blood_type:「型」を抜きたい
            data = data[:-1]
        elif j == 2:    # height:「cm」を抜きたい
            data = data[:-2]

        personal_f.write("        " + topic[j] + " => '" + data + "',\n")

    if i == 17: # てち（だいぶ強引）
        personal_f.write("        center => [qw(1st 2nd 3rd 4th 5th)],")
    else:
        personal_f.write("        center => undef,")

    footer = """
    );
}

1;
"""
    personal_f.write(footer)

    personal_f.close()


# ----------
# output
# ----------
#URL:  http://www.keyakizaka46.com/s/k46o/artist/01
#Module Name: NijikaIshimori.pm

# ....