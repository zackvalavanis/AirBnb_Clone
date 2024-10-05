class Addtax < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :tax, :integer
  end
end
