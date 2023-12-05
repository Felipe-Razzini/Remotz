class User < ApplicationRecord
  has_many :projects
  has_many :tasks
  has_many :alerts, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :chatrooms, through: :messages

  validates :avatar, allow_nil: true, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
