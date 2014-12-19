class CreateChannelsProjects < ActiveRecord::Migration
  def change
    create_table :channels_projects do |t|
      t.integer :project_id
      t.integer :channel_id

      t.timestamps
    end
  end
end
