class Project < ApplicationRecord
    has_many :milestones, dependent: :destroy

    validates_presence_of :title, :created_by
end
