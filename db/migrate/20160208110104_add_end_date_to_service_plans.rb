class AddEndDateToServicePlans < ActiveRecord::Migration
  def change
    add_column :service_plans, :end_date, :datetime
  end
end
