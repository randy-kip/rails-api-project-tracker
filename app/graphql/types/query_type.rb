module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :projects, [Types::ProjectType], null: false,
          description: "Returns a list of projects for the user"

    def projects
      context[:current_user].projects
    end

    field :project, Types::ProjectType, null: false, 
          description: "Returns details for a project" do
      		argument :id, Integer, required: true
    end

    def project(id:)
      context[:current_user].projects.find(id)
    end

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end
  end
end
