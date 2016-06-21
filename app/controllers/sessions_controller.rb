class SessionsController < ApplicationController
  def new
  end
  def create
    chalaune = Chalaune.find_by(email: params[:session][:email].downcase)
    if chalaune && chalaune.authenticate(params[:session][:password])
      session[:chalaune_id] = chalaune.id
      flash[:success] = "you have successfully logged in"
      redirect_to chalaune_path(chalaune)
      else
      flash.now[:danger] = "there is sth wrong"
      render 'new'
    end
  end
  def destroy
    session[:chalaune_id] = nil
    flash[:success] = "you have logged out"
    redirect_to root_path
  end
end