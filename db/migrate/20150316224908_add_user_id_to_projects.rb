class AddUserIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :user_id, :number
  end
end
