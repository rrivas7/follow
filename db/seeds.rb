# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

followees_atributes = [
  { name: 'Lionel Messi', article_query: 'lionel messi' },
  { name: 'Steve Carell', article_query: 'steve carell' },
  { name: 'Rihanna', article_query: 'rihanna' },
  { name: 'Keanu Reeves', article_query: 'keanu reeves' }
]

followees_atributes.each do |followee_attributes|
  Followee.find_or_create_by!(followee_attributes)
end

Followees::SyncArticlesJob.perform_now

User.create!(
  email: 'user@example.com',
  password: 'abc123',
  password_confirmation: 'abc123',
  followee: Followee.last
)
