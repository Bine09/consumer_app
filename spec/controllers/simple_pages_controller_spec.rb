require 'rails_helper'

describe SimplePagesController, type: :controller do   #indicate that we are testing our SimplePagesController and tell RSpec that we are testing a controller with type: :controller
  context 'GET #index' do                          #call the context "GET #index" because we make an HTTP GET request of the index action. the test simulates the same request a user would make from their browser by calling the get method and passing it the name of the action we are testing, get :index
    it 'renders the index template' do
      get :index
      expect(response).to be_ok               #first assertion checks to see if the response was OK
      expect(response).to render_template('index')  # second assertion checks that the expected template was rendered
    end
  end
end
