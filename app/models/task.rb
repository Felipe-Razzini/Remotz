class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :title, :description, :priority, :completed, presence: true
  validates :title, uniqueness: true
end
