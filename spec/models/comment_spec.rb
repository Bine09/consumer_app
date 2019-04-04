require 'rails_helper'  #to get access to the configuration we need to write RSpec tests.


describe Comment do
  it "comment is not valid without a text" do
    #a comment without a text but only a description is invalid.
    expect(Comment.new(body:"")).not_to be_valid
  end
end
