json.id user.id
json.name user.name
json.email user.email
# Do not include the password in the JSON response for security reasons

json.rooms user.rooms do |room| 
  json.id room.id
  json.address room.address
  json.city room.city
  json.state room.state
  json.price room.price
  json.description room.description
  json.home_type room.home_type
  json.room_type room.room_type
  json.total_occupancy room.total_occupancy
  json.total_bedrooms room.total_bedrooms
  json.total_bathrooms room.total_bathrooms
  json.created_at room.created_at
  json.updated_at room.updated_at
  
  # Iterate over room_images associated with the room
  json.room_images room.room_images do |image|
    json.id image.id
    json.url image.url  # or any other attributes you want to include
  end
end

json.reservations user.reservations do |reservation|
  json.id reservation.id
  json.start_date reservation.start_date
  json.end_date reservation.end_date
  # Include other reservation attributes as needed
end
