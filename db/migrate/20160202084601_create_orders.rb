class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :title
      t.datetime :start_date
      t.datetime :end_date
      t.integer :days_amount
      t.float :order_price

      t.timestamps null: false
    end
  end
end

