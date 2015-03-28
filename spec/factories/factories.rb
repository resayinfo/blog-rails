FactoryGirl.define do

  factory :user do
    first_name 'Clancy'
    last_name 'Wighum'
    email 'cw@email.com'
    password 'password'
  end


  factory :admin_user, class: User do
    first_name 'Waylan'
    last_name 'Smithers'
    email 'mb@email.com'
    password 'password'
  end


  factory :superadmin_user, class: User do
    first_name 'Montgomery'
    last_name 'Burns'
    email 'mb@email.com'
    password 'password'
  end

  factory :invalid_admin_user, class: User do
  end


  factory :god_user, class: User do
    first_name 'Jebidiah'
    last_name 'Springfield'
    email 'jb@email.com'
    password 'password'
    after(:create) {|user| user.add_role(:god)}
  end

  factory :invalid_god_user, class: User do
  end


  factory :article do
    title "Springfield"
    text "Elementary"
  end

  factory :invalid_article, class: Article do
  end


  factory :comment do
    body "Shelbyville"
  end

  factory :invalid_comment, class: Comment do
  end


end
