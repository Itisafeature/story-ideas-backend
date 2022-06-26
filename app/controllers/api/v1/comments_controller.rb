class Api::V1::CommentsController < ApplicationController

  def index
    offset = params[:page].to_i * params[:limit].to_i
    comments = Comment.where(idea_id: params[:idea_id])
              .order_by_most_recent.offset(offset).limit(params[:limit])
    number_of_comments = Comment.where(idea_id: params[:idea_id]).size
    options = {}
    options[:meta] = { total_count: number_of_comments }
    render json: CommentSerializer.new(comments, options)
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
