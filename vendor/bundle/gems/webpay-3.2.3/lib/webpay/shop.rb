class WebPay::Shop < WebPay::ApiResource
  # Create a shop object with given parameters.
  #
  # @param params [ShopRequestCreate|Hash] Parameters to API call
  # @return [ShopResponse]
  def create(params = {})
    req = WebPay::ShopRequestCreate.create(params)
    raw_response = @client._request(:post, 'shops', req)
    WebPay::ShopResponse.new(raw_response)
  end

  # Retrieve a shop object by shop id.
  #
  # @param params [ShopIdRequest|Hash] Parameters to API call
  # @return [ShopResponse]
  def retrieve(params = {})
    req = WebPay::ShopIdRequest.create(params)
    raw_response = @client._request(:get, 'shops' + '/' + req.id.to_s, req)
    WebPay::ShopResponse.new(raw_response)
  end

  # Update an existing shop with specified parameters.
  #
  # @param params [ShopRequestUpdate|Hash] Parameters to API call
  # @return [ShopResponse]
  def update(params = {})
    req = WebPay::ShopRequestUpdate.create(params)
    raw_response = @client._request(:post, 'shops' + '/' + req.id.to_s, req)
    WebPay::ShopResponse.new(raw_response)
  end

  # Alter the test shop's status to the specified one.
  #
  # @param params [ShopRequestAlterStatus|Hash] Parameters to API call
  # @return [ShopResponse]
  def alter_status(params = {})
    req = WebPay::ShopRequestAlterStatus.create(params)
    raw_response = @client._request(:post, 'shops' + '/' + req.id.to_s + '/' + 'alter_status', req)
    WebPay::ShopResponse.new(raw_response)
  end

  # List shops filtered by params.
  #
  # @param params [BasicListRequest|Hash] Parameters to API call
  # @return [ShopResponseList]
  def all(params = {})
    req = WebPay::BasicListRequest.create(params)
    raw_response = @client._request(:get, 'shops', req)
    WebPay::ShopResponseList.new(raw_response)
  end

end
