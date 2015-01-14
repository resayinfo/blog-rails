# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

god = User.create(email: 'god@email.com', password: 'password', first_name: 'Jebidiah', last_name: 'Springfield')
god.add_role 'god'
# Only the system admin can view and edit super admins.

superadmin = User.create(email: 'superadmin@email.com', password: 'password', first_name: 'Abraham', last_name: 'Simpson')
superadmin.add_role 'superadmin'

admin = User.create(email: 'admin@email.com', password: 'password', first_name: 'Homer', last_name: 'Simpson')
admin.add_role 'admin'

user = User.create(email: 'user@email.com', password: 'password', first_name: 'Bart', last_name: 'Simpson')
