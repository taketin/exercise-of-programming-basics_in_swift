import UIKit
import XCTest

// 駅データ

struct Ekimei {
    let kanji: String
    let kana: String
    let romaji: String
    let shozoku: String

    init(kanji: String, kana: String, romaji: String, shozoku: String) {
        self.kanji = kanji
        self.kana = kana
        self.romaji = romaji
        self.shozoku = shozoku
    }

    init(romaji: String, kana: String, kanji: String, shozoku: String) {
        self.kanji = kanji
        self.kana = kana
        self.romaji = romaji
        self.shozoku = shozoku
    }
}

struct Ekikan {
    let kiten: String
    let shuten: String
    let keiyu: String
    let kyori: Float
    let jikan: Int
}

let global_ekimei_list = [
Ekimei(kanji: "代々木上原", kana: "よよぎうえはら", romaji: "yoyogiuehara", shozoku: "千代田線"),
Ekimei(kanji: "代々木公園", kana: "よよぎこうえん", romaji: "yoyogikouen", shozoku: "千代田線"),
Ekimei(kanji: "明治神宮前", kana: "めいじじんぐうまえ", romaji: "meijijinguumae", shozoku: "千代田線"),
Ekimei(kanji: "表参道", kana: "おもてさんどう", romaji: "omotesandou", shozoku: "千代田線"),
Ekimei(kanji: "乃木坂", kana: "のぎざか", romaji: "nogizaka", shozoku: "千代田線"),
Ekimei(kanji: "赤坂", kana: "あかさか", romaji: "akasaka", shozoku: "千代田線"),
Ekimei(kanji: "国会議事堂前", kana: "こっかいぎじどうまえ", romaji: "kokkaigijidoumae", shozoku: "千代田線"),
Ekimei(kanji: "霞ヶ関", kana: "かすみがせき", romaji: "kasumigaseki", shozoku: "千代田線"),
Ekimei(kanji: "日比谷", kana: "ひびや", romaji: "hibiya", shozoku: "千代田線"),
Ekimei(kanji: "二重橋前", kana: "にじゅうばしまえ", romaji: "nijuubasimae", shozoku: "千代田線"),
Ekimei(kanji: "大手町", kana: "おおてまち", romaji: "otemachi", shozoku: "千代田線"),
Ekimei(kanji: "新御茶ノ水", kana: "しんおちゃのみず", romaji: "shin-ochanomizu", shozoku: "千代田線"),
Ekimei(kanji: "湯島", kana: "ゆしま", romaji: "yushima", shozoku: "千代田線"),
Ekimei(kanji: "根津", kana: "ねづ", romaji: "nedu", shozoku: "千代田線"),
Ekimei(kanji: "千駄木", kana: "せんだぎ", romaji: "sendagi", shozoku: "千代田線"),
Ekimei(kanji: "西日暮里", kana: "にしにっぽり", romaji: "nishinippori", shozoku: "千代田線"),
Ekimei(kanji: "町屋", kana: "まちや", romaji: "machiya", shozoku: "千代田線"),
Ekimei(kanji: "北千住", kana: "きたせんじゅ", romaji: "kitasenjyu", shozoku: "千代田線"),
Ekimei(kanji: "綾瀬", kana: "あやせ", romaji: "ayase", shozoku: "千代田線"),
Ekimei(kanji: "北綾瀬", kana: "きたあやせ", romaji: "kitaayase", shozoku: "千代田線"),
Ekimei(kanji: "浅草", kana: "あさくさ", romaji: "asakusa", shozoku: "銀座線"),
Ekimei(kanji: "田原町", kana: "たわらまち", romaji: "tawaramachi", shozoku: "銀座線"),
Ekimei(kanji: "稲荷町", kana: "いなりちょう", romaji: "inaricho", shozoku: "銀座線"),
Ekimei(kanji: "上野", kana: "うえの", romaji: "ueno", shozoku: "銀座線"),
Ekimei(kanji: "上野広小路", kana: "うえのひろこうじ", romaji: "uenohirokoji", shozoku: "銀座線"),
Ekimei(kanji: "末広町", kana: "すえひろちょう", romaji: "suehirocho", shozoku: "銀座線"),
Ekimei(kanji: "神田", kana: "かんだ", romaji: "kanda", shozoku: "銀座線"),
Ekimei(kanji: "三越前", kana: "みつこしまえ", romaji: "mitsukoshimae", shozoku: "銀座線"),
Ekimei(kanji: "日本橋", kana: "にほんばし", romaji: "nihonbashi", shozoku: "銀座線"),
Ekimei(kanji: "京橋", kana: "きょうばし", romaji: "kyobashi", shozoku: "銀座線"),
Ekimei(kanji: "銀座", kana: "ぎんざ", romaji: "ginza", shozoku: "銀座線"),
Ekimei(kanji: "新橋", kana: "しんばし", romaji: "shinbashi", shozoku: "銀座線"),
Ekimei(kanji: "虎ノ門", kana: "とらのもん", romaji: "toranomon", shozoku: "銀座線"),
Ekimei(kanji: "溜池山王", kana: "ためいけさんのう", romaji: "tameikesannou", shozoku: "銀座線"),
Ekimei(kanji: "赤坂見附", kana: "あかさかみつけ", romaji: "akasakamitsuke", shozoku: "銀座線"),
Ekimei(kanji: "青山一丁目", kana: "あおやまいっちょうめ", romaji: "aoyamaicchome", shozoku: "銀座線"),
Ekimei(kanji: "外苑前", kana: "がいえんまえ", romaji: "gaienmae", shozoku: "銀座線"),
Ekimei(kanji: "表参道", kana: "おもてさんどう", romaji: "omotesando", shozoku: "銀座線"),
Ekimei(kanji: "渋谷", kana: "しぶや", romaji: "shibuya", shozoku: "銀座線"),
Ekimei(kanji: "渋谷", kana: "しぶや", romaji: "shibuya", shozoku: "半蔵門線"),
Ekimei(kanji: "表参道", kana: "おもてさんどう", romaji: "omotesandou", shozoku: "半蔵門線"),
Ekimei(kanji: "青山一丁目", kana: "あおやまいっちょうめ", romaji: "aoyama-itchome", shozoku: "半蔵門線"),
Ekimei(kanji: "永田町", kana: "ながたちょう", romaji: "nagatacho", shozoku: "半蔵門線"),
Ekimei(kanji: "半蔵門", kana: "はんぞうもん", romaji: "hanzomon", shozoku: "半蔵門線"),
Ekimei(kanji: "九段下", kana: "くだんした", romaji: "kudanshita", shozoku: "半蔵門線"),
Ekimei(kanji: "神保町", kana: "じんぼうちょう", romaji: "jinbocho", shozoku: "半蔵門線"),
Ekimei(kanji: "大手町", kana: "おおてまち", romaji: "otemachi", shozoku: "半蔵門線"),
Ekimei(kanji: "三越前", kana: "みつこしまえ", romaji: "mitsukoshimae", shozoku: "半蔵門線"),
Ekimei(kanji: "水天宮前", kana: "すいてんぐうまえ", romaji: "suitengumae", shozoku: "半蔵門線"),
Ekimei(kanji: "清澄白河", kana: "きよすみしらかわ", romaji: "kiyosumi-shirakawa", shozoku: "半蔵門線"),
Ekimei(kanji: "住吉", kana: "すみよし", romaji: "sumiyoshi", shozoku: "半蔵門線"),
Ekimei(kanji: "錦糸町", kana: "きんしちょう", romaji: "kinshicho", shozoku: "半蔵門線"),
Ekimei(kanji: "押上", kana: "おしあげ", romaji: "oshiage", shozoku: "半蔵門線"),
Ekimei(kanji: "中目黒", kana: "なかめぐろ", romaji: "nakameguro", shozoku: "日比谷線"),
Ekimei(kanji: "恵比寿", kana: "えびす", romaji: "ebisu", shozoku: "日比谷線"),
Ekimei(kanji: "広尾", kana: "ひろお", romaji: "hiro", shozoku: "日比谷線"),
Ekimei(kanji: "六本木", kana: "ろっぽんぎ", romaji: "roppongi", shozoku: "日比谷線"),
Ekimei(kanji: "神谷町", kana: "かみやちょう", romaji: "kamiyacho", shozoku: "日比谷線"),
Ekimei(kanji: "霞ヶ関", kana: "かすみがせき", romaji: "kasumigaseki", shozoku: "日比谷線"),
Ekimei(kanji: "日比谷", kana: "ひびや", romaji: "hibiya", shozoku: "日比谷線"),
Ekimei(kanji: "銀座", kana: "ぎんざ", romaji: "ginza", shozoku: "日比谷線"),
Ekimei(kanji: "東銀座", kana: "ひがしぎんざ", romaji: "higashiginza", shozoku: "日比谷線"),
Ekimei(kanji: "築地", kana: "つきじ", romaji: "tsukiji", shozoku: "日比谷線"),
Ekimei(kanji: "八丁堀", kana: "はっちょうぼり", romaji: "hacchobori", shozoku: "日比谷線"),
Ekimei(kanji: "茅場町", kana: "かやばちょう", romaji: "kayabacho", shozoku: "日比谷線"),
Ekimei(kanji: "人形町", kana: "にんぎょうちょう", romaji: "ningyomachi", shozoku: "日比谷線"),
Ekimei(kanji: "小伝馬町", kana: "こでんまちょう", romaji: "kodemmacho", shozoku: "日比谷線"),
Ekimei(kanji: "秋葉原", kana: "あきはばら", romaji: "akihabara", shozoku: "日比谷線"),
Ekimei(kanji: "仲御徒町", kana: "なかおかちまち", romaji: "nakaokachimachi", shozoku: "日比谷線"),
Ekimei(kanji: "上野", kana: "うえの", romaji: "ueno", shozoku: "日比谷線"),
Ekimei(kanji: "入谷", kana: "いりや", romaji: "iriya", shozoku: "日比谷線"),
Ekimei(kanji: "三ノ輪", kana: "みのわ", romaji: "minowa", shozoku: "日比谷線"),
Ekimei(kanji: "南千住", kana: "みなみせんじゅ", romaji: "minamisenju", shozoku: "日比谷線"),
Ekimei(kanji: "北千住", kana: "きたせんじゅ", romaji: "kitasenju", shozoku: "日比谷線"),
Ekimei(kanji: "池袋", kana: "いけぶくろ", romaji: "ikebukuro", shozoku: "丸ノ内線"),
Ekimei(kanji: "新大塚", kana: "しんおおつか", romaji: "shinotsuka", shozoku: "丸ノ内線"),
Ekimei(kanji: "茗荷谷", kana: "みょうがだに", romaji: "myogadani", shozoku: "丸ノ内線"),
Ekimei(kanji: "後楽園", kana: "こうらくえん", romaji: "korakuen", shozoku: "丸ノ内線"),
Ekimei(kanji: "本郷三丁目", kana: "ほんごうさんちょうめ", romaji: "hongosanchome", shozoku: "丸ノ内線"),
Ekimei(kanji: "御茶ノ水", kana: "おちゃのみず", romaji: "ochanomizu", shozoku: "丸ノ内線"),
Ekimei(kanji: "淡路町", kana: "あわじちょう", romaji: "awajicho", shozoku: "丸ノ内線"),
Ekimei(kanji: "大手町", kana: "おおてまち", romaji: "otemachi", shozoku: "丸ノ内線"),
Ekimei(kanji: "東京", kana: "とうきょう", romaji: "tokyo", shozoku: "丸ノ内線"),
Ekimei(kanji: "銀座", kana: "ぎんざ", romaji: "ginza", shozoku: "丸ノ内線"),
Ekimei(kanji: "霞ヶ関", kana: "かすみがせき", romaji: "kasumigaseki", shozoku: "丸ノ内線"),
Ekimei(kanji: "国会議事堂前", kana: "こっかいぎじどうまえ", romaji: "kokkaigijidomae", shozoku: "丸ノ内線"),
Ekimei(kanji: "赤坂見附", kana: "あかさかみつけ", romaji: "akasakamitsuke", shozoku: "丸ノ内線"),
Ekimei(kanji: "四ツ谷", kana: "よつや", romaji: "yotsuya", shozoku: "丸ノ内線"),
Ekimei(kanji: "四谷三丁目", kana: "よつやさんちょうめ", romaji: "yotsuyasanchome", shozoku: "丸ノ内線"),
Ekimei(kanji: "新宿御苑前", kana: "しんじゅくぎょえんまえ", romaji: "shinjuku-gyoemmae", shozoku: "丸ノ内線"),
Ekimei(kanji: "新宿三丁目", kana: "しんじゅくさんちょうめ", romaji: "shinjuku-sanchome", shozoku: "丸ノ内線"),
Ekimei(kanji: "新宿", kana: "しんじゅく", romaji: "shinjuku", shozoku: "丸ノ内線"),
Ekimei(kanji: "西新宿", kana: "にししんじゅく", romaji: "nishi-shinjuku", shozoku: "丸ノ内線"),
Ekimei(kanji: "中野坂上", kana: "なかのさかうえ", romaji: "nakano-sakaue", shozoku: "丸ノ内線"),
Ekimei(kanji: "新中野", kana: "しんなかの", romaji: "shin-nakano", shozoku: "丸ノ内線"),
Ekimei(kanji: "東高円寺", kana: "ひがしこうえんじ", romaji: "higashi-koenji", shozoku: "丸ノ内線"),
Ekimei(kanji: "新高円寺", kana: "しんこうえんじ", romaji: "shin-koenji", shozoku: "丸ノ内線"),
Ekimei(kanji: "南阿佐ヶ谷", kana: "みなみあさがや", romaji: "minami-asagaya", shozoku: "丸ノ内線"),
Ekimei(kanji: "荻窪", kana: "おぎくぼ", romaji: "ogikubo", shozoku: "丸ノ内線"),
Ekimei(kanji: "中野新橋", kana: "なかのしんばし", romaji: "nakano-shimbashi", shozoku: "丸ノ内線"),
Ekimei(kanji: "中野富士見町", kana: "なかのふじみちょう", romaji: "nakano-fujimicho", shozoku: "丸ノ内線"),
Ekimei(kanji: "方南町", kana: "ほうなんちょう", romaji: "honancho", shozoku: "丸ノ内線"),
Ekimei(kanji: "四ツ谷", kana: "よつや", romaji: "yotsuya", shozoku: "南北線"),
Ekimei(kanji: "永田町", kana: "ながたちょう", romaji: "nagatacho", shozoku: "南北線"),
Ekimei(kanji: "溜池山王", kana: "ためいけさんのう", romaji: "tameikesanno", shozoku: "南北線"),
Ekimei(kanji: "六本木一丁目", kana: "ろっぽんぎいっちょうめ", romaji: "roppongiitchome", shozoku: "南北線"),
Ekimei(kanji: "麻布十番", kana: "あざぶじゅうばん", romaji: "azabujuban", shozoku: "南北線"),
Ekimei(kanji: "白金高輪", kana: "しろかねたかなわ", romaji: "shirokanetakanawa", shozoku: "南北線"),
Ekimei(kanji: "白金台", kana: "しろかねだい", romaji: "shirokanedai", shozoku: "南北線"),
Ekimei(kanji: "目黒", kana: "めぐろ", romaji: "meguro", shozoku: "南北線"),
Ekimei(kanji: "市ヶ谷", kana: "いちがや", romaji: "ichigaya", shozoku: "南北線"),
Ekimei(kanji: "飯田橋", kana: "いいだばし", romaji: "idabashi", shozoku: "南北線"),
Ekimei(kanji: "後楽園", kana: "こうらくえん", romaji: "korakuen", shozoku: "南北線"),
Ekimei(kanji: "東大前", kana: "とうだいまえ", romaji: "todaimae", shozoku: "南北線"),
Ekimei(kanji: "本駒込", kana: "ほんこまごめ", romaji: "honkomagome", shozoku: "南北線"),
Ekimei(kanji: "駒込", kana: "こまごめ", romaji: "komagome", shozoku: "南北線"),
Ekimei(kanji: "西ヶ原", kana: "にしがはら", romaji: "nishigahara", shozoku: "南北線"),
Ekimei(kanji: "王子", kana: "おうじ", romaji: "oji", shozoku: "南北線"),
Ekimei(kanji: "王子神谷", kana: "おうじかみや", romaji: "ojikamiya", shozoku: "南北線"),
Ekimei(kanji: "志茂", kana: "しも", romaji: "shimo", shozoku: "南北線"),
Ekimei(kanji: "赤羽岩淵", kana: "あかばねいわぶち", romaji: "akabaneiwabuchi", shozoku: "南北線"),
Ekimei(kanji: "西船橋", kana: "にしふなばし", romaji: "nishi-funabashi", shozoku: "東西線"),
Ekimei(kanji: "原木中山", kana: "ばらきなかやま", romaji: "baraki-nakayama", shozoku: "東西線"),
Ekimei(kanji: "妙典", kana: "みょうでん", romaji: "myoden", shozoku: "東西線"),
Ekimei(kanji: "行徳", kana: "ぎょうとく", romaji: "gyotoku", shozoku: "東西線"),
Ekimei(kanji: "南行徳", kana: "みなみぎょうとく", romaji: "minami-gyotoku", shozoku: "東西線"),
Ekimei(kanji: "浦安", kana: "うらやす", romaji: "urayasu", shozoku: "東西線"),
Ekimei(kanji: "葛西", kana: "かさい", romaji: "kasai", shozoku: "東西線"),
Ekimei(kanji: "西葛西", kana: "にしかさい", romaji: "nishi-kasai", shozoku: "東西線"),
Ekimei(kanji: "南砂町", kana: "みなみすなまち", romaji: "minami-sunamachi", shozoku: "東西線"),
Ekimei(kanji: "東陽町", kana: "とうようちょう", romaji: "touyoucho", shozoku: "東西線"),
Ekimei(kanji: "木場", kana: "きば", romaji: "kiba", shozoku: "東西線"),
Ekimei(kanji: "門前仲町", kana: "もんぜんなかちょう", romaji: "monzen-nakacho", shozoku: "東西線"),
Ekimei(kanji: "茅場町", kana: "かやばちょう", romaji: "kayabacho", shozoku: "東西線"),
Ekimei(kanji: "日本橋", kana: "にほんばし", romaji: "nihonbashi", shozoku: "東西線"),
Ekimei(kanji: "大手町", kana: "おおてまち", romaji: "otemachi", shozoku: "東西線"),
Ekimei(kanji: "竹橋", kana: "たけばし", romaji: "takebashi", shozoku: "東西線"),
Ekimei(kanji: "九段下", kana: "くだんした", romaji: "kudanshita", shozoku: "東西線"),
Ekimei(kanji: "飯田橋", kana: "いいだばし", romaji: "iidabashi", shozoku: "東西線"),
Ekimei(kanji: "神楽坂", kana: "かぐらざか", romaji: "kagurazaka", shozoku: "東西線"),
Ekimei(kanji: "早稲田", kana: "わせだ", romaji: "waseda", shozoku: "東西線"),
Ekimei(kanji: "高田馬場", kana: "たかだのばば", romaji: "takadanobaba", shozoku: "東西線"),
Ekimei(kanji: "落合", kana: "おちあい", romaji: "ochiai", shozoku: "東西線"),
Ekimei(kanji: "中野", kana: "なかの", romaji: "nakano", shozoku: "東西線"),
Ekimei(romaji: "shinkiba", kana: "しんきば", kanji: "新木場", shozoku: "有楽町線"),
Ekimei(romaji: "tatsumi", kana: "たつみ", kanji: "辰巳", shozoku: "有楽町線"),
Ekimei(romaji: "toyosu", kana: "とよす", kanji: "豊洲", shozoku: "有楽町線"),
Ekimei(romaji: "tsukishima", kana: "つきしま", kanji: "月島", shozoku: "有楽町線"),
Ekimei(romaji: "shintomityou", kana: "しんとみちょう", kanji: "新富町", shozoku: "有楽町線"),
Ekimei(romaji: "ginzaittyoume", kana: "ぎんざいっちょうめ", kanji: "銀座一丁目", shozoku: "有楽町線"),
Ekimei(romaji: "yuurakutyou", kana: "ゆうらくちょう", kanji: "有楽町", shozoku: "有楽町線"),
Ekimei(romaji: "sakuradamon", kana: "さくらだもん", kanji: "桜田門", shozoku: "有楽町線"),
Ekimei(romaji: "nagatacho", kana: "ながたちょう", kanji: "永田町", shozoku: "有楽町線"),
Ekimei(romaji: "koujimachi", kana: "こうじまち", kanji: "麹町", shozoku: "有楽町線"),
Ekimei(romaji: "ichigaya", kana: "いちがや", kanji: "市ヶ谷", shozoku: "有楽町線"),
Ekimei(romaji: "iidabashi", kana: "いいだばし", kanji: "飯田橋", shozoku: "有楽町線"),
Ekimei(kanji: "江戸川橋", kana: "えどがわばし", romaji: "edogawabasi", shozoku: "有楽町線"),
Ekimei(kanji: "護国寺", kana: "ごこくじ", romaji: "gokokuji", shozoku: "有楽町線"),
Ekimei(kanji: "東池袋", kana: "ひがしいけぶくろ", romaji: "higasiikebukuro", shozoku: "有楽町線"),
Ekimei(kanji: "池袋", kana: "いけぶくろ", romaji: "ikebukuro", shozoku: "有楽町線"),
Ekimei(kanji: "要町", kana: "かなめちょう", romaji: "kanametyou", shozoku: "有楽町線"),
Ekimei(kanji: "千川", kana: "せんかわ", romaji: "senkawa", shozoku: "有楽町線"),
Ekimei(kanji: "小竹向原", kana: "こたけむかいはら", romaji: "kotakemukaihara", shozoku: "有楽町線"),
Ekimei(kanji: "氷川台", kana: "ひかわだい", romaji: "hikawadai", shozoku: "有楽町線"),
Ekimei(kanji: "平和台", kana: "へいわだい", romaji: "heiwadai", shozoku: "有楽町線"),
Ekimei(kanji: "営団赤塚", kana: "えいだんあかつか", romaji: "eidanakakuka", shozoku: "有楽町線"),
Ekimei(kanji: "営団成増", kana: "えいだんなります", romaji: "eidannarimasu", shozoku: "有楽町線"),
Ekimei(kanji: "和光市", kana: "わこうし", romaji: "wakousi", shozoku: "有楽町線"),
]

