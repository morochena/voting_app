class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #logs the user in and redirects to user show page
      log_in user
      redirect_to user
    else
      #create an error message
      flash.now[:danger] = "Invalid email or password"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
