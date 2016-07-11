Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_Zrn0utDEfTBYCBCw6zjC2wrw'],
  :secret_key      => ENV['sk_test_1KKDFZFQFLcN0VGcKGTuCgKD']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]


