class Api::V1::ShopsController < ApplicationController  
  before_action :set_article, only: [:show, :update, :destroy]  
  before_action :authorize, :new 
def new
  @shop=Shop.new
end
 def index   
    @shops = Shop.all   
    render json: @shops 
 end  
  
 def show   
    render json: @shop 
end  
  
def create  
 @shop = Shop.new(shop_params)   
 if @shop.save    
 render json: @shop, status: :created, location: 
  api_v1_shop_url(@shop)  
   else    
   render json: @shop.errors, status: :unprocessable_entity   
   end  
end  
 
def update   
if @shop.update(shop_params)    
   render json: @shop   
else    
  render json: @shop.errors, status: :unprocessable_entity   
end  
end 
  
def destroy   
   @shop.destroy  
end  
private  
  
def set_article  
  @shop = Shop.find(params[:id]) 
end  

def store_params  
  params.require(:shop).permit(:owner_name, :address, :shop_type, :email_id, :store_id)  
end
end
