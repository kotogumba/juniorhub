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

  def new_messages
    skip_authorization
    @new_messages = current_user.new_messages

    respond_to do |format|
      format.html
      format.json { render json: @new_messages }
    end
  end

  def read_messages
    skip_authorization

    @private_chatroom = PrivateChatroom.find(params[:chat])
    @private_messages = @private_chatroom.private_messages.where(user_id: params[:id])
    @private_messages.each do |message|
      message.update(new: false)
    end
  end

  private

  def message_params
    params.require(:private_message).permit(:content)
  end
end
