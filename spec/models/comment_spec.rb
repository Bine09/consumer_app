require 'rails_helper'  #to get access to the configuration we need to write RSpec tests.


describe Comment do #describe tells RSpec you're doing functional tests)
  it "comment is not valid without a text" do
    #a comment without a text but only a description is invalid.
    expect(Comment.new(body:"")).not_to be_valid
  end
end

describe Comment do
  it "comment is not valid without a validation" do #it means individual test
    #a comment without a validation is invalid.
    expect(Comment.new(rating:"")).not_to be_valid
  end
end

describe Comment do
  it "comment is not valid without a user" do #it means individual test
    #a comment without a validation is invalid.
    expect(Comment.new(user_id:"")).not_to be_valid
  end
end
