class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :name, :start_date, :end_date, presence: true
  validates :completed, inclusion: {in: [true, false]}
  validates :name,uniqueness: true
  # validates :end_date, presence: true, date: { after_or_equal_to: :start_date}

end
