class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new

    redirect_to chatroom_path(@chatroom)
  end


  # def chatroom_params
  #   params.required(:chatroom).permit(:name)
  # end
end
