class CreateKpis < ActiveRecord::Migration
  def change
    create_table :kpis do |t|
      t.string :title
      t.string :description
      t.integer :weighting
      t.integer :baseline
      t.integer :target

      t.timestamps
    end
  end
end
