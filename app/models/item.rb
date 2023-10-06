class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :category
  belongs_to :quality
  belongs_to :fee_status
  belongs_to :prefecture
  belongs_to :schedule
  has_one_attached :image
  has_one :order

  validates :title, :text, presence: true
  validates :category_id, :quality_id, :fee_status_id, :prefecture_id, 
            :schedule_id, numericality: {other_than: 1, message: "can't be blank"}
end
