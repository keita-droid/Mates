# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

genres = ["未分類", "映画", "テレビ", "アニメ・漫画", "ゲーム", "本", "スポーツ", "音楽", "レジャー", "動物", "自然", "ファッション", "美容・健康", "フード・グルメ", "旅行", "テクノロジー", "アート", "その他" ]
genres.each do |g|
  Genre.create(name: g)
end