class WebPay
  class ApiError < StandardError
  end

  class InvalidRequestError < ApiError
    attr_reader :bad_value

    def initialize(message, bad_value)
      super(message)
      @bad_value = bad_value
    end
  end

  class InvalidResponseError < ApiError
  end

  class ApiConnectionError < ApiError
    attr_reader :cause

    def self.in_request(cause)
      self.new("API request failed with #{cause}", cause)
    end

    def self.invalid_json(cause)
      self.new("Server responded invalid JSON string", cause)
    end

    def initialize(message, cause)
      @cause = cause
      super(message)
    end
  end

  module ErrorResponse
    class ErrorResponseError < WebPay::ApiError
      attr_reader :status, :data
      def initialize(message, status, data)
        super(message)
        @status = status
        @data = data
      end
    end

    class InvalidRequestError < ErrorResponseError
      def initialize(status, raw_data)
        data = WebPay::ErrorData.new(raw_data)
        message = sprintf('%s: %s', 'InvalidRequestError', data.error.message)
        super(message, status, data)
      end
    end
    class AuthenticationError < ErrorResponseError
      def initialize(status, raw_data)
        data = WebPay::ErrorData.new(raw_data)
        message = sprintf('%s: %s', 'AuthenticationError', data.error.message)
        super(message, status, data)
      end
    end
    class CardError < ErrorResponseError
      def initialize(status, raw_data)
        data = WebPay::ErrorData.new(raw_data)
        message = sprintf('%s: %s', 'CardError', data.error.message)
        super(message, status, data)
      end
    end
    class ApiError < ErrorResponseError
      def initialize(status, raw_data)
        data = WebPay::ErrorData.new(raw_data)
        message = sprintf('%s: %s', 'ApiError', data.error.message)
        super(message, status, data)
      end
    end
  end
end
