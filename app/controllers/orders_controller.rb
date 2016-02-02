class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(secure_params)
    if @order.save
      flash[:success] = "Your order has been created succesfully"
      redirect_to @order
    else
      redirect_to orders_path, :alert => "Unable to create Order."
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(secure_params)
      redirect_to orders_path, :notice => "Your Order updated."
    else
      redirect_to orders_path, :alert => "Unable to update Order."
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path, :notice => "Order deleted."
  end

  private

  def secure_params
    params.require(:order).permit(:time_period)
  end

end
