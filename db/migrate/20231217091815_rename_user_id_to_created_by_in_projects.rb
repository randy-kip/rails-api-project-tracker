class RenameUserIdToCreatedByInProjects < ActiveRecord::Migration[7.0]
  def change
    rename_column :projects, :user_id, :created_by
  end
end
