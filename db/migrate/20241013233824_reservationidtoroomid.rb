class Reservationidtoroomid < ActiveRecord::Migration[7.1]
  def change
    rename_column :reviews, :reservation_id, :room_id
  end
end
