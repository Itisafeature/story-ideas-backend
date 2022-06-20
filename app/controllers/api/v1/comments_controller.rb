class CommentsController < ApplicationController

  def index
    idea = Idea.find_by_id(idea: params[:idea_id])
    comments = idea.comments.order_by_most_recent 
    render json: CommentSerializer(comments)
  end
end
