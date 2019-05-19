  App.product = App.cable.subscriptions.create("ProductChannel", {  // This makes the current subscription available through App.product Whenever this line is executed, the subscription is created, and the subscribed method in the product_channel.rb is called
    connected: function() {
      App.product.listen_to_comments();  //call the listen_to_comments() method when a user opens the page
      // Called when the subscription is ready for use on the server. //tells your app which channel to connect to //connected is activated the moment a user successfully connected to the server
    },

    disconnected: function() {
      // Called when the subscription has been terminated by the server
    },


    received: function(data) {
      // Called when there's incoming data on the websocket for this channel // received will be executed whenever the client receives any data from the server
     // console.log(data);
     $(".alert.alert-info").show();
     $('.product-reviews').prepend(data.comment); //contains the partial
     $("#average-rating").attr('data-score', data.average_rating);
     refreshRating(); //to contain all the code to update Raty
     },

    listen_to_comments: function() {
      return this.perform('listen', {
      product_id: $("[data-product-id]").data("product-id") //first select that element and then grab the value of the data-product-id attribute
    });
    },
  });

  $(document).on('turbolinks:load', function() {
    App.product.listen_to_comments();
  });
