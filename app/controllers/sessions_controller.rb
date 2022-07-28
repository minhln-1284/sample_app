class SessionsController < ApplicationController
  before_action :find_by_email, only: :create

  def new; end

  def create
    if @user&.authenticate params[:session][:password]
      log_in @user
      params[:session][:remember_me] == "1" ? remember(@user) : forget(@user)
      redirect_to root_path
    else
      flash.now[:danger] = t ".invalid_email_password"
      render :new
    end
  end

  def destroy
    log_out if logged_in?

    redirect_to root_path
  end

  private
  def find_by_email
    @user = User.find_by email: params[:session][:email].downcase
    return if @user

    flash[:danger] = t ".cannot_find_email"
    redirect_to login_path
  end
end