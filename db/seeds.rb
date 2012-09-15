# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
token = SecretCode.create(:token=>"admin")
admin = User.create(:email=>"amardaxini@gmail.com",:password=>"Admin123!",:password_confirmation=>"Admin123!",:token=>"admin")
token.user = admin
token.save
admin.add_role :admin