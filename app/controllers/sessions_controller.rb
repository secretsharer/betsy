class SessionsController < ApplicationController
  # skip_before_action :require_login, only: [:create]

  def create
    auth_hash = request.env['omniauth.auth']
    merchant = Merchant.find_by(uid: auth_hash["uid"], provider: auth_hash["provider"])

    # if it's not there in the db, then make/save it
    if merchant.nil?
      merchant = Merchant.create_from_github(auth_hash)
      if merchant.nil?
        flash[:error] = "Could not log in"
        redirect_to root_path
      end
    end
    # if it is there, then save some data to session then redirect somewhere
    session[:merchant_id] = merchant.id
    flash[:success] = "Logged in successfully!"
    redirect_to root_path
  end




    # def login
    #   auth_hash = request.env['omniauth.auth']#our request translated from github and imniauth
    #   #raise
    #   merchant = Merchant.find_by(uid: auth_hash["uid"], provider: auth_hash["provider"])
    #
    #   #if it's not there in the db then make it save it
    #   if merchant.nil?
    #     merchant = Merchant.create_from_github(auth_hash)
    #     if merchant.nil?
    #       flash[:error] = "Could not login"
    #       redirect_to root_path
    #       # else
    #       #   #if it is there then save some data to session then redirect
    #     end
    #     session[:user_id] = merchant.id
    #     flash[:success] = "Logged in Successfully"
    #     redirect_to root_path
    # end
    #
    # def logout
    #   #session[:merchant_id] = nil
    #   session.delete(:merchant_id)
    #   flash[:success] = "You are successfully logged out."
    #   redirect_to root_path
    # end
    #
    # def signup
    # end




end
