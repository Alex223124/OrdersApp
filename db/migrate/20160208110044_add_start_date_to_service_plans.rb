class AddStartDateToServicePlans < ActiveRecord::Migration
  def change
    add_column :service_plans, :start_date, :datetime
  end
end
