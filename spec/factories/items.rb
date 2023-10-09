FactoryBot.define do
  factory :item do
    association :user
    item_name { Faker::Commerce.product_name }
    price { Faker::Number.between(from: 300, to: 9_999_999) }

    explain             { 'あああああああああ' }
    category_id         { 2 }
    quality_id          { 2 }
    fee_status_id       { 2 }
    prefecture_id       { 2 }
    schedule_id         { 2 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
