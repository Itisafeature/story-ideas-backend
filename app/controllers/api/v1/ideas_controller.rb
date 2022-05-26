class Api::V1::IdeasController < ApplicationController

  def index
    ideas = Idea.all
    render json: IdeaSerializer.new(ideas) 
  end


end
