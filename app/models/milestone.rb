class Milestone < ApplicationRecord
  belongs_to :project

  validates_presence_of :title
end