let global_ekikan_list = [
Ekikan(kiten: "代々木上原", shuten: "代々木公園", keiyu: "千代田線", kyori: 1.0, jikan: 2),
Ekikan(kiten: "代々木公園", shuten: "明治神宮前", keiyu: "千代田線", kyori: 1.2, jikan: 2),
Ekikan(kiten: "明治神宮前", shuten: "表参道", keiyu: "千代田線", kyori: 0.9, jikan: 2),
Ekikan(kiten: "表参道", shuten: "乃木坂", keiyu: "千代田線", kyori: 1.4, jikan: 3),
Ekikan(kiten: "乃木坂", shuten: "赤坂", keiyu: "千代田線", kyori: 1.1, jikan: 2),
Ekikan(kiten: "赤坂", shuten: "国会議事堂前", keiyu: "千代田線", kyori: 0.8, jikan: 1),
Ekikan(kiten: "国会議事堂前", shuten: "霞ヶ関", keiyu: "千代田線", kyori: 0.7, jikan: 1),
Ekikan(kiten: "霞ヶ関", shuten: "日比谷", keiyu: "千代田線", kyori: 1.2, jikan: 2),
Ekikan(kiten: "日比谷", shuten: "二重橋前", keiyu: "千代田線", kyori: 0.7, jikan: 1),
Ekikan(kiten: "二重橋前", shuten: "大手町", keiyu: "千代田線", kyori: 0.7, jikan: 1),
Ekikan(kiten: "大手町", shuten: "新御茶ノ水", keiyu: "千代田線", kyori: 1.3, jikan: 2),
Ekikan(kiten: "新御茶ノ水", shuten: "湯島", keiyu: "千代田線", kyori: 1.2, jikan: 2),
Ekikan(kiten: "湯島", shuten: "根津", keiyu: "千代田線", kyori: 1.2, jikan: 2),
Ekikan(kiten: "根津", shuten: "千駄木", keiyu: "千代田線", kyori: 1.0, jikan: 2),
Ekikan(kiten: "千駄木", shuten: "西日暮里", keiyu: "千代田線", kyori: 0.9, jikan: 1),
Ekikan(kiten: "西日暮里", shuten: "町屋", keiyu: "千代田線", kyori: 1.7, jikan: 2),
Ekikan(kiten: "町屋", shuten: "北千住", keiyu: "千代田線", kyori: 2.6, jikan: 3),
Ekikan(kiten: "北千住", shuten: "綾瀬", keiyu: "千代田線", kyori: 2.5, jikan: 3),
Ekikan(kiten: "綾瀬", shuten: "北綾瀬", keiyu: "千代田線", kyori: 2.1, jikan: 4),
Ekikan(kiten: "浅草", shuten: "田原町", keiyu: "銀座線", kyori: 0.8, jikan: 2),
Ekikan(kiten: "田原町", shuten: "稲荷町", keiyu: "銀座線", kyori: 0.7, jikan: 1),
Ekikan(kiten: "稲荷町", shuten: "上野", keiyu: "銀座線", kyori: 0.7, jikan: 2),
Ekikan(kiten: "上野", shuten: "上野広小路", keiyu: "銀座線", kyori: 0.5, jikan: 2),
Ekikan(kiten: "上野広小路", shuten: "末広町", keiyu: "銀座線", kyori: 0.6, jikan: 1),
Ekikan(kiten: "末広町", shuten: "神田", keiyu: "銀座線", kyori: 1.1, jikan: 2),
Ekikan(kiten: "神田", shuten: "三越前", keiyu: "銀座線", kyori: 0.7, jikan: 1),
Ekikan(kiten: "三越前", shuten: "日本橋", keiyu: "銀座線", kyori: 0.6, jikan: 2),
Ekikan(kiten: "日本橋", shuten: "京橋", keiyu: "銀座線", kyori: 0.7, jikan: 2),
Ekikan(kiten: "京橋", shuten: "銀座", keiyu: "銀座線", kyori: 0.7, jikan: 1),
Ekikan(kiten: "銀座", shuten: "新橋", keiyu: "銀座線", kyori: 0.9, jikan: 2),
Ekikan(kiten: "新橋", shuten: "虎ノ門", keiyu: "銀座線", kyori: 0.8, jikan: 2),
Ekikan(kiten: "虎ノ門", shuten: "溜池山王", keiyu: "銀座線", kyori: 0.6, jikan: 2),
Ekikan(kiten: "溜池山王", shuten: "赤坂見附", keiyu: "銀座線", kyori: 0.9, jikan: 2),
Ekikan(kiten: "赤坂見附", shuten: "青山一丁目", keiyu: "銀座線", kyori: 1.3, jikan: 2),
Ekikan(kiten: "青山一丁目", shuten: "外苑前", keiyu: "銀座線", kyori: 0.7, jikan: 2),
Ekikan(kiten: "外苑前", shuten: "表参道", keiyu: "銀座線", kyori: 0.7, jikan: 1),
Ekikan(kiten: "表参道", shuten: "渋谷", keiyu: "銀座線", kyori: 1.3, jikan: 1),
Ekikan(kiten: "渋谷", shuten: "表参道", keiyu: "半蔵門線", kyori: 1.3, jikan: 2),
Ekikan(kiten: "表参道", shuten: "青山一丁目", keiyu: "半蔵門線", kyori: 1.4, jikan: 2),
Ekikan(kiten: "青山一丁目", shuten: "永田町", keiyu: "半蔵門線", kyori: 1.3, jikan: 2),
Ekikan(kiten: "永田町", shuten: "半蔵門", keiyu: "半蔵門線", kyori: 1.0, jikan: 2),
Ekikan(kiten: "半蔵門", shuten: "九段下", keiyu: "半蔵門線", kyori: 1.6, jikan: 2),
Ekikan(kiten: "九段下", shuten: "神保町", keiyu: "半蔵門線", kyori: 0.4, jikan: 1),
Ekikan(kiten: "神保町", shuten: "大手町", keiyu: "半蔵門線", kyori: 1.7, jikan: 3),
Ekikan(kiten: "大手町", shuten: "三越前", keiyu: "半蔵門線", kyori: 0.7, jikan: 1),
Ekikan(kiten: "三越前", shuten: "水天宮前", keiyu: "半蔵門線", kyori: 1.3, jikan: 2),
Ekikan(kiten: "水天宮前", shuten: "清澄白河", keiyu: "半蔵門線", kyori: 1.7, jikan: 3),
Ekikan(kiten: "清澄白河", shuten: "住吉", keiyu: "半蔵門線", kyori: 1.9, jikan: 3),
Ekikan(kiten: "住吉", shuten: "錦糸町", keiyu: "半蔵門線", kyori: 1.0, jikan: 2),
Ekikan(kiten: "錦糸町", shuten: "押上", keiyu: "半蔵門線", kyori: 1.4, jikan: 2),
Ekikan(kiten: "中目黒", shuten: "恵比寿", keiyu: "日比谷線", kyori: 1.0, jikan: 2),
Ekikan(kiten: "恵比寿", shuten: "広尾", keiyu: "日比谷線", kyori: 1.5, jikan: 3),
Ekikan(kiten: "広尾", shuten: "六本木", keiyu: "日比谷線", kyori: 1.7, jikan: 3),
Ekikan(kiten: "六本木", shuten: "神谷町", keiyu: "日比谷線", kyori: 1.5, jikan: 3),
Ekikan(kiten: "神谷町", shuten: "霞ヶ関", keiyu: "日比谷線", kyori: 1.3, jikan: 2),
Ekikan(kiten: "霞ヶ関", shuten: "日比谷", keiyu: "日比谷線", kyori: 1.2, jikan: 2),
Ekikan(kiten: "日比谷", shuten: "銀座", keiyu: "日比谷線", kyori: 0.4, jikan: 1),
Ekikan(kiten: "銀座", shuten: "東銀座", keiyu: "日比谷線", kyori: 0.4, jikan: 1),
Ekikan(kiten: "東銀座", shuten: "築地", keiyu: "日比谷線", kyori: 0.6, jikan: 2),
Ekikan(kiten: "築地", shuten: "八丁堀", keiyu: "日比谷線", kyori: 1.0, jikan: 2),
Ekikan(kiten: "八丁堀", shuten: "茅場町", keiyu: "日比谷線", kyori: 0.5, jikan: 1),
Ekikan(kiten: "茅場町", shuten: "人形町", keiyu: "日比谷線", kyori: 0.9, jikan: 2),
Ekikan(kiten: "人形町", shuten: "小伝馬町", keiyu: "日比谷線", kyori: 0.6, jikan: 1),
Ekikan(kiten: "小伝馬町", shuten: "秋葉原", keiyu: "日比谷線", kyori: 0.9, jikan: 2),
Ekikan(kiten: "秋葉原", shuten: "仲御徒町", keiyu: "日比谷線", kyori: 1.0, jikan: 1),
Ekikan(kiten: "仲御徒町", shuten: "上野", keiyu: "日比谷線", kyori: 0.5, jikan: 1),
Ekikan(kiten: "上野", shuten: "入谷", keiyu: "日比谷線", kyori: 1.2, jikan: 2),
Ekikan(kiten: "入谷", shuten: "三ノ輪", keiyu: "日比谷線", kyori: 1.2, jikan: 2),
Ekikan(kiten: "三ノ輪", shuten: "南千住", keiyu: "日比谷線", kyori: 0.8, jikan: 2),
Ekikan(kiten: "南千住", shuten: "北千住", keiyu: "日比谷線", kyori: 1.8, jikan: 3),
Ekikan(kiten: "池袋", shuten: "新大塚", keiyu: "丸ノ内線", kyori: 1.8, jikan: 3),
Ekikan(kiten: "新大塚", shuten: "茗荷谷", keiyu: "丸ノ内線", kyori: 1.2, jikan: 2),
Ekikan(kiten: "茗荷谷", shuten: "後楽園", keiyu: "丸ノ内線", kyori: 1.8, jikan: 2),
Ekikan(kiten: "後楽園", shuten: "本郷三丁目", keiyu: "丸ノ内線", kyori: 0.8, jikan: 1),
Ekikan(kiten: "本郷三丁目", shuten: "御茶ノ水", keiyu: "丸ノ内線", kyori: 0.8, jikan: 1),
Ekikan(kiten: "御茶ノ水", shuten: "淡路町", keiyu: "丸ノ内線", kyori: 0.8, jikan: 1),
Ekikan(kiten: "淡路町", shuten: "大手町", keiyu: "丸ノ内線", kyori: 0.9, jikan: 2),
Ekikan(kiten: "大手町", shuten: "東京", keiyu: "丸ノ内線", kyori: 0.6, jikan: 1),
Ekikan(kiten: "東京", shuten: "銀座", keiyu: "丸ノ内線", kyori: 1.1, jikan: 2),
Ekikan(kiten: "銀座", shuten: "霞ヶ関", keiyu: "丸ノ内線", kyori: 1.0, jikan: 2),
Ekikan(kiten: "霞ヶ関", shuten: "国会議事堂前", keiyu: "丸ノ内線", kyori: 0.7, jikan: 1),
Ekikan(kiten: "国会議事堂前", shuten: "赤坂見附", keiyu: "丸ノ内線", kyori: 0.9, jikan: 2),
Ekikan(kiten: "赤坂見附", shuten: "四ツ谷", keiyu: "丸ノ内線", kyori: 1.3, jikan: 2),
Ekikan(kiten: "四ツ谷", shuten: "四谷三丁目", keiyu: "丸ノ内線", kyori: 1.0, jikan: 2),
Ekikan(kiten: "四谷三丁目", shuten: "新宿御苑前", keiyu: "丸ノ内線", kyori: 0.9, jikan: 1),
Ekikan(kiten: "新宿御苑前", shuten: "新宿三丁目", keiyu: "丸ノ内線", kyori: 0.7, jikan: 1),
Ekikan(kiten: "新宿三丁目", shuten: "新宿", keiyu: "丸ノ内線", kyori: 0.3, jikan: 1),
Ekikan(kiten: "新宿", shuten: "西新宿", keiyu: "丸ノ内線", kyori: 0.8, jikan: 1),
Ekikan(kiten: "西新宿", shuten: "中野坂上", keiyu: "丸ノ内線", kyori: 1.1, jikan: 2),
Ekikan(kiten: "中野坂上", shuten: "新中野", keiyu: "丸ノ内線", kyori: 1.1, jikan: 2),
Ekikan(kiten: "新中野", shuten: "東高円寺", keiyu: "丸ノ内線", kyori: 1.0, jikan: 1),
Ekikan(kiten: "東高円寺", shuten: "新高円寺", keiyu: "丸ノ内線", kyori: 0.9, jikan: 1),
Ekikan(kiten: "新高円寺", shuten: "南阿佐ヶ谷", keiyu: "丸ノ内線", kyori: 1.2, jikan: 2),
Ekikan(kiten: "南阿佐ヶ谷", shuten: "荻窪", keiyu: "丸ノ内線", kyori: 1.5, jikan: 2),
Ekikan(kiten: "中野坂上", shuten: "中野新橋", keiyu: "丸ノ内線", kyori: 1.3, jikan: 2),
Ekikan(kiten: "中野新橋", shuten: "中野富士見町", keiyu: "丸ノ内線", kyori: 0.6, jikan: 1),
Ekikan(kiten: "中野富士見町", shuten: "方南町", keiyu: "丸ノ内線", kyori: 1.3, jikan: 2),
Ekikan(kiten: "市ヶ谷", shuten: "四ツ谷", keiyu: "南北線", kyori: 1.0, jikan: 2),
Ekikan(kiten: "四ツ谷", shuten: "永田町", keiyu: "南北線", kyori: 1.3, jikan: 3),
Ekikan(kiten: "永田町", shuten: "溜池山王", keiyu: "南北線", kyori: 0.9, jikan: 1),
Ekikan(kiten: "溜池山王", shuten: "六本木一丁目", keiyu: "南北線", kyori: 0.9, jikan: 2),
Ekikan(kiten: "六本木一丁目", shuten: "麻布十番", keiyu: "南北線", kyori: 1.2, jikan: 2),
Ekikan(kiten: "麻布十番", shuten: "白金高輪", keiyu: "南北線", kyori: 1.3, jikan: 2),
Ekikan(kiten: "白金高輪", shuten: "白金台", keiyu: "南北線", kyori: 1.0, jikan: 2),
Ekikan(kiten: "白金台", shuten: "目黒", keiyu: "南北線", kyori: 1.3, jikan: 2),
Ekikan(kiten: "市ヶ谷", shuten: "飯田橋", keiyu: "南北線", kyori: 1.1 , jikan: 2),
Ekikan(kiten: "飯田橋", shuten: "後楽園", keiyu: "南北線", kyori: 1.4 , jikan: 2),
Ekikan(kiten: "後楽園", shuten: "東大前", keiyu: "南北線", kyori: 1.3 , jikan: 3),
Ekikan(kiten: "東大前", shuten: "本駒込", keiyu: "南北線", kyori: 0.9 , jikan: 2),
Ekikan(kiten: "本駒込", shuten: "駒込", keiyu: "南北線", kyori: 1.4, jikan: 2),
Ekikan(kiten: "駒込", shuten: "西ヶ原", keiyu: "南北線", kyori: 1.4, jikan: 2),
Ekikan(kiten: "西ヶ原", shuten: "王子", keiyu: "南北線", kyori: 1.0, jikan: 2),
Ekikan(kiten: "王子", shuten: "王子神谷", keiyu: "南北線", kyori: 1.2, jikan: 2),
Ekikan(kiten: "王子神谷", shuten: "志茂", keiyu: "南北線", kyori: 1.6, jikan: 3),
Ekikan(kiten: "志茂", shuten: "赤羽岩淵", keiyu: "南北線", kyori: 1.1, jikan: 2),
Ekikan(kiten: "西船橋" , shuten: "原木中山", keiyu: "東西線", kyori: 1.9, jikan: 3),
Ekikan(kiten: "原木中山", shuten: "妙典", keiyu: "東西線", kyori: 2.1 , jikan: 2),
Ekikan(kiten: "妙典", shuten: "行徳", keiyu: "東西線", kyori: 1.3 , jikan: 2),
Ekikan(kiten: "行徳", shuten: "南行徳", keiyu: "東西線", kyori: 1.5 , jikan: 2),
Ekikan(kiten: "南行徳", shuten: "浦安" , keiyu: "東西線", kyori: 1.2 , jikan: 2),
Ekikan(kiten: "浦安" , shuten: "葛西", keiyu: "東西線", kyori: 1.9 , jikan: 2),
Ekikan(kiten: "葛西", shuten: "西葛西", keiyu: "東西線", kyori: 1.2 , jikan: 2),
Ekikan(kiten: "西葛西", shuten: "南砂町", keiyu: "東西線", kyori: 2.7 , jikan: 2),
Ekikan(kiten: "南砂町", shuten: "東陽町", keiyu: "東西線", kyori: 1.2 , jikan: 2),
Ekikan(kiten: "東陽町", shuten: "木場" , keiyu: "東西線", kyori: 0.9 , jikan: 1),
Ekikan(kiten: "木場", shuten: "門前仲町", keiyu: "東西線", kyori: 1.1 , jikan: 1),
Ekikan(kiten: "門前仲町", shuten: "茅場町", keiyu: "東西線", kyori: 1.8 , jikan: 2),
Ekikan(kiten: "茅場町", shuten: "日本橋", keiyu: "東西線", kyori: 0.5 , jikan: 1),
Ekikan(kiten: "日本橋", shuten: "大手町", keiyu: "東西線", kyori: 0.8 , jikan: 1),
Ekikan(kiten: "大手町", shuten: "竹橋", keiyu: "東西線", kyori: 1.0, jikan: 2),
Ekikan(kiten: "竹橋", shuten: "九段下", keiyu: "東西線", kyori: 1.0, jikan: 1),
Ekikan(kiten: "九段下", shuten: "飯田橋", keiyu: "東西線", kyori: 0.7, jikan: 1),
Ekikan(kiten: "飯田橋", shuten: "神楽坂", keiyu: "東西線", kyori: 1.2, jikan: 2),
Ekikan(kiten: "神楽坂", shuten: "早稲田", keiyu: "東西線", kyori: 1.2, jikan: 2),
Ekikan(kiten: "早稲田", shuten: "高田馬場", keiyu: "東西線", kyori: 1.7, jikan: 3),
Ekikan(kiten: "高田馬場", shuten: "落合", keiyu: "東西線", kyori: 1.9, jikan: 3),
Ekikan(kiten: "落合", shuten: "中野", keiyu: "東西線", kyori: 2.0, jikan: 3),
Ekikan(kiten: "新木場", shuten: "辰巳", keiyu: "有楽町線", kyori: 1.5, jikan: 2),
Ekikan(kiten: "辰巳", shuten: "豊洲", keiyu: "有楽町線", kyori: 1.7, jikan: 2),
Ekikan(kiten: "豊洲", shuten: "月島", keiyu: "有楽町線", kyori: 1.4, jikan: 2),
Ekikan(kiten: "月島", shuten: "新富町", keiyu: "有楽町線", kyori: 1.3, jikan: 2),
Ekikan(kiten: "新富町", shuten: "銀座一丁目", keiyu: "有楽町線", kyori: 0.7, jikan: 1),
Ekikan(kiten: "銀座一丁目", shuten: "有楽町", keiyu: "有楽町線", kyori: 0.5, jikan: 1),
Ekikan(kiten: "有楽町", shuten: "桜田門", keiyu: "有楽町線", kyori: 1.0, jikan: 1),
Ekikan(kiten: "桜田門", shuten: "永田町", keiyu: "有楽町線", kyori: 0.9, jikan: 2),
Ekikan(kiten: "永田町", shuten: "麹町", keiyu: "有楽町線", kyori: 0.9, jikan: 1),
Ekikan(kiten: "麹町", shuten: "市ヶ谷", keiyu: "有楽町線", kyori: 0.9, jikan: 1),
Ekikan(kiten: "市ヶ谷", shuten: "飯田橋", keiyu: "有楽町線", kyori: 1.1, jikan: 2),
Ekikan(kiten: "飯田橋", shuten: "江戸川橋", keiyu: "有楽町線", kyori: 1.6, jikan: 3),
Ekikan(kiten: "江戸川橋", shuten: "護国寺", keiyu: "有楽町線", kyori: 1.3, jikan: 2),
Ekikan(kiten: "護国寺", shuten: "東池袋", keiyu: "有楽町線", kyori: 1.1, jikan: 2),
Ekikan(kiten: "東池袋", shuten: "池袋", keiyu: "有楽町線", kyori: 2.0, jikan: 2),
Ekikan(kiten: "池袋", shuten: "要町", keiyu: "有楽町線", kyori: 1.2, jikan: 2),
Ekikan(kiten: "要町", shuten: "千川", keiyu: "有楽町線", kyori: 1.0, jikan: 1),
Ekikan(kiten: "千川", shuten: "小竹向原", keiyu: "有楽町線", kyori: 1.0, jikan: 2),
Ekikan(kiten: "小竹向原", shuten: "氷川台", keiyu: "有楽町線", kyori: 1.5, jikan: 2),
Ekikan(kiten: "氷川台", shuten: "平和台", keiyu: "有楽町線", kyori: 1.4, jikan: 2),
Ekikan(kiten: "平和台", shuten: "営団赤塚", keiyu: "有楽町線", kyori: 1.8, jikan: 2),
Ekikan(kiten: "営団赤塚", shuten: "営団成増", keiyu: "有楽町線", kyori: 1.5, jikan: 2),
Ekikan(kiten: "営団成増", shuten: "和光市", keiyu: "有楽町線", kyori: 2.1, jikan: 3),
]


