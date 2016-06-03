class ConversationsController < ApplicationController

  def new
    @conversation = Conversation.new
  end

  def create
    @conversation = Conversation.start
    if @conversation.save
      flash[:notice] = "Conversation started!"
      redirect_to conversation_messages_url(@conversation)
    else
      render :new
    end
  end

  def show
    @conversation = Conversation.find_by_name!(params[:id])
    redirect_to conversation_messages_url(@conversation)
  end

end
