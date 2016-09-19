# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# coding: utf-8

housing,event, lesson, health, other = Category.create([{name: "住まい"}, {name: "イベント"},{name: "習い事"},{name: "健康"},{name: "その他"}])

cleaning, moving,remodel, dustcollect, plumbing, garden, furniture, electronic, pest, housekeeper, petsitter, other = housing.children.create([{name: "ハウスクリーニング"}, {name: "お引越し"}, {name: "リフォーム"}, {name: "不用品回収"}, {name: "配管工事"},{name: "剪定・造園"}, {name: "家具修理"}, {name: "家電取り付け"}, {name: "害虫駆除"}, {name: "家事代行・家政婦"} ,{name: "ペットシッター"},{name: "その他"}])

food, wedding, photography,videography,flowerdesigner, music,entertainment, planning,driver, hairmake, nail,other = event.children.create([{name: "ケータリング"}, {name: "結婚式"}, {name: "写真撮影"}, {name: "動画撮影"},{name: "フラワーデザイナー"}, {name: "音楽演奏"},{name: "エンターテイメント"},{name: "プランニング"},{name: "ドライバー"},  {name: "メイク・ヘアメイク"}, {name: "ネイル"},  {name: "その他"}])


instrument, voicetraining, dance, painting, aloma, fitness, sports, language,tutoring, cooking,flowerarangement, other = lesson.children.create([{name: "楽器演奏"}, {name: "ボイストレーニング"}, {name: "ダンス"},  {name: "絵画教室"}, {name: "アロマ教室"}, {name: "身体作り"}, {name: "スポーツ"},{name: "語学"}, {name: "学習"}, {name: "料理"},{name: "フラワーアレンジメント"},  {name: "その他"}])


counseling, exercise, healing,coaching,massage,este, personalchef,dentalcare,personaltraining,alomatherapy, helper,other = health.children.create([{name: "カウンセリング"}, {name: "エクササイズ"}, {name: "ヒーリング"}, {name: "コーチング"}, {name: "マッサージ"},{name: "エステ"},{name: "パーソナルシェフ"}, {name: "デンタルケア"},{name: "パーソナルトレーニング"},{name: "アロマセラピー"},{name: "介護ヘルパー"}, {name: "その他"}])

