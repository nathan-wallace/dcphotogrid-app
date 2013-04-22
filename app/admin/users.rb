ActiveAdmin.register User do
	# scope :admin
	# scope :license

  index do 
  	column :id
  	column :name
  	column :email
  	column :created_at
  	default_actions
  end
end
