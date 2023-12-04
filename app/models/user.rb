class User < ApplicationRecord
  has_many :projects
  has_many :tasks
  has_many :alerts, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
