class ReservationController < ApplicationController

    def index 
      if current_user 
        @reservations = Reservation.all 
        render :index
      else 
        render json: { message: 'Unauthorized'}, status: :unauthorized
      end 
    end
  
    def show 
      @reservation = Reservation.find_by(id: params[:id])
      render :show
    end
  
    def create
      @reservation = Reservation.new(
      user_id: params[:user_id],
      room_id: params[:room_id],
      start_date: params[:start_date],
      end_date: params[:end_date],
      price: params[:price],
      total: params[:total]
      )
      if @reservation.save
        render json: { message: 'The reservation has been saved.'}, status: :created
      else 
        render json: { error: @reservation.errors.full_messages}, status: :bad_request
      end
    end
  
    def update 
      @reservation = Reservation.find_by(id: params[:id])
      if  @reservation.update(
        user_id: params[:user_id] || @reservation.user_id,
        room_id: params[:room_id] || @reservation.room_id,
        start_date: params[:start_date] || @reservation.start_date,
        end_date: params[:end_date] || @reservation.end_date,
        price: params[:price] || @reservation.end_date,
        total: params[:total] || @reservation.end_date
      )
      render json: { message: 'The reservation has been updated.'}, status: :ok
      else 
        render json: { error: @reservation.errors.full_messages }, status: :bad_request
      end 
    end 
  
    def destroy 
      @reservation = Reservation.find_by(id: params[:id])
      @reservation.destroy
      render json: { message: 'The reservation has been destroyed'}
    end 
  end
end
