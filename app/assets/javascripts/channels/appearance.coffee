App.appearance = App.cable.subscriptions.create "AppearanceChannel",
  connected: ->

  disconnected: ->

  received: (data) ->
    appearances_html = ('<p>' + appearance + '</p><hr>' for appearance in data['appearances'])
    document.getElementById('online-box').innerHTML = appearances_html.join('')
