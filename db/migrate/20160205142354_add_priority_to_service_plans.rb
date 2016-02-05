class AddPriorityToServicePlans < ActiveRecord::Migration
  def change
    add_column :service_plans, :priority, :integer
  end
end
