class ServiceCombination

  def initialize(params)
    # склеить параметры 3 шт
    #From: /home/alexsologoub/ForRailsApps/myapp/app/services/service_combination.rb @ line 7 ServiceCombination#initialize:
    #3: def initialize(params)
    #4:   @start_day = params[:start_date]  # => 2016-04-01 00:00:00
    #5:   @end_day = params[:end_date] # => 2018-04-03 00:00:00
    #6:
    #=> 7:   binding.pry
    #8: end


    @start_day = params[:start_date]  # => 2016-04-01 00:00:00
    @end_day = params[:end_date] # => 2018-04-03 00:00:00

    binding.pry
  end

  def calculate
    Order.new do |order|
      order.days_amount = order_days_amount
      order.order_price = order_price
      order.orders_service_plans = order_combination
    end
  end

  # days [.....]
  def order_days_amount
    (@end_day.to_date - @start_day.to_date).to_i
  end

  # the best order for customer
  def order_combination
    plans = ServicePlan.all
    result = []
    i = order_days_amount
    while i > 0 do # т.к. если 0 то он лупит дальше
      plan = plans.where('days <= ?', i).sort {|a, b| a.price * a.days <=> b.price * b.days }.first
      i -= plan.days
      result << plan
    end
    result
  end

  # summa plateja
  def order_price
    a = order_combination
    b = 0
    order_combination.each do |a|
        b += a.price
    end
    b
  end

end
