class Order < ApplicationRecord
  validates :price, presence: true

  belongs_to :user
  has_many :
  has_many :
  belongs_to 
  belongs_to :item
  has_one :

end
