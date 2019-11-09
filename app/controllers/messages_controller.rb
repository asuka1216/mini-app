class MessagesController < ApplicationController
  
  before_action :move_to_index, except: :index

  def index
    @messages = Message.page(params[:page]).per(5).order("created_at DESC")
  end

  def new
  end

  def create
    Message.create( text: message_params[:text], user_id: current_user.id)
  end

  private
  def message_params
    params.permit(:text, :user_id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
