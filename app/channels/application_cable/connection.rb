module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user  #will identify each connection by the current_user who's connected to the app

      def connect
        self.current_user = find_verified_user  #efine the current_user property once a user successfully connected. Only then the identified_by line before will actually work.
      end

      def disconnect

      end


  protected

      def find_verified_user     #will return a user record if the user is logged in. If the user isn't logged in, we're going to use Rails' default method to reject the connection attempt
          if verified_user = request.env['warden'].user #is an environment variable containing information about the current user. This is where Devise stores its data about the current user. If a user isn't logged in, this variable will be empty
            verified_user
          else
            reject_unauthorized_connection #is a Rails method to stop connection attempts
          end
        end

  end
end


# connection.rb file can be used to run any sort of code before the connection between a user and the server is established.
#This can be useful for authentication, for example. Here you can authenticate the users who are able to connect to the ActionCable server.
