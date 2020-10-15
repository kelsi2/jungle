class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.password == params[:password]
      session[:user_id] = user.id
      redirect_to :root
    else
      redirect_to [:new, :session]
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to :root
  end

end
