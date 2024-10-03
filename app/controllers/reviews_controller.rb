class ReviewsController < ApplicationController
  class ReservationController < ApplicationController

    def index 
      if current_user 
        @reviews = Review.all 
        render :index
      else 
        render json: { message: 'Unauthorized'}, status: :unauthorized
      end 
    end
  
    def show 
      @review = Review.find_by(id: params[:id])
      render :show
    end
  
    def create
      @review = Review.new(
        reservation_id: params[:reservation_id],
        rating: params[:rating],
        comment: params[:comment]
      )
      if @review.save
        render json: { message: 'The review has been saved.'}, status: :created
      else 
        render json: { error: @review.errors.full_messages}, status: :bad_request
      end
    end
  
    def update 
      @review = Review.find_by(id: params[:id])
      if  @review.update(
        reservation_id: params[:reservation_id] || @review.reservation_id,
        rating: params[:rating] || @reservation.rating,
        comment: params[:comment] || @reservation.comment
      )
      render json: { message: 'The review has been updated.'}, status: :ok
      else 
        render json: { error: @review.errors.full_messages }, status: :bad_request
      end 
    end 
  
    def destroy 
      @review = Review.find_by(id: params[:id])
      @review.destroy
      render json: { message: 'The reservation has been destroyed'}
    end 
  end
end

