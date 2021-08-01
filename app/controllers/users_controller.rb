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
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      # the method encode_token is defined in the Application Controller 
      token = encode_token({user_id: @user.id, email: @user.email, time: Time.now})
      render json: {user: @user, token: token}, status: 200 # OK
    else
      render json: {error: "Invalid username or password"}, status: 401 # Not Authenticated
    end
  end


  # LOG OUT
  def logout

  end


  def get_user

    a = decoded_token
    if a != nil 
      user_id = a[0]['user_id']
      @user = User.find(user_id)
      render json: {loggedin: true, user_name: @user['username'], user_id: user_id}, status: 200 # OK
    else
      render json: {loggedin: false}, status: 200 # OK
    end

  end


  private
    def user_params
      params.permit(:username, :email, :password, :password_confirmation)
    end
end
