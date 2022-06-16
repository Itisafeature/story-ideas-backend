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

  def create
    idea = Idea.new(idea_params)
    if idea.save
      render json: {status: 'success'}, status: 201
    else
      errors = {}
      idea.errors.each do |key, value| 
        errors[key.attribute] = idea.errors[key.attribute][0] if !errors[key.attribute]
      end
      render json: errors, status: 400
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :content)
  end

end
