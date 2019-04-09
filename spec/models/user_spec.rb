# require 'rails_helper'  #to get access to the configuration we need to write RSpec tests.
#
#
# describe User do
#
#   let(:user) { User.create!(email: "", password:"abcdef") }
#
#   it "user signup is not valid without an email" do
#     expect(User.new(password: "abcdef")).not_to be_valid  #using .new instead of create! due to keeping the product just in memory not creating new and create! will raise an error if something goes wrong. we want the test pass.
#   end
#
#
# end


require "rails_helper"

describe User, type: :model do
  it "should not validate users without an email address" do
    @user = FactoryBot.build(:user, email: "not_an_email")
    expect(@user).to_not be_valid
  end
end


# Notice how we use build instead of create here? Remember, if we were to use create, the test would fail because a user cannot be created without a valid email address.
# With FactoryBot, build will basically do the same thing as new.
# Using build will generate the user only in the memory and not save it to the database. This way, you can test validations individually after "building" a user.
