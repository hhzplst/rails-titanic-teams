class UsersController < ApplicationController
  before_action :current_user
  before_action :prevent_login_signup, only: [:signup, :login]

  def index
  end

  def new
     @user = User.new
  end

  def show
  end

  def edit
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/", notice: "User created!"
    else
      render :new
    end
  end

  def login
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = User.where(username:params[:username]).first
      if found_user
        if found_user.is_admin
          admin_user = found_user.authenticate(params[:password])
        else
          authorized_user = found_user.authenticate(params[:password])
        end
      end
    end

  if admin_user
    session[:user_id] = admin_user.id
    session[:is_admin] = admin_user.id
  end

  if !found_user
    flash.now[:alert] = "Invalid username"
    render :login

  elsif !authorized_user && !admin_user
    flash.now[:alert] = "Invalid password"
    render :login

  else
    if !admin_user
      session[:user_id] = authorized_user.id
    end
    flash[:notice] = "You are now logged in."
    redirect_to "/"
  end

end


  def logout
    session[:user_id] = nil
    session[:is_admin] = nil
    redirect_to "/", notice: "You've sucessfully logged out!"
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :password_digest, :password_confirmation)
    end
end
