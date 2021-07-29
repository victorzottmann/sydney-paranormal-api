class UsersController < ApplicationController

  # GET ALL USERS
  def index
    @users = User.all
    render json: @users
  end


  # SIGN UP
  def create
    @user = User.create(user_params) 
    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}, status: 201 # Created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end


  # LOG IN
  def login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      # the method encode_token is defined in the Application Controller 
      token = encode_token({user_id: @user.id, username: @user.username})
      render json: {user: @user, token: token}, status: 200 # OK
    else
      render json: {error: "Invalid username or password"}, status: 401 # Not Authenticated
    end
  end


  private
    def user_params
      params.permit(:username, :email, :password, :password_confirmation)
    end
end
