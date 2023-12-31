class UsersController < ApplicationController
  before_action :authorize, except: [:new, :create]

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params) # Not the final implementation!
    if @user.save
      redirect_to rooms_path
    else
      render 'new'
    end
  end

  def index
    @users = User.all
  end

    private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
