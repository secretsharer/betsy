class MerchantsController < ApplicationController
  before_action :find_merchant, only: [:show, :edit, :update]

  def index
    @merchants = Merchant.all
  end

  def new
    @merchant = Merchant.new
  end

  def create
    @merchant = Merchant.create merchant_params

    unless @merchant.id == nil
      flash[:success] = "Merchant #{@merchant.username} successfully created"
      redirect_to merchants_path
    else
      flash.now[:error] = "Merchant not created; see below for specifics"
      render "new"
    end
  end

  def show
    if !@merchant
      render_404
    end
  end

  def edit; end

  def update
    @merchant.username = merchant_params[:username]
    @merchant.email  = merchant_params[:email]
    @merchant.description = merchant_params[:description]

    if @merchant.save
      redirect_to merchant_path(@merchant.id)
    else
      render "edit"
    end

  end

  def destroy
    Merchant.destroy(params[:id])

    redirect_to merchants_path
  end


  private

  def merchant_params
    params.require(:merchant).permit(:username, :email, :description, :uid, :provider)
  end

  def find_merchant
    @merchant = Merchant.find_by_id params[:id]
  end
end
