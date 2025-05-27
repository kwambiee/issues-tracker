class Project < ApplicationRecord
    has_many :issues, dependent: :destroy
    validates :title, :description, presence: true
end
