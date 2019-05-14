App.product = App.cable.subscriptions.create("ProductChannel", {  // This makes the current subscription available through App.product Whenever this line is executed, the subscription is created, and the subscribed method in the product_channel.rb is called
  connected: function() {
    // Called when the subscription is ready for use on the server. //tells your app which channel to connect to //connected is activated the moment a user successfully connected to the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel // received will be executed whenever the client receives any data from the server
     $(".alert.alert-info").show();

  }
});
