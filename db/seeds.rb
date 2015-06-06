# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(email: 'admin@ticnsp.org', password: 'test1234', password_confirmation: 'test1234', usertype: 'admin', username: 'ticnsp_admin', use_gravatar: true, name: 'Ricardo', lastname: 'Roman')