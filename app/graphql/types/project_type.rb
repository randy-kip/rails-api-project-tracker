module Types
    class ProjectType < Types::BaseObject
      field :id, ID, null: false
      field :title, String, null: true
      field :created_by, String, null: true
      field :created_at, Integer, null: false
      field :updated_at, Integer, null: false
      field :start_date, Integer, null: true
      field :end_date, Integer, null: true
      field :milestones, [Types::MilestoneType], null: false
  
      def created_at
          object.created_at.to_time.to_i
      end
  
      def updated_at
          object.updated_at.to_time.to_i
      end
  
      def start_date
          object.start_date.to_time.to_i
      end
  
      def end_date
          object.end_date.to_time.to_i
      end 
    end
  end
  