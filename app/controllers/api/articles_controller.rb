class Api::ArticlesController < Api::ApplicationController

  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!
  load_and_authorize_resource

  before_action :set_article, only: [:show, :update, :destroy]

  # GET /articles
  def index
    @articles = Article.unscoped.order(:title)
    render json: @articles
  end

  # GET /articles/1
  def show
    json = @article.as_json
    if params[:expand].present? && params[:expand].split(',').include?('comments')
      json = @article.as_json(include: [:comments])
    end
    render json: json
  end

  # POST /articles
  def create
    @article = Article.new(article_params)
      if @article.save
        render json: @article, status: :created
      else
        render json: @article.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update_attributes(article_params)
      head :no_content
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.unscoped.find(params[:id])
    render json: @article
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    params.permit(:title, :author)
  end

end
