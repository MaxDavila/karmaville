class AddTotalPointsToUser < ActiveRecord::Migration
  def change
    add_column :users, :total, :integer
  end
end
