class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update]

  def index
    @products = Product.order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render 'products/edit'
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :product_description, :price, :image, :category_id,
      :condition_id, :shipping_charge_id, :prefecture_id, :days_ship_id).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def correct_user
    @product = Product.find(params[:id])
    @user = @product.user
    redirect_to root_path unless @user == current_user
  end
end