struct Gakusei: Equatable {
    let name: String
    let tensuu: Int
}

struct Person: Equatable {
    let name: String
    let height: Int
    let weight: Int
    let dateOfBirth: String
    let bloodType: String
}

class Chapter10 {
    // 問題 10.12
    func kyoriWoHyoji(ekimeiRomaji1: String, ekimeiRomaji2: String) -> String {
        guard let ekimeiKanji1 = romajiToKanji(romaji: ekimeiRomaji1, lst: global_ekimei_list) else {
            return "\(ekimeiRomaji1)という駅は存在しません"
        }

        guard let ekimeiKanji2 = romajiToKanji(romaji: ekimeiRomaji2, lst: global_ekimei_list) else {
            return "\(ekimeiRomaji2)という駅は存在しません"
        }

        guard let ekikanKyori = getEkikanKyori(ekimeiKanji1: ekimeiKanji1, ekimeiKanji2: ekimeiKanji2, lst: global_ekikan_list) else {
            return "\(ekimeiKanji1)駅と\(ekimeiKanji2)駅はつながっていません"
        }

        return "\(ekimeiKanji1)駅から\(ekimeiKanji2)駅までは\(ekikanKyori)kmです"
    }

    // 問題 10.11
    func getEkikanKyori(ekimeiKanji1: String, ekimeiKanji2: String, lst: [Ekikan]) -> Float? {
        guard lst.count > 0 else {
            return nil
        }

        var copiedLst = lst
        if let ekikan = copiedLst.popLast(),
           ekikan.kiten == ekimeiKanji1 && ekikan.shuten == ekimeiKanji2
            || ekikan.shuten == ekimeiKanji1 && ekikan.kiten == ekimeiKanji2
        {
            return ekikan.kyori
        }

        return getEkikanKyori(ekimeiKanji1: ekimeiKanji1, ekimeiKanji2: ekimeiKanji2, lst: copiedLst)
    }

