class ShopsController < ApplicationController
        before_action :authorize, :new         
	def new
    
		@shop=Shop.new
	end
	def create
		shop = Shop.new(shop_params)
           if shop.save
                    
               session[:shop_id] = shop.id
               redirect_to '/'
           else
                redirect_to '/signup'
           end

	end
	def show
		@shop=Shop.find(params[:id])
	end
	def edit
		@shop=Shop.find(params[:id])
	end
	def update
           @shop = Shop.find(params[:id])
          if @shop.update(shop_params)
              redirect_to @shop
          else
             render 'edit'    
          end
        end
	def index
             
  	
          @shops=Shop.all
                
	end
	def destroy
        @shop = Shop.find(params[:id])
        @shop.destroy
        redirect_to shop_path
       end


    

   
	private
	def shop_params
		params.require(:shop).permit(:owner_name, :address, :email_id, :store_id, :shop_type)
	end
    end

