class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create]

  def create
    auth_hash = request.env['omniauth.auth']#our request translated from github and imniauth
    #raise
    user = User.find_by(uid: auth_hash["uid"], provider: auth_hash["provider"])

    #if it's not there in the db then make it save it
    if user.nil?
      user = User.create_from_github(auth_hash)
      if user.nil?
        flash[:error] = "Could not login"
        redirect_to root_path
        # else
        #   #if it is there then save some data to session then redirect
      end
      session[:user_id] = user.id
      flash[:success] = "Logged in Successfully"
      redirect_to root_path
    end

    def logout
      #session[:user_id] = nil
      session.delete(:user_id)
      flash[:success] = "You are successfully logged out."
      redirect_to root_path
    end
  end
end
