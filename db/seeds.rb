# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |n|
  User.create!(
    email: "test#{n + 1}@test.com",
    name: "テスト太郎#{n + 1}",
    password: "testtest#{n + 1}",
    password_confirmation: "testtest#{n + 1}",
    introduction: "よろしくお願いします",
  )
end

Gelande.create( id: "1",
                name: "GALA湯沢スキー場",
                count: "16",
                slope: "33",
                distance: "2500",
                postal: "949-6101",
                address: "新潟県南魚沼郡湯沢町大字湯沢字茅平1039-2",
                tel: "025-785-6543",
                hp: "https://gala.co.jp",
                introduction: "新幹線「ガーラ湯沢駅」に直結するスキーセンターカワバンガにはレンタル、ロッカー、温泉＆プールなどの施設が充実。手ぶらで気軽に行けるスキー場です。準備を終えたら、ゴンドラでいっきにゲレンデへ。標高800m～1181mに広がるゲレンデは緩急多彩なコースがあり、初心者から上級者までお楽しみいただけます。
                また雪遊びメニューも充実で、雪国に伝わる”かんじき”を履いてガイドが案内する雪景色散策ツアーやそり遊び専用ゲレンデもあります。そりセット(そり、長ぐつ)のレンタルも子供用～大人用までご用意しておりますので気軽にお越しください。滑って、遊んで、楽しんで！最高の思い出づくりをGALAで！",
                is_active: "true"
)

Gelande.create( id: "2",
                name: "苗場スキー場",
                count: "21",
                slope: "45",
                distance: "4000",
                postal: "949-6292",
                address: "新潟県南魚沼郡湯沢町三国",
                tel: "025-789-4117",
                hp: "https://www.princehotels.co.jp/ski/naeba/",
                introduction: "スキー・スノーボード以外にも遊びきれない楽しさいっぱいのBIGスケールなスノーリゾートNaeba。ホテルの目の前に広大なゲレンデが広がります！パウダーを楽しめる非圧雪エリア、レベル別に楽しめるパークエリアなどあらゆるニーズに応えます。世界初のインドア・キッズゲレンデ「パンダルマンハウス」アウトドア・キッズゲレンデ「パンダルマンひろばを使ったキッズレッスン、「パンダルキッズスキースクール」が大人気！ファミリーに人気のわくわくファミリースノーランドや「カッパスノーモービルランド」も好評営業中！隣接するホテルにはショッピング・エステ・アミューズメントなど施設も充実。期日限定の打上げ花火もお楽しみ！",
                is_active: "true"
)

Gelande.create( id: "3",
                name: "かぐらスキー場",
                count: "23",
                slope: "32",
                distance: "6000",
                postal: "949-6211",
                address: "新潟県南魚沼郡湯沢町三俣742",
                tel: "025-788-9221",
                hp: "https://www.princehotels.co.jp/ski/kagura/",
                introduction: "上越国境の素晴らしい眺望を楽しみながら滑るスキーパラダイスのかぐら。
                かぐらエリアは標高が高く、11月の下旬から5月下旬まで滑走でき、雪質も12月下旬から3月上旬は、ほとんど毎日がパウダースノーをお楽しみいただけます。そして、1/1～5/6は、「かぐら第5ロマンスリフト」運行で、大自然のツアーコースの滑走が容易に体験いただけます。ありのままの自然の中で、その存在の豊かさを体験してください。",
                is_active: "true"
)

Gelande.create( id: "4",
                name: "舞子スノーリゾート",
                count: "26",
                slope: "32",
                distance: "6000",
                postal: "949-6423",
                address: "新潟県南魚沼市舞子2056-108",
                tel: "025-783-4100",
                hp: "https://www.maiko-resort.com/",
                introduction: "関越道・塩沢石打ICより1分！！首都圏からのアクセス抜群。
                自然の地形を活かしたコースは、ビギナーからエキスパートまで楽しめる全26コース。最長滑走距離はなんと6,000mもあるビックスケール！
                温泉・仮眠室・託児室・無料休憩所など、必要な施設が揃った「日帰りスキーセンター」をベースに1日中思いっきり楽しめる♪
                もっとゆっくりリゾートを満喫したい方には、ゲレンデダイレクトの「舞子高原ホテル＆ロッジ」がオススメ！天然温泉とシェフ自慢の豪華バイキングでアフタースキーもエンジョイ！
                ファミリーには、スノーエスカレーター完備のスマイルキッズパークや託児を兼ねたキッズ専用スキースクールが人気",
                is_active: "true"
)

