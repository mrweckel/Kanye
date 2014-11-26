class SessionsController < ApplicationController

  def create
    @user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to log_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end

# Don't leave commented out cruft on master

  # def create
  #   auth = request.env['omniauth.auth']
  #   user = User.find_or_initialize_by(uid: auth['uid'])
  #   user.token = auth['credentials']['token']
  #   user.name = auth['info']['name']
  #   user.save
  #   session[:user_id] = user.id
  #   redirect_to new_video_path
  # end

  # def fail
  #   render text: "An error has occured: #{params[:message]}."
  # end

