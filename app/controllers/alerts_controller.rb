class AlertsController < ApplicationController
  def index
    @alerts = Alert.all
    @suggestions = Suggestion.all
  end

  def new
    @alert = Alert.new
  end

  def create
    @alert = Alert.new(alert_params)
    @alert.user = current_user
    if @alert.save
      redirect_to tasks_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @alert.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def alert_params
    params.required(:alert).permit(:title, :description)
  end

end
