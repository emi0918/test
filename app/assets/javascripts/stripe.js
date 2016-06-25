Stripe.setPublishableKey('pk_test_Zrn0utDEfTBYCBCw6zjC2wrw');
Stripe.card.createToken({
  number: $('.card-number').val(),
  cvc: $('.card-cvc').val(),
  exp_month: $('.card-expiry-month').val(),
  exp_year: $('.card-expiry-year').val()
}, stripeResponseHandler);

function stripeResponseHandler(status, response) {

  // Grab the form:
  var $form = $('#payment-form');

  if (response.error) { // Problem!

    // Show the errors on the form
    $form.find('.payment-errors').text(response.error.message);
    $form.find('button').prop('disabled', false); // Re-enable submission

  } else { // Token was created!

    // Get the token ID:
    var token = response.id;

    // Insert the token into the form so it gets submitted to the server:
    $form.append($('<input type="hidden" name="stripeToken" />').val(token));

    // Submit the form:
    $form.get(0).submit();

  }
}

{
  id: "tok_u5dg20Gra", // Token identifier
  card: { // Dictionary of the card used to create the token
    name: null,
    address_line1: "12 Main Street",
    address_line2: "Apt 42",
    address_city: "Palo Alto",
    address_state: "CA",
    address_zip: "94301",
    address_country: "US",
    country: "US",
    exp_month: 2,
    exp_year: 2017,
    last4: "4242",
    object: "card",
    brand: "Visa",
    funding: "credit"
  },
  created: 1466743691, // Timestamp of when token was created
  livemode: true, // Whether this token was created with a live API key
  type: "card",
  object: "token", // Type of object, always "token"
  used: false // Whether this token has been used
}

{
  error: {
    type: "card_error", // Type of error
    code: "invalid_expiry_year", // Optional identifier of specific error
    message: "Your card's expiration year is invalid.", // Description of the error
    param: "exp_year" // Optional identifier of the offending parameter
  }
}



Stripe.card.validateCardNumber('4242424242424242')
Stripe.card.validateCardNumber('4242-42424242-4242')
Stripe.card.validateCardNumber('4242 4242 4242 4242')

// These invalid card numbers will all return false:

Stripe.card.validateCardNumber('4242-1111-1111-1111')
// (Doesn't pass the Luhn check.)
Stripe.card.validateCardNumber('12345678')
Stripe.card.validateCardNumber('mistake')


Stripe.bankAccount.createToken({
  country: $('.country').val(),
  currency: $('.currency').val(),
  routing_number: $('.routing-number').val(),
  account_number: $('.account-number').val(),
  account_holder_name: $('.name').val(),
  account_holder_type: $('.account_holder_type').val()
}, stripeResponseHandler);

function stripeResponseHandler(status, response) {

  // Grab the form:
  var $form = $('#payment-form');

  if (response.error) { // Problem!

    // Show the errors on the form:
    $form.find('.bank-errors').text(response.error.message);
    $form.find('button').prop('disabled', false); // Re-enable submission

  } else { // Token created!

    // Get the token ID:
    var token = response.id;

    // Insert the token into the form so it gets submitted to the server:
    $form.append($('<input type="hidden" name="stripeToken" />').val(token));

    // Submit the form:
    $form.get(0).submit();

  }
}


