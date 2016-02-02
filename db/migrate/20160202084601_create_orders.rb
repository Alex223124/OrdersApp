class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :title
      t.datetime :time_period
      t.float :order_price

      t.timestamps null: false
    end
  end
end
