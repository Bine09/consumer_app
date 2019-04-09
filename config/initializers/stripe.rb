if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_n0rw80T9FxrMawjIgVBsc2sx00w1UMIhSw',
    secret_key: 'sk_test_HYfetNd2WTRlQOzh67jbe5T200lfRFESI2'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
