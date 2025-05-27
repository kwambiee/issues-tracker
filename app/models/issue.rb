class Issue < ApplicationRecord
  belongs_to :project

  enum status: {
    new: "New",
    in_progress: "In Progress",
    closed: "Closed"
  }

  enum priority: {
    low: 1,
    medium: 3,
    high: 5
  }

  validates :title, :status, :priority, presence: true
end
