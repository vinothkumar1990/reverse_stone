class SessionsController < ApplicationController
def create
    shop = Shop.where("email_id = ?", params[:email_id]).last
    if !shop.blank? and shop.shop_type=="Admin"
     session[:shop_id] = shop.id
      redirect_to '/stores'
    else
      flash[:error] = "Type should Admin"
      
      render 'new'
    end
  end

  def destroy
    session[:shop_id] = nil
    redirect_to '/login'
  end
end
