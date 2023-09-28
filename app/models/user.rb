class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i
         VALID_FULLWIDTH_REGEX = /\A[ぁ-んァ-ン一-龯々]+\z/
         VALID_KANAWIDTH_REGEX = /\A[ぁ-んァ-ン]+\z/


  validates :nickname,  presence: true
  validates :birthday,  presence: true
  validates :kanji_sei, presence: true, format: { with: VALID_FULLWIDTH_REGEX, message: "is invalid. Input full-width characters" }
  validates :kanji_mei, presence: true, format: { with: VALID_FULLWIDTH_REGEX, message: "is invalid. Input full-width characters" }
  validates :kana_sei,  presence: true, format: { with: VALID_KANAWIDTH_REGEX, message: "is invalid. Input full-width katakana characters" }
  validates :kana_mei,  presence: true, format: { with: VALID_KANAWIDTH_REGEX, message: "is invalid. Input full-width katakana characters" }
  validates :password,  presence: true, format: { with: VALID_PASSWORD_REGEX, message: "is invalid. Include both letters and numbers" }

end
