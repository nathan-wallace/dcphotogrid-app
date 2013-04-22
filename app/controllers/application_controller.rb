class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
 		home_path
	end

	def after_sign_out_path_for(resource_or_scope)
  	home_path
	end

	def after_update_path_for(resource)
      home_path
   end

end
