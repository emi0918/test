class WebPay::Charge < WebPay::ApiResource
  # Create a charge object with given parameters.
  # In live mode, this issues a transaction.
  #
  # @param params [ChargeRequestCreate|Hash] Parameters to API call
  # @return [ChargeResponse]
  def create(params = {})
    req = WebPay::ChargeRequestCreate.create(params)
    raw_response = @client._request(:post, 'charges', req)
    WebPay::ChargeResponse.new(raw_response)
  end

  # Retrieve a existing charge object by charge id.
  #
  # @param params [ChargeIdRequest|Hash] Parameters to API call
  # @return [ChargeResponse]
  def retrieve(params = {})
    req = WebPay::ChargeIdRequest.create(params)
    raw_response = @client._request(:get, 'charges' + '/' + req.id.to_s, req)
    WebPay::ChargeResponse.new(raw_response)
  end

  # Refund a paid charge specified by charge id.
  # Optional argument amount is to refund partially.
  #
  # @param params [ChargeRequestRefund|Hash] Parameters to API call
  # @return [ChargeResponse]
  def refund(params = {})
    req = WebPay::ChargeRequestRefund.create(params)
    raw_response = @client._request(:post, 'charges' + '/' + req.id.to_s + '/' + 'refund', req)
    WebPay::ChargeResponse.new(raw_response)
  end

  # Capture a not captured charge specified by charge id.
  #
  # @param params [ChargeRequestWithAmount|Hash] Parameters to API call
  # @return [ChargeResponse]
  def capture(params = {})
    req = WebPay::ChargeRequestWithAmount.create(params)
    raw_response = @client._request(:post, 'charges' + '/' + req.id.to_s + '/' + 'capture', req)
    WebPay::ChargeResponse.new(raw_response)
  end

  # List charges filtered by params.
  #
  # @param params [ChargeListRequest|Hash] Parameters to API call
  # @return [ChargeResponseList]
  def all(params = {})
    req = WebPay::ChargeListRequest.create(params)
    raw_response = @client._request(:get, 'charges', req)
    WebPay::ChargeResponseList.new(raw_response)
  end

end
