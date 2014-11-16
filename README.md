rails-blog
==========


rails 4.1 blog with devise authentication, bootstrap, google fonts, custom mobile friendly CSS 3, & a .gitignore file for local development .. http://guides.rubyonrails.org/getting_started.html

anthonys-MacBook-Pro:development anthonymaseda$ cd rails-blog
anthonys-MacBook-Pro:rails-blog anthonymaseda$ rake db:migrate
== 20141112031658 CreateArticles: migrating ===================================
-- create_table(:articles)
   -> 0.0018s
== 20141112031658 CreateArticles: migrated (0.0019s) ==========================

== 20141112034053 CreateComments: migrating ===================================
-- create_table(:comments)
   -> 0.0011s
== 20141112034053 CreateComments: migrated (0.0012s) ==========================

== 20141115054023 DeviseCreateUsers: migrating ================================
-- create_table(:users)
   -> 0.0028s
-- add_index(:users, :email, {:unique=>true})
   -> 0.0019s
-- add_index(:users, :reset_password_token, {:unique=>true})
   -> 0.0007s
== 20141115054023 DeviseCreateUsers: migrated (0.0057s) =======================

anthonys-MacBook-Pro:rails-blog anthonymaseda$ rails s
