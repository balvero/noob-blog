class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except:[:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.order('created_at desc').paginate(page: params[:page])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = 'Article was successfully created.'
      redirect_to article_path(@article)
    else
      render 'new'
    end

  end

  def show

  end

  def edit

  end

  def update
    if @article.update(article_params)
      flash[:success] = 'Article was successfully updated.'
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:warning] = 'Article was successfully deleted.'
    redirect_to articles_path
  end


  private

    def article_params
      params.require(:article).permit(:title, :body, category_ids: [])
    end

    def find_article
      @article = Article.find(params[:id])
    end

    def require_same_user
      if current_user != @article.user and !current_user.admin?
        flash[:danger] = 'You can only edit or delete your own articles.'
        redirect_to root_path
      end
    end

end