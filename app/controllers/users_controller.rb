class UsersController < ApplicationController
 
    def create
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :created
    end

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def index
    users = User.all
    render json: users
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    render json: user
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: user
  end 

    private
    
    def user_params
      params.permit(:username, :password, :password_confirmation)
    end

end

# def user_params
#   params.permit(:username, :password, :password_confirmation)
# end
