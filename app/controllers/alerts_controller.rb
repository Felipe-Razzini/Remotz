class AlertsController < ApplicationController
  def index
    @alerts = current_user.alerts
    @suggestions = Suggestion.all
    @alert = Alert.new
  end

  def new
    @alert = Alert.new
  end

  def create
    @alert = Alert.new(alert_params)
    @alert.user = current_user

    if @alert.save
      redirect_to alerts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @alert = Alert.find(params[:id])
    @alert.destroy
    redirect_to alerts_path, status: :see_other
  end

  private

  def alert_params
    params.required(:alert).permit(:title, :description)
  end

end
