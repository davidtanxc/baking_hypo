class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end
  
  def sorry
  end

  # GET /users/new
  def new
    @order = Order.new
    @packages = ['1 private one-to-one lesson - $150', '1 private two-to-one lesson - $240', '1 group four-to-one lesson - $90']
    @topics = ["Cakes", "Cookies", "Macaroons", "Bread"]
  end

  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to soldout_path }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
    Notifier.new_order(@order).deliver
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :class_type, :address, :number, :email, :start_date, :start_time, :topic)
    end
end
