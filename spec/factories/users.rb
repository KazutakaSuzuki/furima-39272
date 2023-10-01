FactoryBot.define do

 factory :user do
    
    nickname                  {Faker::Name.last_name}
    email                     {Faker::Internet.free_email}
    password                  {Faker::Internet.password(min_length: 6)}
    password_confirmation     {password}
    birthday                  {Faker::Date.birthday}
    last_name                 {Faker::Name.last_name}
    first_name                {Faker::Name.first_name}

    to_create do |instance|
      class << instance
        def katakana_name
          %w[アイウエオ カキクケコ サシスセソ タチツテト ナニヌネノ ハヒフヘホ マミムメモ ラリルレロ].sample
        end
      end
      instance.save!
    end


    last_name_kana            {Faker::Name.last_name_kana(katakana_name)}
    first_name_kana           {Faker::Name.first_name_kana(katakana_name)} 
  end
end