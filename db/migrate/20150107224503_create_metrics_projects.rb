class CreateMetricsProjects < ActiveRecord::Migration
  def change
    create_table :metrics_projects do |t|
      t.integer :metric_id
      t.integer :project_id

      t.timestamps
    end
  end
end
