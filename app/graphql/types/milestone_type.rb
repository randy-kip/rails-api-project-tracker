module Types
    class MilestoneType < Types::BaseObject
      field :id, ID, null: false
      field :title, String, null: true
      field :done, Boolean, null: true
      field :project_id, Integer, null: false
      field :created_at, Integer, null: false
      field :updated_at, Integer, null: false
  
      def created_at
          object.created_at.to_time.to_i
      end
  
      def updated_at
          object.updated_at.to_time.to_i
      end
    end
end
  