    // 問題 10.10
    func romajiToKanji(romaji: String, lst: [Ekimei]) -> String? {
        guard lst.count > 0 else {
            return nil
        }

        var copiedLst = lst
        if let ekimei = copiedLst.popLast(),
           ekimei.romaji == romaji {
            return ekimei.kanji
        }

        return romajiToKanji(romaji: romaji, lst: copiedLst)
    }

    // 問題 10.9
    func equalLength(lst1: [Int], lst2: [Int]) -> Bool {
        var copiedLst1 = lst1
        var copiedLst2 = lst2
        let lst1Value = copiedLst1.popLast()
        let lst2Value = copiedLst2.popLast()

        if lst1Value == nil && lst2Value == nil {
            return true
        } else if lst1Value != nil && lst2Value != nil {
            return equalLength(lst1: copiedLst1, lst2: copiedLst2)
        }

        return false
    }

    // 問題 10.8
    func saitaKetsueki(lst: [Person], resultLst: [String: Int] = ["A": 0, "B": 0, "AB": 0, "O": 0]) -> String {
        let syukeiList = ketsuekiSyukei(lst: lst)
        return ketsuekiSyukeiMax(lst: syukeiList)
    }

    func ketsuekiSyukeiMax(lst: [String: Int], result: String = "", nextKey: String? = "A") -> String {
        guard let nextKey = nextKey else {
            return result
        }

        var maxResult = nextKey
        if result.count > 0 {
            maxResult = lst[result]! > lst[nextKey]! ? result : nextKey
        }

        let newNextKey: String?
        switch nextKey {
        case "A":
            newNextKey = "B"
        case "B":
            newNextKey = "AB"
        case "AB":
            newNextKey = "O"
        default:
            newNextKey = nil
        }

        return ketsuekiSyukeiMax(lst: lst, result: maxResult, nextKey: newNextKey)
    }

