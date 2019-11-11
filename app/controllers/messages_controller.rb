class MessagesController < ApplicationController
  
  before_action :move_to_index, except: :index

  def index
    @messages = Message.includes(:user).page(params[:page]).per(3).order("created_at DESC")
  end

  def new
  end

  def create
    Message.create( text: message_params[:text], user_id: current_user.id)
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy if message.user_id == current_user.id
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    message = Message.find(params[:id])
    if message.user_id == current_user.id
      message.update(message_params)
    end
  end

  private
  def message_params
    params.permit(:text, :user_id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
