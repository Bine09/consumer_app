class ProductChannel < ApplicationCable::Channel
  def subscribed
    stream_from "product_channel"
    # the moment a user subscribes to the channel
    # stream_from "some_channel"

  end

  def unsubscribed
    # as soon as a user leaves the channel (e.g. by closing the browser window)
    # Any cleanup needed when channel is unsubscribed
  end
end


# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
# Just like in controllers, you can add your own methods to this file
