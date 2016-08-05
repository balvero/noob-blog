class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.order('created_at desc').paginate(page: params[:page])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.first
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
      params.require(:article).permit(:title, :body)
    end

    def find_article
      @article = Article.find(params[:id])
    end

end