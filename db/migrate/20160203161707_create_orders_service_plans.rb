class CreateOrdersServicePlans < ActiveRecord::Migration
  def change
    create_table :orders_service_plans do |t|
      t.belongs_to :order, index: true, foreign_key: true
      t.belongs_to :service_plan, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
