class Integers < ActiveRecord::Migration[7.1]
  def change
    change_column :reservations, :price, :integer, using: 'price::integer'
    change_column :reservations, :total, :integer, using: 'total::integer'
  end
end
