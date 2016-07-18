class WebPay::Recursion < WebPay::ApiResource
  # Create a recursion object with given parameters.
  #
  # @param params [RecursionRequestCreate|Hash] Parameters to API call
  # @return [RecursionResponse]
  def create(params = {})
    req = WebPay::RecursionRequestCreate.create(params)
    raw_response = @client._request(:post, 'recursions', req)
    WebPay::RecursionResponse.new(raw_response)
  end

  # Retrieve a recursion object by recursion id.
  # If the recursion is already deleted, "deleted" attribute becomes true.
  #
  # @param params [RecursionIdRequest|Hash] Parameters to API call
  # @return [RecursionResponse]
  def retrieve(params = {})
    req = WebPay::RecursionIdRequest.create(params)
    raw_response = @client._request(:get, 'recursions' + '/' + req.id.to_s, req)
    WebPay::RecursionResponse.new(raw_response)
  end

  # Resume a suspended recursion.
  #
  # @param params [RecursionRequestResume|Hash] Parameters to API call
  # @return [RecursionResponse]
  def resume(params = {})
    req = WebPay::RecursionRequestResume.create(params)
    raw_response = @client._request(:post, 'recursions' + '/' + req.id.to_s + '/' + 'resume', req)
    WebPay::RecursionResponse.new(raw_response)
  end

  # Delete an existing recursion.
  #
  # @param params [RecursionIdRequest|Hash] Parameters to API call
  # @return [RecursionResponse]
  def delete(params = {})
    req = WebPay::RecursionIdRequest.create(params)
    raw_response = @client._request(:delete, 'recursions' + '/' + req.id.to_s, req)
    WebPay::RecursionResponse.new(raw_response)
  end

  # List recursions filtered by params.
  #
  # @param params [RecursionListRequest|Hash] Parameters to API call
  # @return [RecursionResponseList]
  def all(params = {})
    req = WebPay::RecursionListRequest.create(params)
    raw_response = @client._request(:get, 'recursions', req)
    WebPay::RecursionResponseList.new(raw_response)
  end

end
