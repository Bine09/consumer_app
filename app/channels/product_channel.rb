# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ProductChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "product_channel"
    # the moment a user subscribes to the channel
    # stream_from "some_channel"

  end

  def unsubscribed
    # as soon as a user leaves the channel (e.g. by closing the browser window)
    # Any cleanup needed when channel is unsubscribed
  end

  def listen(data) #This argument will contain the product ID
    stop_all_streams #If you want to make sure a user only streams from a single channel it can be very helpful to stop all streams just to make sure.
    stream_for data["product_id"] # Since we want to stream from a channel that's specific to one of the products, we can use stream_for and refer to the product ID
  end
end


# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
# Just like in controllers, you can add your own methods to this file
