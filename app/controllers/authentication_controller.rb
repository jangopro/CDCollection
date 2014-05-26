class AuthenticationController < ApplicationController

  #À utiliser lorsqu'on doit être logué pour voir le contenu
  #before_filter :authenticate_user, :only => [:account_settings, :set_account_info]

  def sign_in
    @user = User.new
  end

  def login
    username_or_email = params[:user][:username]
    password = params[:user][:password]

    if username_or_email.rindex('@')
      email=username_or_email
      user = User.authenticate_by_email(email, password)
    else
      username=username_or_email
      user = User.authenticate_by_username(username, password)
    end

    if user
      session[:user_id] = user.id
      redirect_to profil_path(:id => current_user.id)
    else
      flash.now[:error] = 'Unknown user. Please check your username and password.'
      render :action => "sign_in"
    end

  end

  def new_user
    @user = User.new
  end

  def register
    @user = User.new(user_params)

    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to profil_path(:id => current_user.id)
    else
      render :action => "new_user"
    end
  end

  def signed_out
    session[:user_id] = nil
    redirect_to :root
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :salt, :encrypted_password)
  end

end