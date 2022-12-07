class PrivateChatroomsController < ApplicationController
  def show
    @private_chatroom = PrivateChatroom.find(params[:id])
    authorize @private_chatroom
    @private_message = PrivateMessage.new
  end

  def new
    @private_chatroom = PrivateChatroom.new
    authorize @private_chatroom
  end

  def create

    @private_chatroom = PrivateChatroom.new(user_sender_id: params[:user_sender_id], user_reciever_id: params[:user_reciever_id])

    authorize @private_chatroom
    @private_chatroom.save
    redirect_to "/dashboard?tab=messages&id=#{params[:user_reciever_id]}"
  end

  # private

  # def private_chatroom_params
  #   params.require(:private_chatroom).permit(:user_sender_id, :user_reciever_id)
  # end
end
