FactoryBot.define do
  factory :order_address do

    
    postal_code           { '999-0000' }
    prefecture_id         { 7 }
    city                  { '長井市' }
    add_number            { '22-33-44' }
    building              { '〇〇アパート' }
    phone_number          { '09000009999' }
    token                 { '3530111333300000' }
  end
end
