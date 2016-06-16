class ChalaunesController < ApplicationController
  def new
    @chalaune = Chalaune.new
  end
  def create
    @chalaune = Chalaune.new(chalaune_params)
    if @chalaune.save
      flash[:success] = "welcome to the alpha blog #{@chalaune.username}"
      redirect_to articles_path
      else
      render 'new'
    end
  end
  private
  def chalaune_params
    params.require(:chalaune).permit(:username, :email, :password)
  end
end