class RecipesController < ApplicationController

  before_action :empty_ingredients

  def search
    @total_found = recipes_query.size
    @recipes = recipes_query.page params[:page]

    respond_to do |format|
      format.js
    end
  end

  private

  def empty_ingredients
    if params[:ingredients].nil? || params[:ingredients].reject(&:empty?).empty?
        render json: {error: "no ingredients provided"}, status: :unprocessable_entity
    end
  end

  def recipes_query
    @_recipes_query ||= Recipes::FindByIngredients.execute(params[:ingredients])
  end

end