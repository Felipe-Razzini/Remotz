class SuggestionsController < ApplicationController
  def index
    @suggestions = Suggestion.all
  end

  def show
    @suggestion = Suggestion.first
  end

  def create
    @suggestion = Suggestion.new(suggestion_params)
    if @suggestion.save
      redirect_to tasks_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def suggestion_params
    params.required(:suggestion).permit(:title, :description)
  end
end
