class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
    @message = Message.new
  end

  def new
    @chatroom = Chatroom.new
    authorize @chatroom
    # redirect_to dashboard_path
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    authorize @chatroom
    @chatroom.save
    redirect_to chatroom_path(@chatroom)
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
