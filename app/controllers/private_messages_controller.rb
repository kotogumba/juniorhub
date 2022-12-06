class PrivateMessagesController < ApplicationController
  def create
    @private_chatroom = PrivateChatroom.find(params[:private_chatroom_id])
    @message = PrivateMessage.new(message_params)
    authorize @message
    @message.private_chatroom = @private_chatroom
    @message.user = current_user
    if @message.save
      PrivateChatroomChannel.broadcast_to(
        @private_chatroom,
        render_to_string(partial: "private_message", locals: {message: @message})
      )
      head :ok
    else
      render "private_chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:private_message).permit(:content)
  end
end
