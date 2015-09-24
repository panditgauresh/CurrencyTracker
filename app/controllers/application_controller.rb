class ApplicationController < ActionController::Base
  protect_from_forgery

  #before_action :check_login
  login_url = "users/new"

  def check_login
  	unless logged_in?
  		#redirect_to "/users/new"
      render :json => '{authentication: failed}'
  	end
  end

  def logged_in?
  	#if session == nil and session[:id] != ""
		  #return User.authenticate(params[:user][:email],params[:user][:pwd_hash])
    #else
		  #return User.find(session[:id])
    #end

    return User.authenticate(params[:email],params[:pwd_hash])
  end
end
