class OrdersServicePlan < ActiveRecord::Base
  belongs_to :order
  belongs_to :service_plan
end
