# frozen_string_literal: true

class AddAddressAndProvinceToOrders < ActiveRecord::Migration[7.0]
  def column_exists_in_table?(table_name, column_name)
    ActiveRecord::Base.connection.column_exists?(table_name, column_name)
  end

  def change
    add_column :orders, :address, :string unless column_exists_in_table?(:orders, :address)
    add_column :orders, :province, :string
  end
end
