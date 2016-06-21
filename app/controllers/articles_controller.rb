class ArticlesController < ApplicationController
  before_action :set_params, only: [:edit, :update, :show, :destroy]
  before_action :require_chalaune, except: [:index, :show]
  before_action :require_same_chalaune, only: [:edit, :update, :destroy]
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end
def new
  @article = Article.new
end
  def create
   # render plain: params[:article].inspect
    @article = Article.new(article_params)
   @article.chalaune = current_chalaune
    if @article.save
      flash[:success] = "Article was successfully created"
    redirect_to article_path(@article)
      else
      render 'new'
    end
  end
  def show

  end
  def destroy

    @article.destroy
    flash[:danger] = "article was successfully deleated"
    redirect_to articles_path
  end

  def edit


  end
  def update
    if @article.update(article_params)
      flash[:update] = "article is successfully updated"
      else
      render 'edit'
    end

  end
  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
  def set_params
    @article = Article.find(params[:id])
  end
  def require_same_chalaune
    if current_chalaune != @article.chalaune and !current_chalaune.admin?
      flash[:danger] = "you can only edit or delete your own articles"
      redirect_to root_path
    end
  end

end