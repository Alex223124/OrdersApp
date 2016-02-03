class Order < ActiveRecord::Base

  belongs_to :user
  has_many :orders_service_plans
  has_many :service_plans, through: :orders_service_plans
end


