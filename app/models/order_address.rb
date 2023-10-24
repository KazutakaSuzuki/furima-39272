class OrderAddress < ApplicationRecord
  include ActiveModel::Model

  attr_accessor :token, :postarl_code, :prefecture_id, :city, :add_number, 
                :building, :phone_number, :item_id, :user_id
  
  with_options presence: true do
  
    validates :token

    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters." }
    validates :add_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid." }
    validates :user_id
    validates :item_id
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, add_number: add_number, building: buildeing, phone_number: phone_number, order_id: order.id)
  end
end
