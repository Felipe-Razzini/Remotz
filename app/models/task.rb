class Task < ApplicationRecord
  belongs_to :project, optional: true
  belongs_to :user

  validates :title, :priority, :start, :end, presence: true
  validates :completed, inclusion: {in: [true, false]}
  validates :title, uniqueness: true
end
