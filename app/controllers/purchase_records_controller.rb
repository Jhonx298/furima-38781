class PurchaseRecordsController < ApplicationController
  before_action :set_purchase, exept: :create
  before_action :authenticate_user!
  before_action :sold_out, only: [:index, :create]
  before_action :user_product, only: :index

  def index
    @purchase_form = PurchaseForm.new
  end

  def create
    @purchase_form = PurchaseForm.new(purchase_record_params)
    if @purchase_form.valid?
      pay_item
      @purchase_form.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_record_params
  params.require(:purchase_form).permit(:post_code, :prefecture_id, :city, :address_num, :building_name, :phone_num).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: purchase_record_params[:token],
      currency: 'jpy'
    )
  end

  def sold_out
    if @product.purchase_record.present?
      redirect_to root_path
    end
  end

  def user_product
    if @product.user_id == current_user.id
      redirect_to root_path
    end
  end

  def set_purchase
  @product = Product.find(params[:product_id])
  end
end
