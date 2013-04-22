class Permissions < ActiveRecord::Base
	scope :admin, where(:admin => true)
	scope :license, where(:license => true)
  
  attr_accessible :admin, :license

  has_many :users
end
