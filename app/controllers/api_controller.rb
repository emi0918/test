class ApiController < ApplicationController
   def pay
    webpay = WebPay.new('test_secret_0G19268uw3cd6JT4qGe8U9WF')
    webpay.charge.create(
       amount: 400,
   currency: "jpy",
   card: "tok_SampleCardToken"
    )
    render nothing: true
  end
end