Gelande.create( id: "5",
                name: "妙高杉ノ原スキー場",
                count: "17",
                slope: "38",
                distance: "8500",
                postal: "949-2113",
                address: "新潟県妙高市杉野沢",
                tel: "0255-86-6211",
                hp: "https://www.princehotels.co.jp/ski/myoko/",
                introduction: "最長滑走距離約8.5kmのロングでワイドなゲレンデは、スキー場の80%が初級・中級者向けのため、こどもから大人まで、誰でもウィンタースポーツを満喫！
                もちろん今シーズンも『キッズフリープログラム』とし、小学生までのお子さまは全日リフト・ゴンドラが無料！
                上信越道妙高高原ICから5km・約10分と、アクセスも抜群！急な坂道も無く初心者ドライバーでもスムーズにお越しいただけます。またゴンドラ・第3高速山頂から望む山々は絶景でもあり天候がよく空気の澄んだ日には富士山まで望める絶景ポイントがあります。",
                is_active: "true"
)

Gelande.create( id: "6",
                name: "上越国際スキー場",
                count: "22",
                slope: "38",
                distance: "6000",
                postal: "949-6431",
                address: "新潟県南魚沼市樺野沢112-1",
                tel: "025-782-1028",
                hp: "	https://www.jkokusai.co.jp/",
                introduction: "日本屈指の広大なスノーリゾート。4つのゾーンからなるゲレンデは雪あそびのお子様からエキスパートまで楽しめる多彩なコースが充実。最大斜度38度を誇る大別当ゲレンデを含む「アクティブゾーン」、変化にとんだ「パノラマゾーン」、初心者から楽しめる「マザーズゾーン」、降雪量豊富でパウダースノーが楽しめる「フォレストゾーン」など多彩なコースが充実。またホテル前ゲレンデには「キッズパラダイス」「ソリランド」などが並び、まさにそこは『雪のゆうえんち』♪
                電車も車もアクセス抜群！ゲレンデ直結「ホテルグリーンプラザ上越」では温泉やディナーバイキングなどアフタースノーも存分にお楽しみ頂けます。",
                is_active: "true"
)

Post.create(
  id: "1",
  title: "明日ガーラ行きます",
  post: "明日10時頃からガーラに滑りに行きます！もし行かれる方いましたら、一緒に滑りましょう！",
  user_id: "1"
)

Post.create(
  id: "2",
  title: "初滑り",
  post: "来週土曜日に今年初滑り行きます！舞子か妙高杉ノ原に行こうと思ってます！一緒に滑れる方いたら、コメントください！",
  user_id: "2"
)

Post.create(
  id: "3",
  title: "群馬でおすすめのゲレンデ",
  post: "群馬のゲレンデに行こうと思っているんですが行ったことがないので、皆さんのおすすめを教えてください！",
  user_id: "3"
)


Comment.create(
  id: "1",
  comment: "私も明日ガーラ行くので、良かったらご一緒させてください！",
  user_id: "2",
  post_id: "1"
)

Comment.create(
  id: "2",
  comment: "丸沼高原！ゴンドラあってイッキに頂上まで行けるのでおすすめです！",
  user_id: "1",
  post_id: "3"
)

Comment.create(
  id: "3",
  comment: "舞子だったら行こうと思っているので、一緒にどうですか？",
  user_id: "3",
  post_id: "2"
)


Review.create(
  star: "3.5",
  title: "おすすめ",
  review: "楽しかったです",
  gelande_id: "1"
)

Review.create(
  star: "5",
  title: "良かった",
  review: "1日中楽しめました",
  gelande_id: "1"
)

Review.create(
  star: "4.5",
  title: "また行きたい",
  review: "コースもいっぱいあって、飽きずに楽しめます",
  gelande_id: "1"
)

Review.create(
  star: "2",
  title: "ちょっと残念",
  review: "リフトが結構止まってて、残念だった。。",
  gelande_id: "1"
)

Review.create(
  star: "5",
  title: "パークが充実してる",
  review: "雪質もよくて、パークが充実してるので、最高だった！",
  gelande_id: "1"
)

