class Project < ApplicationRecord
    has_many :milestones, dependent: :destroy
    belongs_to :user

    validates_presence_of :title, :created_by
end
