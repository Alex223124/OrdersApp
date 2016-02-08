class AddStartDayOfWeekToServicePlans < ActiveRecord::Migration
  def change
    add_column :service_plans, :start_day_of_week, :string
  end
end
