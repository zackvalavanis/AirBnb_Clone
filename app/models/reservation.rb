class Reservation < ApplicationRecord
  belongs_to :user
  has_many :rooms
  has_many :reviews

  def tax
    if price == nil 
      tax = 0
    else 
      tax = price * 0.09
    end 
  end 

  def days 
    if start_date.nil? || end_date.nil?
      0 
    else 
      end_date - start_date
    end 
  end
   
  def total 
    if price.nil?
      0 
    else 
      (price * days) + tax
    end 
  end 


















end