    // 問題 10.7
    func ketsuekiSyukei(lst: [Person], resultLst: [String: Int] = ["A": 0, "B": 0, "AB": 0, "O": 0]) -> [String: Int] {
        guard lst.count > 0 else {
            return resultLst
        }

        var copiedResultLst = resultLst
        var copiedLst = ArraySlice(lst)
        let firstPerson = copiedLst.popFirst()!

        copiedResultLst[firstPerson.bloodType] = copiedResultLst[firstPerson.bloodType]! + 1

        return ketsuekiSyukei(lst: Array(copiedLst), resultLst: copiedResultLst)
    }

    // 問題 10.5
    func gakuseiMax(lst: [Gakusei], gakuseiResult: Gakusei? = nil) -> Gakusei? {
        guard lst.count > 0 else {
            return gakuseiResult
        }

        var copiedLst = ArraySlice(lst)
        let fitstGakusei = copiedLst.popFirst()!
        var maxGakusei = fitstGakusei

        if let gakuseiResult = gakuseiResult, gakuseiResult.tensuu >= fitstGakusei.tensuu {
            maxGakusei = gakuseiResult
        }

        return gakuseiMax(lst: Array(copiedLst), gakuseiResult: maxGakusei)
    }

    // 問題 10.4
    func personSort(lst: [Person], resultLst: [Person] = []) -> [Person] {
        guard lst.count > 0 else {
            return resultLst
        }

        var copiedLst = ArraySlice(lst)
        let firstPerson = copiedLst.popFirst()!
        return personSort(lst: Array(copiedLst), resultLst: personInsert(lst: resultLst, addPerson: firstPerson))
    }

