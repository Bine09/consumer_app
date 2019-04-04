require 'rails_helper'  #to get access to the configuration we need to write RSpec tests.


describe Product do
  let(:product) { Product.create!(name: "race bike") }  #.create! essentially does the same thing as .create. The main difference is that if something goes wrong, .create! will raise an exception, while .create won't.
                                                        #Also remember, .create! is a combination of .new (to generate a new product) and .save! (to save the newly generated product to the database).
  let(:user) { User.create!(email: "xyz@gmx.de", password:"abcdef") }

  before do
  product.comments.create!(rating: 1, user: user, body: "Awful bike!")  # reminder: comments needs to be plural because you set up your Product model to have many comments.
  product.comments.create!(rating: 3, user: user, body: "Ok bike!")
  product.comments.create!(rating: 5, user: user, body: "Great bike!")
  end

  it "returns the average rating of all comments" do
    #"Expect the product's average rating to equal 3" (The average of 1, 3, and 5 should be 3)
    expect(product.average_rating).to eq 3
  end

  it "product is not valid without a name" do
    #a product without a name but only a description is invalid.
    expect(Product.new(description: "Nice bike")).not_to be_valid  #using .new instead of create! due to keeping the product just in memory not creating new and create! will raise an error if something goes wrong. we want the test pass.
  end


end
