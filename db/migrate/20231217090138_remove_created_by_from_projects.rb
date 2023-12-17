class RemoveCreatedByFromProjects < ActiveRecord::Migration[7.0]
  def change
    remove_column :projects, :created_by, :string
  end
end
