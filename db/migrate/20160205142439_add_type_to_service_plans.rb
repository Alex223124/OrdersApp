class AddTypeToServicePlans < ActiveRecord::Migration
  def change
    add_column :service_plans, :type, :string
  end
end
