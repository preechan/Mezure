class AddApikeyToChannel < ActiveRecord::Migration
  def change
    add_column :channels, :apiKey, :string
  end
end
