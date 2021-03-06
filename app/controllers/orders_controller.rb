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
    @order = best_order_combination(secure_params)
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

  def best_order_combination(params)
    ServiceCombination.new(params).calculate
  end

  def secure_params
    params.require(:order).permit(:start_date, :end_date)
  end

end

