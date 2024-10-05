class Reservation < ApplicationRecord
  belongs_to :user
  has_many :rooms
  has_many :reviews

  def tax
    tax = (price * 0.09).to_i
  end 

  # def days 
  #   if start_date.nil? || end_date.nil?
  #     0 
  #   else 
  #     end_date - start_date
  #   end 
  # end
   
  def total 
    if price.nil?
      0 
    else 
      price + tax
    end 
  end 
end
