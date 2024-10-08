class UsersController < ApplicationController
  def index 
    if current_user
      @users = User.all 
      render :index
    else 
      render json: { message: 'Please log in to view reservations'}
    end 
  end

  def show 
    @user = User.find_by(id: params[:id])
    render :show
  end

  def create
    @user = User.new(
      name: params[:name], 
      email: params[:email], 
      password: params[:password], 
      password_confirmation: params[:password_confirmation],
      image: params[:image]
    )
    if @user.save
      render json: { message: 'The user has been created!'}, status: :created
    else 
      render json: { error: @user.errors.full_messages }, status: :bad_request
  end 
end
end
