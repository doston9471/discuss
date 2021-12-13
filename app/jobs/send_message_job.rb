class SendMessageJob < ApplicationJob
  # include CableReady::Broadcaster
  queue_as :default

  def perform(message)
    mine = ApplicationController.render(
      partial: 'messages/mine',
      locals: { message: message }
    )

    theirs = ApplicationController.render(
      partial: 'messages/theirs',
      locals: { message: message }
    )

    ActionCable.server.broadcast("room_channel_#{message.room_id}", { mine: mine, theirs: theirs, message: message })

    # html = ApplicationController.render(
    #   partial: 'messages/theirs',
    #   locals: { message: message }
    # )

    # cable_ready["room_channel_#{message.room_id}"].insert_adjacent_html(
    #   selector: '#messages',
    #   position: 'beforeend',
    #   html: html
    # )
    # cable_ready.broadcast
  end
end
