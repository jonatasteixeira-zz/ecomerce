class CartsController < ApplicationController
  before_action :set_cart, only: [:add, :remove, :finish]
  def index
    @carts = Cart.all
  end

  def add
  end

  def remove
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
    end
  end

  def finish
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:user_id, :status)
    end
end
