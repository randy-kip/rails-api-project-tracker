class Project < ApplicationRecord
    has_many :milestones, dependent: :destroy
    belongs_to :user

    validates_presence_of :title, :created_by

    def as_json(options = nil)
        super(:include => [:milestones])
    end
end
