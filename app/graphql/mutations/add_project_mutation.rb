module Mutations
    class AddProjectMutation < Mutations::BaseMutation
      argument :title, String, required: true
      argument :start_date, Integer, required: true
      argument :end_date, Integer, required: false
  
      field :project, Types::ProjectType, null: true
      field :errors, [String], null: false
  
      def resolve(title:, start_date:, end_date: nil)
        if context[:current_user].nil?
          raise GraphQL::ExecutionError,
                "You need to authenticate to perform this action"
        end
  
        project = Project.new(
          title: title,
          start_date: Time.at(start_date),
          end_date: Time.at(end_date),
          created_by: context[:current_user].id
        )
  
        if project.save
          { project: project }
        else
          { errors: project.errors.full_messages }
        end
      end
    end
  end