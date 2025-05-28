class Project < ApplicationRecord
    has_many :issues, dependent: :destroy
    validates :title, :description, presence: true

    scope :with_issues, -> { joins(:issues).distinct }
end