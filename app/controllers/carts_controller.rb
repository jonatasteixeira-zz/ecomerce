class CartsController < ApplicationController
  before_action :set_cart, only: [:index, :add, :remove, :finish]
  def index
  end

  def add
    if not current_user then
      render login_path
    end
    item = Item.find(params[:item])
    if not item.nil? then
      @cart.items << item
      notice="Item was added to the cart."  
    else 
      notice="Item does not exist."
    end
    respond_to do |format|
      format.html { redirect_to carts_url, notice: notice }
    end
  end

  def remove
    item = Item.find(params[:item])
    if not item.nil? then
      @cart.items.destroy(item)
      notice="Item was remove from the cart."  
    else 
      notice="Item does not exist."
    end
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
    end
  end

  def close
    @carts.status = "close"
    @carts.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      user=current_user
      if user.carts.last.nil? || user.carts.last.close? then
        @cart = user.carts.create
      else
        @cart = user.carts.last
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:user_id, :status, :item)
    end
end
