$ ->
  App.conversation = App.cable.subscriptions.create { channel: "ConversationChannel", conversation_id: $('#messages').data('conversation-id') },
  #   connected: ->
  #     console.log "Connected"
  #
  #   disconnected: ->
  #     console.log "Disconnected"
  #
    received: (data) ->
      $('#messages').prepend(data)
      $('#message_content').val("")
