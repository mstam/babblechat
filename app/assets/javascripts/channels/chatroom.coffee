jQuery(document).on 'turbolinks:load', ->
  chatbox = $('#chat-box')
  if $('#chat-box').length > 0
    messages_to_bottom = -> chatbox.scrollTop(chatbox.prop('scrollHeight'))

    messages_to_bottom()
    App.chatroom = App.cable.subscriptions.create {
        channel: 'ChatroomChannel'
        dialect_pick: chatbox.data('dialect-pick')
      },
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      $('#chat-box .panel-body').append data["message"]
      messages_to_bottom()

    speak: (message, dialect_pick) ->
      @perform 'speak', message: message, dialect_pick: dialect_pick

    $('#message_dialect').change ->
      chatbox.data('dialect-pick', $('#message_dialect :selected').val() )
    $('#new_message').submit (e) ->
      $this = $(this)
      textarea = $this.find('#message_content')
      if $.trim(textarea.val()).length > 1
        App.chatroom.speak textarea.val(), chatbox.data('dialect-pick')
        textarea.val('')
      e.preventDefault()
      return false
