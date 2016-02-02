#From SQL
#SQL (0.6ms)  INSERT INTO "orders" ("start_date", "end_date", "created_at", "updated_at") VALUES
#($1, $2, $3, $4) RETURNING "id"  [["start_date", "2016-04-01 00:00:00.000000"], ["end_date", "2018-04-03 00:00:00.000000"],
#                                  ["created_at", "2016-02-02 14:11:46.333099"], ["updated_at", "2016-02-02 14:11:46.333099"]]


# From Rails Console
#<Order id: 8, title: nil,
#       start_date: "2016-04-01 00:00:00",
#       end_date: "2018-04-03 00:00:00",
#       days_amount: nil,
#       order_price: nil,
#       created_at: "2016-02-02 14:11:46",
#       updated_at: "2016-02-02 14:11:46">


#create_table "service_plans", force: :cascade do |t|
#  t.string   "title"
#  t.string   "description"
#  t.integer  "days"
#  t.float    "price"
#  t.datetime "created_at",  null: false
#  t.datetime "updated_at",  null: false
#end

#a = ServicePlans.all
#a = [a1, a2, a3]

#a1 #> [:days => 1, :price => 100]
#a2 #> [:days => 3, :price => 500]
#a3 #> [:days => 7, :price => 1000]






class ServiceCombintation

  def initialize(params)
    @start_day = params[:start_date]  # => 2016-04-01 00:00:00
    @end_day = params[:end_date] # => 2018-04-03 00:00:00
  end

  def order_days_amount(@start_day = start_day, @start_day = end_day)
    (end_day.to_date - start_day.to_date).to_i
  end




  def order_price days

    #отсеч по дням
    services_plans = ServicePlans.all
    a =[]

    #отсечь всё что изначально требует больше дней
    service_plans.each do |service_plan_hash|
      service_plan_hash[:days].each do |value|
        a << service_plan_hash if days >= value
      end
    end


    # все варианты суммирования значений дней
    service_plans.each do |service_plan_hash|
      service_plan_hash[:days].each do |value|
        a << service_plan_hash if days >= value
      end
    end



    service_plans.sort {|a,b|} = { "a" => 20, "b" => 30, "c" => 10  }
    h.sort                       #-> [["a", 20], ["b", 30], ["c", 10]]
    h.sort {|a,b| a[1]<=>b[1]}   #-> [["c", 10], ["a", 20], ["b", 30]]




    if a1[:price] + a2[:price] + a3[:price]

    a.each do |service_hash|
      service_hash.each do |key, value|
        #something
      end
      #something
    end
    c # самая выгодная комбинация сервисов
    end

    a<<
    1 отсечь по дням

    2 отсечь по условию
    3 выбрать минимальное
    4.ретёрн минимального значения
        перечислить по ид



  a.min




end