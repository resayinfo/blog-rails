FactoryGirl.define do

  factory :user do
    first_name 'Maggie'
    last_name 'Simpson'
    email 'maggi@email.com'
    password 'password'
  end

  factory :admin, class: User do
    first_name 'Lisa'
    last_name 'Simpson'
    email 'lisa@email.com'
    password 'password'
  end

  factory :superadmin, class: User do
    first_name 'Marge'
    last_name 'Simpson'
    email 'marge@email.com'
    password 'password'
  end

  factory :article do
    author "Krusty the Klown"
    title "Springfield"
    text "Elementary"
  end

  factory :comment do
    commenter "Moe"
    comment "Shelbyville"
  end

  factory :invalid_article, class: Article do
  end

  factory :invalid_comment, class: Comment do
  end

end
