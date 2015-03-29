class ArticlesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :article

  def index
    @articles = Article.all.order(:title)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params) # Assign first
    @article.user = current_user # Then access attributes/associations

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  # GET /articles/search?q=
  def search
    @query = params[:q]
    @articles = []
    if @query.present?
      @articles = Article.where("lower(title) LIKE ?", "%#{@query.downcase}%")
    else
      @articles = Article.all.order(:title)
    end
  end

  private
  def article_params
      params.require(:article).permit(:title, :text, :poster, :poster_cache, :remove_poster)
  end

end
