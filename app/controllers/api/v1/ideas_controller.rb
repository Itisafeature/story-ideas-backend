class Api::V1::IdeasController < ApplicationController

  def index
    offset = params[:page].to_i * params[:limit].to_i
    ideas = Idea.order_by_created.offset(offset).limit(params[:limit])
    number_of_ideas = Idea.count
    options = {}
    options[:meta] = { total_count: number_of_ideas }
    render json: IdeaSerializer.new(ideas, options)
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

  def recently_commented
    ideas = Idea.most_recently_commented
    render json: IdeaSerializer.new(ideas)
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :content)
  end

end
