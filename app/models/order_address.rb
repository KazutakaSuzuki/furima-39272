class OrderAddress < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :add_number, 
                :building, :phone_number, :item_id, :user_id, :token
  belongs_to :prefecture
  
  with_options presence: true do

    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters." }
    validates :add_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid." }
    validates :user_id
    validates :item_id
  
    validates :token
  end
    validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, add_number: add_number, 
                   building: building, phone_number: phone_number, order_id: order.id)
  end
end
