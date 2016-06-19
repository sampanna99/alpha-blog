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
  def edit
    @chalaune = Chalaune.find(params[:id])
  end
  def update
    @chalaune = Chalaune.find(params[:id])
    if @chalaune.update(chalaune_params)
      flash[:success] = "your account is updated"
      redirect_to articles_path
      else
      render 'edit'
    end
  end
  def index
    @chalaunes = Chalaune.all
  end
  def show
    @chalaune = Chalaune.find(params[:id])
  end
  private
  def chalaune_params
    params.require(:chalaune).permit(:username, :email, :password)
  end
end