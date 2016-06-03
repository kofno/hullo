class WelcomeController < ApplicationController

  def show
    @conversation = Conversation.new
  end

end
