class Project < ApplicationRecord
    has_many :milestones, dependent: :destroy
    belongs_to :user

    validates_presence_of :title, :created_by

    def as_json(options = nil)
        hash = super (: include => {:milestones => {:except => [:updated_at, :project_id]}})
        hash.store(:project_title, hash.delete("title"))

        hash [:created_at] = self.created_at.to_time.to_i
        hash [:updated_at] = self.updated_at.to_time.to_i
        hash [:start_date] = self.updated_at.to_time.to_i
        hash [:end_date] = self.updated_at.to_time.to_i

        hash [:is_single_day_project] = single_day_project
        return hash
    end

    private

    def single_day_project
        Time.at(self.start_date).to_date === Time.at(self.end_date).to_date
    end
end
