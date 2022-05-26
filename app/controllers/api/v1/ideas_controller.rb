class Api::V1::IdeasController < ApplicationController

  def index
    ideas = Idea.all
    render json: IdeaSerializer.new(ideas) 
  end

  def show
    idea = Idea.find_by(id: params[:id])
    options = {}
    options[:params] = {id: params[:id]}
    render json: IdeaSerializer.new(idea, options)
  end


end
