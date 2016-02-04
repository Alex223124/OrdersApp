class ServiceCombination

  def initialize(params)
    @start_day = Date.parse(params[:start_date])
    @end_day = Date.parse(params[:end_date])
  end

  def calculate
    Order.new do |order|
      order.start_date = @start_day
      order.end_date = @end_day
      order.days_amount = order_days_amount
      order.order_price = order_price
      order.service_plans = service_plans_combination
      order.title = order_title
    end
  end

  def order_days_amount
    (@end_day - @start_day).to_i
  end

  # the best order for customer
  def service_plans_combination
    plans = ServicePlan.all
    result = []
    i = order_days_amount
    while i > 0 do
      plan = plans.where('days <= ?', i).sort {|a, b| a.price * a.days <=> b.price * b.days }.first
      i -= plan.days
      result << plan
    end
    result
  end

  def order_price
    service_plans_combination.inject(0) { |s, plan| s += plan.price }
  end

  def order_title
    Time.now.to_s
  end

end
