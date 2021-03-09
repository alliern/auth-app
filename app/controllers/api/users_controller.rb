class Api::UsersController < ApplicationController

  def create
    @user = User.new
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation] 

    if @user.save
      render json: {message: "User successfully created!"}, status: :created
    else
      render json: {error: user.errors.full_messages}, status: :bad_request
    end

  end

  def show
   if current_user
    @user = User.find_by(id: params[:id])
    render "show.json.jb"
   else
    render json: {message: "you must be logged in to view this!"}
   end
  end

end
