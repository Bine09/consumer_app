require 'rails_helper'  #to get access to the configuration we need to write RSpec tests.


describe User do

  let(:user) { User.create!(email: "", password:"abcdef") }

  it "user signup is not valid without an email" do
    expect(User.new(password: "abcdef")).not_to be_valid  #using .new instead of create! due to keeping the product just in memory not creating new and create! will raise an error if something goes wrong. we want the test pass.
  end


end
