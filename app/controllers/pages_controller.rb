class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @user = current_user
    # user private chatrooms
    @private_chatrooms = policy_scope(PrivateChatroom).where(user: @user)
    # user private messages
    @message = PrivateMessage.new
  end
end
