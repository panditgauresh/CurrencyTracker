class SessionsController < ApplicationController
	def login
	end

	def check
		user = User.authenticate(params[:email],params[:pwd_hash])
    	if user
    		puts 'logged in'
    		session[:id] = user.id
      		redirect_to(:controller => 'currencies', :action => 'index')
    	else
    		puts 'failed'
      		render "login"
    	end
	end
end
