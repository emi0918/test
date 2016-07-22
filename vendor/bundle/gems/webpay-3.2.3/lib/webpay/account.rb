class WebPay::Account < WebPay::ApiResource
  # Retrieve information of the current user.
  #
  # @param params [EmptyRequest|Hash] Parameters to API call
  # @return [AccountResponse]
  def retrieve(params = {})
    req = WebPay::EmptyRequest.create(params)
    raw_response = @client._request(:get, 'account', req)
    WebPay::AccountResponse.new(raw_response)
  end

  # Delete all test data of this account.
  #
  # @param params [EmptyRequest|Hash] Parameters to API call
  # @return [DeletedResponse]
  def delete_data(params = {})
    req = WebPay::EmptyRequest.create(params)
    raw_response = @client._request(:delete, 'account' + '/' + 'data', req)
    WebPay::DeletedResponse.new(raw_response)
  end

end
