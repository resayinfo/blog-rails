class Api::CommentsController < Api::ApplicationController

  # before_filter :authenticate_user_from_token!
  # before_filter :authenticate_user!
  # load_and_authorize_resource

  before_action :set_comment, only: [:destroy, :update]


  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
      if @comment.save
        render json: @comment, status: :created
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
  end

  def update
    if @comment.update_attributes(comment_params)
      head :no_content
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    head :no_content
  end

  # def reorder
  #   comment_ids = []
  #   update_data = []
  #   params[:comments].each do |comment_data|
  #     comment_ids << comment_data[:id]
  #     update_data << { body: comment_data[:body] }
  #   end
  #
  #   if Comment.update(comment_ids, update_data)
  #     head :no_content
  #   else
  #     render json: { message: "Could not reorder comments." }
  #   end
  # end

  private

  def set_comment
    @comment = Comment.unscoped.find(params[:id])
  end

  def comment_params
    params.permit(:body, :commenter)
  end


end
