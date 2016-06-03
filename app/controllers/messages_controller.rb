class MessagesController < ApplicationController

  def index
    @conversation = Conversation.find_by!(name: params[:conversation_id])
    @messages = @conversation.messages.order(created_at: :desc)
    @message = @conversation.messages.new()
  end

  def create
    @conversation = Conversation.find_by!(name: params[:conversation_id])
    @message = @conversation.messages.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to @conversation }
        format.js { head :ok }
        ActionCable.server.broadcast(
          "conversation:#{@conversation.id}",
          render_to_string(@message)
        )
      else
        format.html { render :new }
        format.js { head :bad_request }
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end
