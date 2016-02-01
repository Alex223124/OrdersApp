class CreateServicePlans < ActiveRecord::Migration
  def change
    create_table :service_plans do |t|
      t.string :title
      t.string :description
      t.integer :days
      t.float :price

      t.timestamps null: false
    end
  end
end
