class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.integer :reservation_id
      t.string :rating
      t.text :comment

      t.timestamps
    end
  end
end
