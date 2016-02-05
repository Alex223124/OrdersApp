class ServicePlan < ActiveRecord::Base

  self.inheritance_column = :type

  def self.sub_types
    %w(StandardPlan SpecialPlan RepeatablePlan)
  end


  belongs_to :user
  has_many :orders_service_plans
  has_many :orders, through: :orders_service_plans

  scope :standard_service_plans, -> { where(type: 'StandardPlan') }
  scope :special_service_plans, -> { where(type: 'SpecialPlan') }
  scope :repeatable_service_plans, -> { where(race: 'RepeatablePlan') }

end
