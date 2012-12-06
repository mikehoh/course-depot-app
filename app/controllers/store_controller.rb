class StoreController < ApplicationController
  def index
    @products = Product.order(:price).cheap

    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.json { render json: @products }
    #end  
  end
end
