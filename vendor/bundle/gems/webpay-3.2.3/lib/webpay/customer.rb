class WebPay::Customer < WebPay::ApiResource
  # Create a customer object with given parameters.
  #
  # @param params [CustomerRequestCreate|Hash] Parameters to API call
  # @return [CustomerResponse]
  def create(params = {})
    req = WebPay::CustomerRequestCreate.create(params)
    raw_response = @client._request(:post, 'customers', req)
    WebPay::CustomerResponse.new(raw_response)
  end

  # Retrieve a customer object by customer id.
  # If the customer is already deleted, "deleted" attribute becomes true.
  #
  # @param params [CustomerIdRequest|Hash] Parameters to API call
  # @return [CustomerResponse]
  def retrieve(params = {})
    req = WebPay::CustomerIdRequest.create(params)
    raw_response = @client._request(:get, 'customers' + '/' + req.id.to_s, req)
    WebPay::CustomerResponse.new(raw_response)
  end

  # Update an existing customer with specified parameters.
  #
  # @param params [CustomerRequestUpdate|Hash] Parameters to API call
  # @return [CustomerResponse]
  def update(params = {})
    req = WebPay::CustomerRequestUpdate.create(params)
    raw_response = @client._request(:post, 'customers' + '/' + req.id.to_s, req)
    WebPay::CustomerResponse.new(raw_response)
  end

  # Delete an existing customer.
  #
  # @param params [CustomerIdRequest|Hash] Parameters to API call
  # @return [CustomerResponse]
  def delete(params = {})
    req = WebPay::CustomerIdRequest.create(params)
    raw_response = @client._request(:delete, 'customers' + '/' + req.id.to_s, req)
    WebPay::CustomerResponse.new(raw_response)
  end

  # List customers filtered by params.
  #
  # @param params [BasicListRequest|Hash] Parameters to API call
  # @return [CustomerResponseList]
  def all(params = {})
    req = WebPay::BasicListRequest.create(params)
    raw_response = @client._request(:get, 'customers', req)
    WebPay::CustomerResponseList.new(raw_response)
  end

  # Delete a card data of a customer.
  #
  # @param params [CustomerIdRequest|Hash] Parameters to API call
  # @return [CustomerResponse]
  def delete_active_card(params = {})
    req = WebPay::CustomerIdRequest.create(params)
    raw_response = @client._request(:delete, 'customers' + '/' + req.id.to_s + '/' + 'active_card', req)
    WebPay::CustomerResponse.new(raw_response)
  end

end
