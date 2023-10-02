FactoryBot.define do
  factory :user do
    nickname                  { Faker::Name.last_name }
    email                     { Faker::Internet.free_email }
    password                  { Faker::Internet.password(min_length: 6) + ('A1') }
    password_confirmation     { password }
    birthday                  { '19991212' }
    last_name                 { '真男' }
    first_name                { '田中' }

    last_name_kana            { 'マサオ' }
    first_name_kana           { 'タナカ' }
  end
end
