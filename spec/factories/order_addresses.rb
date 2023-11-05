FactoryBot.define do
  factory :order_address do

    postal_code           { '999-0000' }
    prefecture_id         { 6 }
    city                  { '長井市' }
    add_number            { '22-33-44' }
    phone_number          { '09000009999' }

  end
end
