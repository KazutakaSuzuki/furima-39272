class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,
         :validatable
         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i
         VALID_FULLWIDTH_REGEX = /\A[ぁ-んァ-ン一-龯々]+\z/
         VALID_KANAWIDTH_REGEX = /\A[ァ-ン]+\z/

  validates :nickname,         presence: true
  validates :birthday,         presence: true
  validates :last_name,        presence: true, format: { with: VALID_FULLWIDTH_REGEX, message: "is invalid. Input full-width characters" }
  validates :first_name,       presence: true, format: { with: VALID_FULLWIDTH_REGEX, message: "is invalid. Input full-width characters" }
  validates :last_name_kana,   presence: true, format: { with: VALID_KANAWIDTH_REGEX, message: "is invalid. Input full-width katakana characters" }
  validates :first_name_kana,  presence: true, format: { with: VALID_KANAWIDTH_REGEX, message: "is invalid. Input full-width katakana characters" }
  validates :password,                         format: { with: VALID_PASSWORD_REGEX,  message: "is invalid. Include both letters and numbers" }

end
