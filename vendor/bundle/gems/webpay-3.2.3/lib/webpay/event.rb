class WebPay::Event < WebPay::ApiResource
  # Retrieve an event object by event id.
  #
  # @param params [EventIdRequest|Hash] Parameters to API call
  # @return [EventResponse]
  def retrieve(params = {})
    req = WebPay::EventIdRequest.create(params)
    raw_response = @client._request(:get, 'events' + '/' + req.id.to_s, req)
    WebPay::EventResponse.new(raw_response)
  end

  # List events filtered by params.
  #
  # @param params [EventListRequest|Hash] Parameters to API call
  # @return [EventResponseList]
  def all(params = {})
    req = WebPay::EventListRequest.create(params)
    raw_response = @client._request(:get, 'events', req)
    WebPay::EventResponseList.new(raw_response)
  end

end
