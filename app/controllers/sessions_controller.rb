class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      puts "params: #{params}"
      redirect_to rooms_path
    else
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
		@current_user = nil
    redirect_to new
  end
end
