class PaymentsController < ApplicationController
before_action :authenticate_user!

  def create
    @product = Product.find(params[:product_id])
    @user = current_user


      token = params[:stripeToken]

      # Create the charge on Stripe's servers - this will charge the user's card
      begin
        charge = Stripe::Charge.create(
          amount: (@product.price*100).to_i,
          currency: "eur",
          source: token,
          description: params[:stripeEmail]
        )

        if charge.paid     # a conditional to check whether or not the payment was successful
          Order.create(     #inside that conditional create a new Order. (remember, create is a combination of new and save!
            product_id: @product.id,
            user_id: @user.id,
            total: @product.price)

           flash[:success] = "Your payment was successful"
        end

      rescue Stripe::CardError => e
        # The card has been declined
        body = e.json_body
        err = body[:error]

        flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
      end

      redirect_to product_path(@product)

  end
end
