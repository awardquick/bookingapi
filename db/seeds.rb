# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
accts = []
  10.times do
    acct = Account.new
    acct.user_name = Faker::Internet.username(5..8)
    acct.status = 'active'
    acct.acct_type = 'employee'
    acct.acct_num = Faker::Number.number(10)
    acct.save
  accts.push(acct)
    accts.each
      user = User.new
      password = Faker::Internet.password(8)
      user.user_name = acct.user_name
      user.email = Faker::Internet.email
      user.role = Faker::Number.number(1)
      user.password = password
      user.password_confirmation = password
      user.account_id = acct.id
      user.save
      puts user.email,user.password
end

puts accts
