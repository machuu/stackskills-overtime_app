FactoryBot.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  sequence :admin_email do |n|
    "admin#{n}@example.com"
  end

  factory :user do
    first_name 'Test'
    last_name 'User'
    email { generate :email }
    password 'foobar'
    password_confirmation 'foobar'
    phone "5555555555"
  end

  factory :another_user, class: "User" do
    first_name 'Another'
    last_name 'User'
    email { generate :email }
    password 'foobar'
    password_confirmation 'foobar'
    phone "5555555555"
  end

  factory :non_authorized_user, class: "User" do
    first_name 'Non'
    last_name 'Authorized'
    email { generate :email }
    password 'foobar'
    password_confirmation 'foobar'
    phone "5555555555"
  end

  factory :admin_user, class: "AdminUser" do
    first_name 'Admin'
    last_name 'User'
    email { generate :admin_email }
    password 'foobar'
    password_confirmation 'foobar'
    phone "5555555555"
  end
end