# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  [{ user_id: "test_1", password: "password012"},
  { user_id: "test_2", password: "password123"},
  { user_id: "test_3", password: "password456"},
  { user_id: "test_4", password: "password789"}
])
