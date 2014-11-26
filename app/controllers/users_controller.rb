class UsersController < ApplicationController

	def index

  end

  def show
    @user=User.find(session[:user_id])
    @pitches = @user.pitches.all

  end

  def new
  	@user = User.new
  end


  def create
    @user = User.new(user_params)
	    if @user.save
        session[:user_id] = @user.id
        redirect_to pitches_path
	    else
	      render :new
	    end
  end

  # delete...

# def create
#     auth = request.env["omniauth.auth"]
#     if user = User.find_by_provider_and_uid(auth["provider"], auth["uid"])
#       session[:user_id] = user.id
#       flash[:success] = ["You've successfully signed in!"]
#       redirect_to user
#     else
#       user = User.create_with_omniauth(auth)
#       session[:user_id] = user.id
#       flash[:success] = ["You have successfully signed in! Welcome to the site."]
#       redirect_to user
#     end
#   end

  def destroy
    @user = User.delete(current_user)
    session[:user_id] = nil
    redirect_to root_path
  end

  def edit

  end

  def update

  end

  private

  def user_params
  	params.require(:user).permit([:username, :password, :password_confirmation])
  end

end
