class UsersController < ApplicationController
  	def new
  		@user = User.new
  	end

  	def create
  		@user = User.new(email: params[:user][:email], pwd_hash: params[:user][:pwd_hash])
    	if @user.save
    	  	flash[:notice] = "You signed up successfully"
      		flash[:color]= "valid"
    	else
      		flash[:notice] = "Form is invalid"
    	  	flash[:color]= "invalid"
    	end
    	render "new"
  	end
end