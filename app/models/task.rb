class Task < ApplicationRecord
  has_secure_password

  validates :title, presence: { message: 'タイトルを入力してください' }
  validates :content, presence: { message: '内容を入力してください' }

  belongs_to :user
end
