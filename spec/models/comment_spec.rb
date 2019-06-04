require 'rails_helper'  #to get access to the configuration we need to write RSpec tests.


describe Comment do #describe tells RSpec you're doing functional tests)
  let(:product) { Product.create!(name: "race bike") }  #.create! essentially does the same thing as .create. The main difference is that if something goes wrong, .create! will raise an exception, while .create won't.
                                                        #Also remember, .create! is a combination of .new (to generate a new product) and .save! (to save the newly generated product to the database).
  let(:user) { User.create!(email: "xyz@gmx.de", password:"abcdef") }

  it "creating comment needs body, user, product and rating as integer" do
    #a comment without a text but only a description is invalid.
    expect(Comment.new(body:"test text", user: user, product: product, rating: 5)).to be_valid
  end

  it "createing comment fails if body is blank" do
    #a comment without a text but only a description is invalid.
    expect(Comment.new(body:"", user: user, product: product, rating: 5)).not_to be_valid
  end

  it "createing comment fails if user is missing" do
    #a comment without a text but only a description is invalid.
    expect(Comment.new(body:"test text", user: nil, product: product, rating: 5)).not_to be_valid
  end

  it "createing comment fails if product is missing" do
    #a comment without a text but only a description is invalid.
    expect(Comment.new(body:"test text", user: user, product: nil, rating: 5)).not_to be_valid
  end

  it "createing comment fails if rating is missing" do
    #a comment without a text but only a description is invalid.
    expect(Comment.new(body:"test text", user: user, product: product, rating: nil)).not_to be_valid
  end

  it "createing comment fails if rating is not integer" do
    #a comment without a text but only a description is invalid.
    expect(Comment.new(body:"test text", user: user, product: product, rating: "tesad")).not_to be_valid
  end

end
