# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

genres = ["ひとこと", "最近、気になること", "好きなもの", "大好きなもの", "趣味", "特技", "プチ自慢", "仲間募集中", "カラオケの十八番", "知りたい", "もっと知りたい", "やってみたい", "行ってみたい", "座右の銘", "子どもの頃のあだ名", "子どもの頃の夢", "心のふるさと", "推し", "休日の過ごし方", "おすすめ", "将来の夢", "わたしの強み", "わたしの弱点", "苦手なもの", "苦手なこと", "目標", "野望" ]
genres.each do |g|
  Genre.create(name: g)
end