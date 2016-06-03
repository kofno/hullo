# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ConversationChannel < ApplicationCable::Channel

  def subscribed
    Rails.logger.info params.inspect
    stream_from "conversation:#{params[:conversation_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

end
