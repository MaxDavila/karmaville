class AddIndexToUsers < ActiveRecord::Migration
  def change
    add_index :users, :total, :name => 'total_ix'
  end
end
