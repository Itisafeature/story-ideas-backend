class Api::V1::CommentsController < ApplicationController

  def index
    comments = Comment.where(idea_id: params[:idea_id]).order_by_most_recent
    render json: CommentSerializer.new(comments)
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: CommentSerializer.new(comment), status: 201
    else
      errors = {}
      comment.errors.each do |key, value| 
        errors[key.attribute] = comment.errors[key.attribute][0] if !errors[key.attribute]
      end
      render json: errors, status: 400
    end
  end

  private 

  def comment_params
    params.require(:comment).permit(:content, :idea_id)
  end
end
