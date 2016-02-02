class AddDaysToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :days_amount, :integer
  end
end