    func personInsert(lst: [Person], addPerson: Person, cursor: Int = 0) -> [Person] {
        if lst.count == 0 {
            return [addPerson]
        }

        if lst[cursor].name == addPerson.name {
            return lst
        }

        if lst[cursor].name > addPerson.name {
            var copiedLst = lst
            copiedLst.insert(addPerson, at: cursor)
            return copiedLst
        }

        if lst[cursor].name < addPerson.name {
            var copiedLst = lst
            guard lst.count > cursor + 1 else {
                copiedLst.append(addPerson)
                return copiedLst
            }

            if lst[cursor + 1].name > addPerson.name {
                copiedLst.insert(addPerson, at: cursor + 1)
                return copiedLst
            }
        }

        return personInsert(lst: lst, addPerson: addPerson, cursor: cursor + 1)
    }

    // 問題 10.3
    func gakuseiSort(lst: [Gakusei], resultLst: [Gakusei] = []) -> [Gakusei] {
        guard lst.count > 0 else {
            return resultLst.reversed()
        }

        var copiedLst = ArraySlice(lst)
        let firstGakusei = copiedLst.popFirst()!
        return gakuseiSort(lst: Array(copiedLst), resultLst: gakuseiInsert(lst: resultLst, addGakusei: firstGakusei))
    }

