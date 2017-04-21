class MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
  end

  def new
    @merchant = Merchant.new
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def merchant_params

  end

end
