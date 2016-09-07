# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# coding: utf-8

housing,event, lesson, health, other = Category.create([{name: "住まい"}, {name: "イベント"},{name: "習い事"},{name: "健康"},{name: "その他"}])

cleaning, flooring, moving,remodel, dustcollect, plumbing, furniture, electrical, garden, pest, other = housing.children.create([{name: "ハウスクリーニング"}, {name: "フローリング"}, {name: "お引越し"}, {name: "リフォーム"}, {name: "不用品回収"},{name: "配管工事"}, {name: "家具"}, {name: "家電取り付け"}, {name: "剪定・造園"}, {name: "害虫駆除"}, {name: "その他"}])

food, wedding, photography,videography, music,rental, driver,  entertaiment, gettingready,  other = event.children.create([{name: "ケータリング"}, {name: "結婚式"}, {name: "写真撮影"}, {name: "動画撮影"}, {name: "音楽"},{name: "パーティーレンタル"},{name: "ドライバー"},  {name: "エンターテイメント"}, {name: "パーティー準備"},  {name: "その他"}])


music, cooking,sports,fitness, language, skill, tutoring, other = lesson.children.create([{name: "音楽"}, {name: "料理"}, {name: "スポーツ"}, {name: "フィットネス"},{name: "語学"},{name: "特技"},  {name: "学習"},  {name: "その他"}])


counseling, exercise, healing,coaching,spa, nutrition,other = health.children.create([{name: "カウンセリング"}, {name: "エクササイズ"}, {name: "ヒーリング"}, {name: "コーチング"}, {name: "スパ"},{name: "パーソナルシェフ"},  {name: "その他"}])
