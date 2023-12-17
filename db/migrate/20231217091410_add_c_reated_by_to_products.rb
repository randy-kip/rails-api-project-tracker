class AddCReatedByToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :projects, :user, foreign_key: { to_table: :users, column: :created_by }
  end
end
