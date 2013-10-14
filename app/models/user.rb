class User < ActiveRecord::Base
  has_many :karma_points

  attr_accessible :first_name, :last_name, :email, :username, :total

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  validates :username,
            :presence => true,
            :length => {:minimum => 2, :maximum => 32},
            :format => {:with => /^\w+$/},
            :uniqueness => {:case_sensitive => false}

  validates :email,
            :presence => true,
            :format => {:with => /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i},
            :uniqueness => {:case_sensitive => false}

  def self.by_karma
    User.order('total DESC').limit(50)
    # joins(:karma_points).group('users.id').order('SUM(karma_points.value) DESC')

  end

  def total_karma
    self.total
  end

  def calculate_total_karma
    self.karma_points.sum(:value)
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end

# Notes before lunch:
# Add migration of users index for total, it
# increased query time.  Rolled back the migration,
# ran and got 2 failing tests. -undefined total method.

# Add total method, tests past again.  Migrated again
# Times not affected.  Rolled back migration.

# Turned server off.  Tests still pass.