require 'faraday'
begin
  require 'mutli_json'
  JSON_CLASS = MultiJson
rescue LoadError
  require 'json'
  JSON_CLASS = JSON
end

class WebPay
  attr_reader :conn
  attr_accessor :charge
  attr_accessor :customer
  attr_accessor :token
  attr_accessor :event
  attr_accessor :shop
  attr_accessor :recursion
  attr_accessor :account

  # Initialize client
  #
  # @param options [Hash] options
  def initialize(auth_token, options = {})
    options = options.each_with_object({}) { |kv, obj| k,v = kv; obj[k.to_s] = v }

    connection_options = options['faraday_options'] || {}
    connection_options['headers'] = {

      "Content-Type" => "application/json",

      "Accept" => "application/json",

      "User-Agent" => "Apipa-webpay/3.2.3 ruby",

      "Accept-Language" => "en",
    }
    connection_options['url'] = options['api_base'] || 'https://api.webpay.jp/v1'
    @conn = Faraday.new(connection_options) do |builder|
      builder.request :url_encoded
      builder.adapter Faraday.default_adapter
    end


    @conn.authorization(:Bearer, auth_token)

    @charge = WebPay::Charge.new(self)
    @customer = WebPay::Customer.new(self)
    @token = WebPay::Token.new(self)
    @event = WebPay::Event.new(self)
    @shop = WebPay::Shop.new(self)
    @recursion = WebPay::Recursion.new(self)
    @account = WebPay::Account.new(self)
  end

  def set_accept_language(value)
    @conn.headers['Accept-Language'] = value
  end



  def receive_webhook(request_body)
    json_data =
      begin
        JSON_CLASS.load(request_body)
      rescue JSON_CLASS::ParserError => e
        raise WebPay::ApiConnectionError.new('Webhook request body is invalid JSON string', e)
      end
    WebPay::EventResponse.new(json_data)
  end

  def _request(method, path ,param_data)
    begin
      response = @conn.__send__(method) do |req|
        req.url(path)
        req.params = param_data.query_params
        req.body = JSON.dump(param_data.request_body)
      end
    rescue Faraday::Error::ClientError, URI::InvalidURIError => e
      raise WebPay::ApiConnectionError.in_request(e)
    end
    handle_response(response)
  end

  private

  # Infer encoding from response
  #
  # @param response [Faraday::Response]
  # @return [Encoding]
  def infer_encoding(response)
    unless (type = response.headers['content-type']) &&
        (charset = type.split(';').find { |field| field.include?('charset=') })
      return Encoding.default_external
    end

    encoding_string = charset.split('=', 2).last.strip
    Encoding.find(encoding_string)
  rescue
    Encoding.default_external
  end

  # Convert faraday response to a hash by decoding JSON.
  # This raises error if the response indicates error status.
  #
  # @api private
  # @param response [Faraday::Response]
  # @return [Hash] Raw object
  # @raise [WebPay::WebPayError] For invalid requests (4xx) or internal server error (5xx)
  def handle_response(response)
    data =
      begin
        JSON_CLASS.load(response.body.force_encoding(infer_encoding(response)))
      rescue JSON_CLASS::ParserError => e
        raise WebPay::ApiConnectionError.invalid_json(e)
      end
    data ||= {}
    status = response.status
    case status
    when 200..299
      data
    else
      if  status == 400
        raise WebPay::ErrorResponse::InvalidRequestError.new(status, data)
      end
      if  status == 401
        raise WebPay::ErrorResponse::AuthenticationError.new(status, data)
      end
      if  status == 402
        raise WebPay::ErrorResponse::CardError.new(status, data)
      end
      if  status == 404
        raise WebPay::ErrorResponse::InvalidRequestError.new(status, data)
      end
      if  true
        raise WebPay::ErrorResponse::ApiError.new(status, data)
      end
      raise "Unknown error is returned"
    end
  end
end

require 'webpay/api_resource'
require 'webpay/error'
require 'webpay/charge'
require 'webpay/customer'
require 'webpay/token'
require 'webpay/event'
require 'webpay/shop'
require 'webpay/recursion'
require 'webpay/account'
require 'webpay/data_types'
