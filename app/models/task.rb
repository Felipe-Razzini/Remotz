class Task < ApplicationRecord
  belongs_to :project, optional: true
  belongs_to :user

  validates :title, :priority, :start, :end, presence: true


  # default_scope -> { order(:start) }

  def time
    "#{start_time.strftime('%I:%M %p')} - #{end_time.strftime('%I:%M %p')}"
  end

  def multi_days?
    (end_time.to_date - start_time.to_date).to_i >= 1
  end

  def start_time
    start

  end

  def end_time
  self.end
  end
end
