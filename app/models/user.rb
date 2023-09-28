class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i


  validates :nickname,  presence: true
  validates :kanji_sei, presence: true
  validates :kanji_mei, presence: true
  validates :kana_sei,  presence: true
  validates :kana_mei,  presence: true
  validates :birthday,  presence: true
  validates :password,  presence: true, format: { with: VALID_PASSWORD_REGEX, message: "is invalid. Include both letters and numbers" }

end
