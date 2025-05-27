class Issue < ApplicationRecord
    belongs_to :project

    enum :status, { 
  new: "New",
  in_progress: "In Progress", 
  closed: "Closed" 
}, prefix: true, default: :new

enum :priority, { 
  low: 1, 
  medium: 3, 
  high: 5 
}, prefix: true  
  
    validates :title, :status, :priority, presence: true
  end