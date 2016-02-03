class ServicePlan < ActiveRecord::Base

  belongs_to :user
  has_many :orders_service_plans
  has_many :orders, through: :orders_service_plans
end


