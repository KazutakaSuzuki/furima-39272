class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :order

  belongs_to :category
  belongs_to :quality
  belongs_to :fee_status
  belongs_to :prefecture
  belongs_to :schedule
  belongs_to_active_hash :fee_status

  has_one_attached :image

  validates :image, presence: true
  validates :item_name,      presence: true, length: { maximum: 40 }
  validates :explain,        presence: true, length: { maximum: 1000 }
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
  validates :price, numericality: { only_integer: true, message: 'is invalid. Input half-width characters' }
  validates :category_id,    numericality: { other_than: 1, message: "can't be blank" }
  validates :quality_id,     numericality: { other_than: 1, message: "can't be blank" }
  validates :fee_status_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :schedule_id,    numericality: { other_than: 1, message: "can't be blank" }
end
