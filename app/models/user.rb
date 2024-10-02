class User < ApplicationRecord
  validates :name, presence: { message: '名前を入力してください' }, length: { maximum: 30 }
  validates :email, presence: { message: 'メールアドレスを入力してください' }, length: { maximum: 255 }, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: { message: 'パスワードを入力してください' }, length: { minimum: 6, message: 'パスワードは6文字以上で入力してください' }

  before_validation { email.downcase! }
  has_secure_password
  has_many :tasks, dependent: :destroy
end
