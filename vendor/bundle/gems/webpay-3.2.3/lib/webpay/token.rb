class WebPay::Token < WebPay::ApiResource
  # Create a token object with given parameters.
  #
  # @param params [TokenRequestCreate|Hash] Parameters to API call
  # @return [TokenResponse]
  def create(params = {})
    req = WebPay::TokenRequestCreate.create(params)
    raw_response = @client._request(:post, 'tokens', req)
    WebPay::TokenResponse.new(raw_response)
  end

  # Retrieve a token object by token id.
  #
  # @param params [TokenIdRequest|Hash] Parameters to API call
  # @return [TokenResponse]
  def retrieve(params = {})
    req = WebPay::TokenIdRequest.create(params)
    raw_response = @client._request(:get, 'tokens' + '/' + req.id.to_s, req)
    WebPay::TokenResponse.new(raw_response)
  end

end
