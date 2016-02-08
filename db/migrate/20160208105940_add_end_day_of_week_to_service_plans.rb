class AddEndDayOfWeekToServicePlans < ActiveRecord::Migration
  def change
    add_column :service_plans, :end_day_of_week, :string
  end
end
