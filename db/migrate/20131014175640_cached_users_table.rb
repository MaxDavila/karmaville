class CachedUsersTable < ActiveRecord::Migration
  def up
    create_table :cached_users do |t|
      t.integer
    end
  end

  def down
  end
end