    func gakuseiInsert(lst: [Gakusei], addGakusei: Gakusei, cursor: Int = 0) -> [Gakusei] {
        if lst.count == 0 {
            return [addGakusei]
        }

        if lst[cursor].tensuu == addGakusei.tensuu {
            return lst
        }

        if lst[cursor].tensuu > addGakusei.tensuu {
            var copiedLst = lst
            copiedLst.insert(addGakusei, at: cursor)
            return copiedLst
        }

        if lst[cursor].tensuu < addGakusei.tensuu {
            var copiedLst = lst
            guard lst.count > cursor + 1 else {
                copiedLst.append(addGakusei)
                return copiedLst
            }

            if lst[cursor + 1].tensuu > addGakusei.tensuu {
                copiedLst.insert(addGakusei, at: cursor + 1)
                return copiedLst
            }
        }

        return gakuseiInsert(lst: lst, addGakusei: addGakusei, cursor: cursor + 1)
    }

    // 問題 10.2
    func insSort(lst: [Int], resultLst: [Int] = []) -> [Int] {
        guard lst.count > 0 else {
            return resultLst
        }

        var copiedLst = ArraySlice(lst)
        let firstNum = copiedLst.popFirst()!
        return insSort(lst: Array(copiedLst), resultLst: insert(lst: resultLst, addNumber: firstNum))
    }

    // 問題 10.1
    func insert(lst: [Int], addNumber: Int, cursor: Int = 0) -> [Int] {
        if lst.count == 0 {
            return [addNumber]
        }

        if lst[cursor] == addNumber {
            return lst
        }

        if lst[cursor] > addNumber {
            var copiedLst = lst
            copiedLst.insert(addNumber, at: cursor)
            return copiedLst
        }

        if lst[cursor] < addNumber {
            var copiedLst = lst
            guard lst.count > cursor + 1 else {
                copiedLst.append(addNumber)
                return copiedLst
            }

            if lst[cursor + 1] > addNumber {
                copiedLst.insert(addNumber, at: cursor + 1)
                return copiedLst
            }
        }

        return insert(lst: lst, addNumber: addNumber, cursor: cursor + 1)
    }
}

let chapter10 = Chapter10()
chapter10.insert(lst: [1,3,4,7,8], addNumber: 5)

class Chapter10Test: XCTestCase {
    func testKyoriWoHyoji() {
        let chapter10 = Chapter10()

        XCTAssertEqual(chapter10.kyoriWoHyoji(ekimeiRomaji1: "eidannarimasu", ekimeiRomaji2: "wakousi"), "営団成増駅から和光市駅までは2.1kmです")
        XCTAssertEqual(chapter10.kyoriWoHyoji(ekimeiRomaji1: "wakousi", ekimeiRomaji2: "eidannarimasu"), "和光市駅から営団成増駅までは2.1kmです")
        XCTAssertEqual(chapter10.kyoriWoHyoji(ekimeiRomaji1: "roppongi", ekimeiRomaji2: "yoyogikouen"), "六本木駅と代々木公園駅はつながっていません")
        XCTAssertEqual(chapter10.kyoriWoHyoji(ekimeiRomaji1: "yoyogikouen", ekimeiRomaji2: "roppongi"), "代々木公園駅と六本木駅はつながっていません")
        XCTAssertEqual(chapter10.kyoriWoHyoji(ekimeiRomaji1: "yoyogikouenn", ekimeiRomaji2: "wakousi"), "yoyogikouennという駅は存在しません")
        XCTAssertEqual(chapter10.kyoriWoHyoji(ekimeiRomaji1: "yoyogikouen", ekimeiRomaji2: "wakou"), "wakouという駅は存在しません")
    }

    func testGetEkikanKyori() {
        let chapter10 = Chapter10()

        XCTAssertEqual(chapter10.getEkikanKyori(ekimeiKanji1: "営団成増", ekimeiKanji2: "和光市", lst: global_ekikan_list), 2.1)
        XCTAssertEqual(chapter10.getEkikanKyori(ekimeiKanji1: "和光市", ekimeiKanji2: "営団成増", lst: global_ekikan_list), 2.1)
        XCTAssertEqual(chapter10.getEkikanKyori(ekimeiKanji1: "六本木", ekimeiKanji2: "神谷町", lst: global_ekikan_list), 1.5)
        XCTAssertEqual(chapter10.getEkikanKyori(ekimeiKanji1: "神谷町", ekimeiKanji2: "六本木", lst: global_ekikan_list), 1.5)
        XCTAssertEqual(chapter10.getEkikanKyori(ekimeiKanji1: "代々木上原", ekimeiKanji2: "代々木公園", lst: global_ekikan_list), 1)
        XCTAssertEqual(chapter10.getEkikanKyori(ekimeiKanji1: "代々木公園", ekimeiKanji2: "代々木上原", lst: global_ekikan_list), 1)
        XCTAssertEqual(chapter10.getEkikanKyori(ekimeiKanji1: "代々木公", ekimeiKanji2: "代々木上原", lst: global_ekikan_list), nil)
        XCTAssertEqual(chapter10.getEkikanKyori(ekimeiKanji1: "代々木公園", ekimeiKanji2: "代々木上", lst: global_ekikan_list), nil)
    }

    func testRomajiToKanji() {
        let chapter10 = Chapter10()

        XCTAssertEqual(chapter10.romajiToKanji(romaji: "yoyogiuehara", lst: global_ekimei_list), "代々木上原")
        XCTAssertEqual(chapter10.romajiToKanji(romaji: "wakousi", lst: global_ekimei_list), "和光市")
        XCTAssertEqual(chapter10.romajiToKanji(romaji: "sendagi", lst: global_ekimei_list), "千駄木")
        XCTAssertEqual(chapter10.romajiToKanji(romaji: "sendagii", lst: global_ekimei_list), nil)
    }

    func testEqualLength() {
        let chapter10 = Chapter10()

        XCTAssertTrue(chapter10.equalLength(lst1: [1,2,3], lst2: [4,5,6]))
        XCTAssertTrue(chapter10.equalLength(lst1: [], lst2: []))
        XCTAssertFalse(chapter10.equalLength(lst1: [1,2,3], lst2: [4,5]))
        XCTAssertFalse(chapter10.equalLength(lst1: [], lst2: [4,5]))
        XCTAssertTrue(chapter10.equalLength(lst1: [1,2,3,4,5,6,7,8,9,10,12,100,1000], lst2: [6,6,6,6,6,6,6,6,6,6,6,6,100000]))
    }

    func testSaitaKetsueki() {
        let chapter10 = Chapter10()

        let person1 = Person(name: "あけちみつひで", height: 181, weight: 83, dateOfBirth: "19501123", bloodType: "A")
        let person2 = Person(name: "かとうきよまさ", height: 165, weight: 63, dateOfBirth: "19451010", bloodType: "A")
        let person3 = Person(name: "さいとうどうさん", height: 181, weight: 83, dateOfBirth: "19560923", bloodType: "A")
        let person4 = Person(name: "すずきいちろ", height: 160, weight: 65, dateOfBirth: "19800301", bloodType: "B")
        let person5 = Person(name: "すずきいちろう", height: 175, weight: 70, dateOfBirth: "19781213", bloodType: "AB")
        let person6 = Person(name: "ほうじょうたかうじ", height: 174, weight: 71, dateOfBirth: "19600228", bloodType: "O")
        let person7 = Person(name: "もうりもとなり", height: 179, weight: 74, dateOfBirth: "19621030", bloodType: "O")

        var lst = [
            person1, person2, person3, person4, person5, person6, person7
        ]
        XCTAssertEqual(chapter10.saitaKetsueki(lst: lst), "A")


        lst = [
            person1, person4, person5, person6
        ]
        // 今のところ結果が同じ時は最後の値を返す。
        XCTAssertEqual(chapter10.saitaKetsueki(lst: lst), "O")

        lst = [
            person5
        ]
        XCTAssertEqual(chapter10.saitaKetsueki(lst: lst), "AB")
    }

