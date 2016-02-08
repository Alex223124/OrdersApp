class ServicePlansController < ApplicationController
  before_action :set_type
  before_action :set_service_plan, only: [:show, :edit, :update, :destroy]

  def index
    @service_plans = type_class.all
  end

  def new
    @service_plan = type_class.new
  end

  def show
    @service_plan = ServicePlan.find(params[:id])
  end

  def create
    @service_plan = ServicePlan.new(service_plan_params)
    if @service_plan.save
      flash[:success] = "Your service plan has been created succesfully"
      redirect_to @service_plan
    else
      redirect_to service_plans_path, :alert => "Unable to create service plan."
    end
  end

  def edit
  end

  def update
    if @service_plan.update(service_plan_params)
      redirect_to @service_plan, notice: "#{type} was successfully created."
    else
      render action: 'edit'
    end
  end


  private

  def set_type
    @type = type
  end

  def type
    ServicePlan.sub_types.include?(params[:type]) ? params[:type] : "ServicePlan"
  end

  def type_class
    type.constantize
  end

  def set_service_plan
    @service_plan = type_class.find(params[:id])
  end

  def service_plan_params
    params.require(:service_plan).permit(:title, :description, :days, :price, :type, :start_day, :end_day, :start_day_of_week, :end_day_of_week)
  end

end