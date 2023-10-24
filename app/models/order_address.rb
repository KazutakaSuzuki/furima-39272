class OrderAddress < ApplicationRecord
  include ActiveModel::Model

  attr_accessor :token, :postarl_code, :prefecture_id, :city, :add_number, 
                :building, :phone_number, :item_id, :user_id
    

  def save
  end
end
