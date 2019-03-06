class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to user_path(current_user)
    end
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      ## its really them, log them in, and remember who they are
      session[:user_id] = user.id
      ## this should be stored in the browser and sent back in new reqs somehow
      ## redirect to the homepage
      redirect_to user_path(user)
    else
      @message = "We couldn't log you in. Wrong username or password."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
