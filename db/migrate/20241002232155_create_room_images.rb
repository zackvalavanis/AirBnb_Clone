class CreateRoomImages < ActiveRecord::Migration[7.1]
  def change
    create_table :room_images do |t|
      t.integer :room_id
      t.text :url

      t.timestamps
    end
  end
end