    func testKetsuekiSyukei() {
        let chapter10 = Chapter10()

        let person1 = Person(name: "あけちみつひで", height: 181, weight: 83, dateOfBirth: "19501123", bloodType: "A")
        let person2 = Person(name: "かとうきよまさ", height: 165, weight: 63, dateOfBirth: "19451010", bloodType: "A")
        let person3 = Person(name: "さいとうどうさん", height: 181, weight: 83, dateOfBirth: "19560923", bloodType: "A")
        let person4 = Person(name: "すずきいちろ", height: 160, weight: 65, dateOfBirth: "19800301", bloodType: "B")
        let person5 = Person(name: "すずきいちろう", height: 175, weight: 70, dateOfBirth: "19781213", bloodType: "AB")
        let person6 = Person(name: "ほうじょうたかうじ", height: 174, weight: 71, dateOfBirth: "19600228", bloodType: "O")
        let person7 = Person(name: "もうりもとなり", height: 179, weight: 74, dateOfBirth: "19621030", bloodType: "O")

        var lst = [
            person1, person2, person3, person4, person5, person6, person7
        ]
        var result = chapter10.ketsuekiSyukei(lst: lst)
        XCTAssertEqual(result["A"], 3)
        XCTAssertEqual(result["B"], 1)
        XCTAssertEqual(result["AB"], 1)
        XCTAssertEqual(result["O"], 2)

        lst = [
            person1, person4, person5, person6
        ]
        result = chapter10.ketsuekiSyukei(lst: lst)
        XCTAssertEqual(result["A"], 1)
        XCTAssertEqual(result["B"], 1)
        XCTAssertEqual(result["AB"], 1)
        XCTAssertEqual(result["O"], 1)

        lst = [
            person1, person4, person6
        ]
        result = chapter10.ketsuekiSyukei(lst: lst)
        XCTAssertEqual(result["A"], 1)
        XCTAssertEqual(result["B"], 1)
        XCTAssertEqual(result["AB"], 0)
        XCTAssertEqual(result["O"], 1)
    }

    func testGakuseiMax() {
        let chapter10 = Chapter10()

        let gakusei1 = Gakusei(name: "テスト一郎", tensuu: 50)
        let gakusei2 = Gakusei(name: "テスト次郎", tensuu: 80)
        let gakusei3 = Gakusei(name: "テスト三郎", tensuu: 0)
        let gakusei4 = Gakusei(name: "テスト四郎", tensuu: 100)

        XCTAssertEqual(chapter10.gakuseiMax(lst: [gakusei1, gakusei2, gakusei3, gakusei4]), gakusei4)
        XCTAssertEqual(chapter10.gakuseiMax(lst: [gakusei3]), gakusei3)
        XCTAssertEqual(chapter10.gakuseiMax(lst: [gakusei4, gakusei3]), gakusei4)
        XCTAssertEqual(chapter10.gakuseiMax(lst: []), nil)
    }

    func testPersonSort() {
        let chapter10 = Chapter10()

        let person1 = Person(name: "あけちみつひで", height: 181, weight: 83, dateOfBirth: "19501123", bloodType: "A")
        let person2 = Person(name: "すずきいちろ", height: 160, weight: 65, dateOfBirth: "19800301", bloodType: "B")
        let person3 = Person(name: "すずきいちろう", height: 175, weight: 70, dateOfBirth: "19781213", bloodType: "AB")
        let person4 = Person(name: "もうりもとなり", height: 179, weight: 74, dateOfBirth: "19621030", bloodType: "O")

        var lst = [
            person3, person1
        ]
        var expectedLst = [
            person1, person3
        ]
        XCTAssertEqual(chapter10.personSort(lst: lst), expectedLst)

        lst = [
            person2, person4, person1, person3
        ]
        expectedLst = [
            person1, person2, person3, person4
        ]
        XCTAssertEqual(chapter10.personSort(lst: lst), expectedLst)

        lst = [
            person3
        ]
        expectedLst = [
            person3
        ]
        XCTAssertEqual(chapter10.personSort(lst: lst), expectedLst)
    }

    func testPersonInsert() {
        let chapter10 = Chapter10()

        let person1 = Person(name: "あけちみつひで", height: 181, weight: 83, dateOfBirth: "19501123", bloodType: "A")
        let person2 = Person(name: "すずきいちろ", height: 160, weight: 65, dateOfBirth: "19800301", bloodType: "B")
        let person3 = Person(name: "すずきいちろう", height: 175, weight: 70, dateOfBirth: "19781213", bloodType: "AB")
        let person4 = Person(name: "もうりもとなり", height: 179, weight: 74, dateOfBirth: "19621030", bloodType: "O")

        var lst = [
            person1, person2
        ]
        var expectedLst = [
            person1, person2, person3
        ]
        XCTAssertEqual(chapter10.personInsert(lst: lst, addPerson: person3), expectedLst)

        lst = [
            person2, person3, person4
        ]
        expectedLst = [
            person1, person2, person3, person4
        ]
        XCTAssertEqual(chapter10.personInsert(lst: lst, addPerson: person1), expectedLst)

        lst = [
        ]
        expectedLst = [
            person3
        ]
        XCTAssertEqual(chapter10.personInsert(lst: lst, addPerson: person3), expectedLst)
    }

    func testGakuseiSort() {
        let chapter10 = Chapter10()

        let gakusei1 = Gakusei(name: "テスト一郎", tensuu: 50)
        let gakusei2 = Gakusei(name: "テスト次郎", tensuu: 80)
        let gakusei3 = Gakusei(name: "テスト三郎", tensuu: 0)
        let gakusei4 = Gakusei(name: "テスト四郎", tensuu: 100)

        var lst = [
            gakusei3, gakusei1
        ]
        var expectedLst = [
            gakusei1, gakusei3
        ]
        XCTAssertEqual(chapter10.gakuseiSort(lst: lst), expectedLst)

        lst = [
            gakusei2, gakusei4, gakusei1, gakusei3
        ]
        expectedLst = [
            gakusei4, gakusei2, gakusei1, gakusei3
        ]
        XCTAssertEqual(chapter10.gakuseiSort(lst: lst), expectedLst)

        lst = [
            gakusei3
        ]
        expectedLst = [
            gakusei3
        ]
        XCTAssertEqual(chapter10.gakuseiSort(lst: lst), expectedLst)
    }

    func testGakuseiInsert() {
        let chapter10 = Chapter10()

        let gakusei1 = Gakusei(name: "テスト一郎", tensuu: 0)
        let gakusei2 = Gakusei(name: "テスト次郎", tensuu: 55)
        let gakusei3 = Gakusei(name: "テスト三郎", tensuu: 82)
        let gakusei4 = Gakusei(name: "テスト四郎", tensuu: 100)

        var lst = [
            gakusei1, gakusei2
        ]
        var expectedLst = [
            gakusei1, gakusei2, gakusei3
        ]
        XCTAssertEqual(chapter10.gakuseiInsert(lst: lst, addGakusei: gakusei3), expectedLst)

        lst = [
            gakusei2, gakusei3, gakusei4
        ]
        expectedLst = [
            gakusei1, gakusei2, gakusei3, gakusei4
        ]
        XCTAssertEqual(chapter10.gakuseiInsert(lst: lst, addGakusei: gakusei1), expectedLst)

        lst = [
        ]
        expectedLst = [
            gakusei3
        ]
        XCTAssertEqual(chapter10.gakuseiInsert(lst: lst, addGakusei: gakusei3), expectedLst)
    }

    func testInsSort() {
        let chapter10 = Chapter10()

        XCTAssertEqual(chapter10.insSort(lst: [8,4,1,9,3,5]), [1,3,4,5,8,9])
        XCTAssertEqual(chapter10.insSort(lst: [0,4]), [0,4])
        XCTAssertEqual(chapter10.insSort(lst: [9]), [9])
        XCTAssertEqual(chapter10.insSort(lst: [0,1,19,10,3,-1]), [-1,0,1,3,10,19])
    }

    func testInsert() {
        let chapter10 = Chapter10()

        XCTAssertEqual(chapter10.insert(lst: [1,3,4,7,8], addNumber: 5), [1,3,4,5,7,8])
        XCTAssertEqual(chapter10.insert(lst: [], addNumber: 0), [0])
        XCTAssertEqual(chapter10.insert(lst: [], addNumber: 1), [1])
        XCTAssertEqual(chapter10.insert(lst: [0], addNumber: 0), [0])
        XCTAssertEqual(chapter10.insert(lst: [5], addNumber: 3), [3,5])
        XCTAssertEqual(chapter10.insert(lst: [0], addNumber: 1), [0,1])
        XCTAssertEqual(chapter10.insert(lst: [0,10,101], addNumber: 25), [0,10,25,101])
        XCTAssertEqual(chapter10.insert(lst: [-1,0,2], addNumber: 1), [-1,0,1,2])
    }
}

Chapter10Test.defaultTestSuite.run()
