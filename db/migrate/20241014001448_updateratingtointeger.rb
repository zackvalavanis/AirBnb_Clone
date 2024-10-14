class Updateratingtointeger < ActiveRecord::Migration[7.1]
  def change
    change_column :reviews, :rating, :integer, using: 'rating::integer'
  end
end
