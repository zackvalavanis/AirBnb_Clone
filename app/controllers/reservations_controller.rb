class ReservationsController < ApplicationController

  def index 
    if current_user 
      @reservations = Reservation.all
    else 
      render json: { error: 'You dont currently have any reservations.'}
    end 
  end

  def show 
    @reservation = Reservation.find_by(id: params[:id]);
    if current_user
    render :show
    else 
    render json: { error: "You do not have a reservation under that name."}
    end
  end 

  def create
    @reservation = Reservation.new(
      user_id: current_user,
      room_id: params[:room_id], 
      start_date: params[:start_date], 
      end_date: params[:end_date], 
      price: params[:price], 
      total: params[:total]
    )
    @reservation.save 
  end 

  










end
