# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

class User < ApplicationRecord

  # メールアドレス正規表現
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # 大文字、小文字、数字を１文字以上含む
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]+\z/  

  validates :name, presence: true, length: { maximum:15 }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true,length: { minimum:8, maximum:100 }, format: { with: VALID_PASSWORD_REGEX }
  has_secure_password

  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  has_many :comments
end
