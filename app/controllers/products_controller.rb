class ProductsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @products = Product.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :product_description, :price, :image, :category_id,
      :condition_id, :shipping_charge_id, :prefecture_id, :days_ship_id).merge(user_id:current_user.id)
  end

end
