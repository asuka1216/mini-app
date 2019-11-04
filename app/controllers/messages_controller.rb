class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def new
  end

  def create
    Message.create(message_params)
  end

  private
  def message_params
    params.permit(:text)
  end

end
