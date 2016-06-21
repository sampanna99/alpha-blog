class ChalaunesController < ApplicationController
  before_action :set_chalaune, only: [:edit, :update, :show]
  before_action :require_same_chalaune, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]
  def new
    @chalaune = Chalaune.new
  end
  def create
    @chalaune = Chalaune.new(chalaune_params)
    if @chalaune.save
      session[:chalaune_id] = @chalaune.id
      flash[:success] = "welcome to the alpha blog #{@chalaune.username}"
      redirect_to chalaune_path(@chalaune)
      else
      render 'new'
    end
  end
  def edit
  end
  def update
    if @chalaune.update(chalaune_params)
      flash[:success] = "your account is updated"
      redirect_to articles_path
      else
      render 'edit'
    end
  end
  def index
    @chalaunes = Chalaune.paginate(page: params[:page], per_page: 5)
  end
  def show
    @chalaune_articles = @chalaune.articles.paginate(page: params[:page], per_page: 5)
  end
  def destroy
    @chalaune = Chalaune.find(params[:id])
    @chalaune.destroy
    flash[:danger] = "Chalaune and all articles created by chalaune have been deleted"
    redirect_to chalaunes_path
  end
  private
  def chalaune_params
    params.require(:chalaune).permit(:username, :email, :password)
  end
  def set_chalaune
    @chalaune = Chalaune.find(params[:id])
  end
  def require_same_chalaune
    if current_chalaune != @chalaune and !current_chalaune.admin?
      flash[:danger] = "you can only do things to your own account"
      redirect_to root_path
    end
  end
  def require_admin
    if logged_in? and !current_chalaune.admin?
      flash[:danger] = "only admin chalaune can perform the action you requested"
      redirect_to root_path
    end
  end
end