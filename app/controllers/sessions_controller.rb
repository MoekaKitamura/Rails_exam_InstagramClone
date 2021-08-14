class SessionsController < ApplicationController
  before_action :already_logged_in, except: :destroy
  skip_before_action :login_required, only: [:new, :create]
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      redirect_to new_session_path, alert: '⚠️Not a valid account name or password.'
    end
  end
  def destroy
    session.delete(:user_id)
    redirect_to new_session_path, notice: 'You have been successfully logged out.'
  end
end