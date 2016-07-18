class WebPay
  class Entity
    # Remove nil values and stringify keys
    def normalize_hash(hash)
      hash.each_with_object({}) { |kv, obj| k,v = kv; obj[k.to_s] = v unless v == nil }
    end

    # Convert attributes and its children to pure-Ruby hash
    # @return [Hash] pure ruby hash including no user objects
    def to_h
      @attributes.each_with_object({}) do |kv, obj|
        k, v = kv
        next if v == nil
        obj[k] =
          case v
          when Entity
            v.to_h
          when Array
            v.map { |elem| elem.respond_to?(:to_h) ? elem.to_h : elem }
          else
            v
          end
      end
    end

    alias_method :to_hash, :to_h

    # Pretty print object's data
    def to_s
      rendered = "#<#{self.class}\n"
      self.class.fields.each do |k|
        rendered << "  #{k}: " << @attributes[k].inspect.gsub(/(\r?\n)/, '\1  ') << "\n"
      end
      rendered << ">"
    end

    alias_method :inspect, :to_s

    private
    def copy_if_exists(from, to, key, recurring_fun)
      v = from[key]
      return if v == nil
      to[key] = v.respond_to?(recurring_fun) ? v.__send__(recurring_fun) : v
    end
  end

  class ChargeRequestCreate < Entity
    attr_reader :attributes

    def self.fields
      ['amount', 'currency', 'customer', 'shop', 'card', 'description', 'capture', 'expire_days', 'uuid']
    end


    def self.create(params)
      return params if params.is_a?(self)
      hash = case params
        when Hash; params
        else
          raise WebPay::InvalidRequestError.new("#{self} does not accept the given value", params)
        end
      self.new(hash)
    end

    def initialize(hash = {})
      hash = normalize_hash(hash)
      hash['card'] = hash['card'].is_a?(Hash) ? WebPay::CardRequest.new(hash['card']) : hash['card']
      @attributes = hash
    end


    def request_body
      result = {}
      copy_if_exists(@attributes, result, 'amount', 'request_body');
      copy_if_exists(@attributes, result, 'currency', 'request_body');
      copy_if_exists(@attributes, result, 'customer', 'request_body');
      copy_if_exists(@attributes, result, 'shop', 'request_body');
      copy_if_exists(@attributes, result, 'card', 'request_body');
      copy_if_exists(@attributes, result, 'description', 'request_body');
      copy_if_exists(@attributes, result, 'capture', 'request_body');
      copy_if_exists(@attributes, result, 'expire_days', 'request_body');
      copy_if_exists(@attributes, result, 'uuid', 'request_body');
      result
    end

    def query_params
      result = {}
      return result
    end


    # attributes accessors
    def amount
      attributes['amount']
    end

    def amount=(value)
      attributes['amount'] = value
    end

    def currency
      attributes['currency']
    end

    def currency=(value)
      attributes['currency'] = value
    end

    def customer
      attributes['customer']
    end

    def customer=(value)
      attributes['customer'] = value
    end

    def shop
      attributes['shop']
    end

    def shop=(value)
      attributes['shop'] = value
    end

    def card
      attributes['card']
    end

    def card=(value)
      value = value.is_a?(Hash) ? WebPay::CardRequest.new(value) : value
      attributes['card'] = value
    end

    def description
      attributes['description']
    end

    def description=(value)
      attributes['description'] = value
    end

    def capture
      attributes['capture']
    end

    def capture=(value)
      attributes['capture'] = value
    end

    def expire_days
      attributes['expire_days']
    end

    def expire_days=(value)
      attributes['expire_days'] = value
    end

    def uuid
      attributes['uuid']
    end

    def uuid=(value)
      attributes['uuid'] = value
    end

  end
  class CardRequest < Entity
    attr_reader :attributes

    def self.fields
      ['number', 'exp_month', 'exp_year', 'cvc', 'name']
    end


    def self.create(params)
      return params if params.is_a?(self)
      hash = case params
        when Hash; params
        else
          raise WebPay::InvalidRequestError.new("#{self} does not accept the given value", params)
        end
      self.new(hash)
    end

    def initialize(hash = {})
      hash = normalize_hash(hash)
      @attributes = hash
    end


    def request_body
      result = {}
      copy_if_exists(@attributes, result, 'number', 'request_body');
      copy_if_exists(@attributes, result, 'exp_month', 'request_body');
      copy_if_exists(@attributes, result, 'exp_year', 'request_body');
      copy_if_exists(@attributes, result, 'cvc', 'request_body');
      copy_if_exists(@attributes, result, 'name', 'request_body');
      result
    end

    def query_params
      result = {}
      return result
    end


    # attributes accessors
    def number
      attributes['number']
    end

    def number=(value)
      attributes['number'] = value
    end

    def exp_month
      attributes['exp_month']
    end

    def exp_month=(value)
      attributes['exp_month'] = value
    end

    def exp_year
      attributes['exp_year']
    end

    def exp_year=(value)
      attributes['exp_year'] = value
    end

    def cvc
      attributes['cvc']
    end

    def cvc=(value)
      attributes['cvc'] = value
    end

    def name
      attributes['name']
    end

    def name=(value)
      attributes['name'] = value
    end

  end
  class ChargeResponse < Entity
    attr_reader :attributes

    def self.fields
      ['id', 'object', 'livemode', 'amount', 'card', 'created', 'currency', 'paid', 'captured', 'refunded', 'amount_refunded', 'customer', 'recursion', 'shop', 'description', 'failure_message', 'expire_time', 'fees']
    end


    def initialize(hash = {})
      hash = normalize_hash(hash)
      hash['card'] = WebPay::CardResponse.new(hash['card']) if hash['card'].is_a?(Hash)
      hash['fees'] = hash['fees'].is_a?(Array) ? hash['fees'].map { |x| WebPay::ChargeFeeResponse.new(x) if x.is_a?(Hash) }  : hash['fees']
      @attributes = hash
    end



    # attributes accessors
    def id
      attributes['id']
    end

    def object
      attributes['object']
    end

    def livemode
      attributes['livemode']
    end

    def amount
      attributes['amount']
    end

    def card
      attributes['card']
    end

    def created
      attributes['created']
    end

    def currency
      attributes['currency']
    end

    def paid
      attributes['paid']
    end

    def captured
      attributes['captured']
    end

    def refunded
      attributes['refunded']
    end

    def amount_refunded
      attributes['amount_refunded']
    end

    def customer
      attributes['customer']
    end

    def recursion
      attributes['recursion']
    end

    def shop
      attributes['shop']
    end

    def description
      attributes['description']
    end

    def failure_message
      attributes['failure_message']
    end

    def expire_time
      attributes['expire_time']
    end

    def fees
      attributes['fees']
    end

  end
  class CardResponse < Entity
    attr_reader :attributes

    def self.fields
      ['object', 'exp_month', 'exp_year', 'fingerprint', 'last4', 'type', 'cvc_check', 'name', 'country']
    end


    def initialize(hash = {})
      hash = normalize_hash(hash)
      @attributes = hash
    end



    # attributes accessors
    def object
      attributes['object']
    end

    def exp_month
      attributes['exp_month']
    end

    def exp_year
      attributes['exp_year']
    end

    def fingerprint
      attributes['fingerprint']
    end

    def last4
      attributes['last4']
    end

    def type
      attributes['type']
    end

    def cvc_check
      attributes['cvc_check']
    end

    def name
      attributes['name']
    end

    def country
      attributes['country']
    end

  end
  class ChargeFeeResponse < Entity
    attr_reader :attributes

    def self.fields
      ['object', 'transaction_type', 'transaction_fee', 'rate', 'amount', 'created']
    end


    def initialize(hash = {})
      hash = normalize_hash(hash)
      @attributes = hash
    end



    # attributes accessors
    def object
      attributes['object']
    end

    def transaction_type
      attributes['transaction_type']
    end

    def transaction_fee
      attributes['transaction_fee']
    end

    def rate
      attributes['rate']
    end

    def amount
      attributes['amount']
    end

    def created
      attributes['created']
    end

  end
  class ChargeIdRequest < Entity
    attr_reader :attributes

    def self.fields
      ['id']
    end


    def self.create(params)
      return params if params.is_a?(self)
      hash = case params
        when Hash; params
        when WebPay::ChargeResponse; {'id' => params.id}
        when String; {'id' => params}
        else
          raise WebPay::InvalidRequestError.new("#{self} does not accept the given value", params)
        end
      self.new(hash)
    end

    def initialize(hash = {})
      hash = normalize_hash(hash)
      @attributes = hash
    end


    def request_body
      result = {}
      result
    end

    def query_params
      result = {}
      return result
    end


    # attributes accessors
    def id
      attributes['id']
    end

    def id=(value)
      attributes['id'] = value
    end

  end
  class ChargeRequestRefund < Entity
    attr_reader :attributes

    def self.fields
      ['id', 'amount', 'uuid']
    end


    def self.create(params)
      return params if params.is_a?(self)
      hash = case params
        when Hash; params
        when WebPay::ChargeResponse; {'id' => params.id}
        when String; {'id' => params}
        else
          raise WebPay::InvalidRequestError.new("#{self} does not accept the given value", params)
        end
      self.new(hash)
    end

    def initialize(hash = {})
      hash = normalize_hash(hash)
      @attributes = hash
    end


    def request_body
      result = {}
      copy_if_exists(@attributes, result, 'amount', 'request_body');
      copy_if_exists(@attributes, result, 'uuid', 'request_body');
      result
    end

    def query_params
      result = {}
      return result
    end


    # attributes accessors
    def id
      attributes['id']
    end

    def id=(value)
      attributes['id'] = value
    end

    def amount
      attributes['amount']
    end

    def amount=(value)
      attributes['amount'] = value
    end

    def uuid
      attributes['uuid']
    end

    def uuid=(value)
      attributes['uuid'] = value
    end

  end
  class ChargeRequestWithAmount < Entity
    attr_reader :attributes

    def self.fields
      ['id', 'amount']
    end


    def self.create(params)
      return params if params.is_a?(self)
      hash = case params
        when Hash; params
        when WebPay::ChargeResponse; {'id' => params.id}
        when String; {'id' => params}
        else
          raise WebPay::InvalidRequestError.new("#{self} does not accept the given value", params)
        end
      self.new(hash)
    end

    def initialize(hash = {})
      hash = normalize_hash(hash)
      @attributes = hash
    end


    def request_body
      result = {}
      copy_if_exists(@attributes, result, 'amount', 'request_body');
      result
    end

    def query_params
      result = {}
      return result
    end


    # attributes accessors
    def id
      attributes['id']
    end

    def id=(value)
      attributes['id'] = value
    end

    def amount
      attributes['amount']
    end

    def amount=(value)
      attributes['amount'] = value
    end

  end
  class ChargeListRequest < Entity
    attr_reader :attributes

    def self.fields
      ['count', 'offset', 'created', 'customer', 'recursion', 'shop', 'captured', 'paid']
    end


    def self.create(params)
      return params if params.is_a?(self)
      hash = case params
        when Hash; params
        else
          raise WebPay::InvalidRequestError.new("#{self} does not accept the given value", params)
        end
      self.new(hash)
    end

    def initialize(hash = {})
      hash = normalize_hash(hash)
      hash['created'] = hash['created'].is_a?(Hash) ? WebPay::CreatedRange.new(hash['created']) : hash['created']
      @attributes = hash
    end


    def request_body
      result = {}
      result
    end

    def query_params
      result = {}
      copy_if_exists(@attributes, result, 'count', 'query_params');
      copy_if_exists(@attributes, result, 'offset', 'query_params');
      copy_if_exists(@attributes, result, 'created', 'query_params');
      copy_if_exists(@attributes, result, 'customer', 'query_params');
      copy_if_exists(@attributes, result, 'recursion', 'query_params');
      copy_if_exists(@attributes, result, 'shop', 'query_params');
      copy_if_exists(@attributes, result, 'captured', 'query_params');
      copy_if_exists(@attributes, result, 'paid', 'query_params');
      return result
    end


    # attributes accessors
    def count
      attributes['count']
    end

    def count=(value)
      attributes['count'] = value
    end

    def offset
      attributes['offset']
    end

    def offset=(value)
      attributes['offset'] = value
    end

    def created
      attributes['created']
    end

    def created=(value)
      value = value.is_a?(Hash) ? WebPay::CreatedRange.new(value) : value
      attributes['created'] = value
    end

    def customer
      attributes['customer']
    end

    def customer=(value)
      attributes['customer'] = value
    end

    def recursion
      attributes['recursion']
    end

    def recursion=(value)
      attributes['recursion'] = value
    end

    def shop
      attributes['shop']
    end

    def shop=(value)
      attributes['shop'] = value
    end

    def captured
      attributes['captured']
    end

    def captured=(value)
      attributes['captured'] = value
    end

    def paid
      attributes['paid']
    end

    def paid=(value)
      attributes['paid'] = value
    end

  end
  class CreatedRange < Entity
    attr_reader :attributes

    def self.fields
      ['gt', 'gte', 'lt', 'lte']
    end


    def self.create(params)
      return params if params.is_a?(self)
      hash = case params
        when Hash; params
        else
          raise WebPay::InvalidRequestError.new("#{self} does not accept the given value", params)
        end
      self.new(hash)
    end

    def initialize(hash = {})
      hash = normalize_hash(hash)
      @attributes = hash
    end


    def request_body
      result = {}
      result
    end

    def query_params
      result = {}
      copy_if_exists(@attributes, result, 'gt', 'query_params');
      copy_if_exists(@attributes, result, 'gte', 'query_params');
      copy_if_exists(@attributes, result, 'lt', 'query_params');
      copy_if_exists(@attributes, result, 'lte', 'query_params');
      return result
    end


    # attributes accessors
    def gt
      attributes['gt']
    end

    def gt=(value)
      attributes['gt'] = value
    end

    def gte
      attributes['gte']
    end

    def gte=(value)
      attributes['gte'] = value
    end

    def lt
      attributes['lt']
    end

    def lt=(value)
      attributes['lt'] = value
    end

    def lte
      attributes['lte']
    end

    def lte=(value)
      attributes['lte'] = value
    end

  end
  class ChargeResponseList < Entity
    attr_reader :attributes

    def self.fields
      ['object', 'url', 'count', 'data']
    end


    def initialize(hash = {})
      hash = normalize_hash(hash)
      hash['data'] = hash['data'].is_a?(Array) ? hash['data'].map { |x| WebPay::ChargeResponse.new(x) if x.is_a?(Hash) }  : hash['data']
      @attributes = hash
    end



    # attributes accessors
    def object
      attributes['object']
    end

    def url
      attributes['url']
    end

    def count
      attributes['count']
    end

    def data
      attributes['data']
    end

  end
  class CustomerRequestCreate < Entity
    attr_reader :attributes

    def self.fields
      ['card', 'description', 'email', 'uuid']
    end


    def self.create(params)
      return params if params.is_a?(self)
      hash = case params
        when Hash; params
        else
          raise WebPay::InvalidRequestError.new("#{self} does not accept the given value", params)
        end
      self.new(hash)
    end

    def initialize(hash = {})
      hash = normalize_hash(hash)
      hash['card'] = hash['card'].is_a?(Hash) ? WebPay::CardRequest.new(hash['card']) : hash['card']
      @attributes = hash
    end


    def request_body
      result = {}
      copy_if_exists(@attributes, result, 'card', 'request_body');
      copy_if_exists(@attributes, result, 'description', 'request_body');
      copy_if_exists(@attributes, result, 'email', 'request_body');
      copy_if_exists(@attributes, result, 'uuid', 'request_body');
      result
    end

    def query_params
      result = {}
      return result
    end


    # attributes accessors
    def card
      attributes['card']
    end

    def card=(value)
      value = value.is_a?(Hash) ? WebPay::CardRequest.new(value) : value
      attributes['card'] = value
    end

    def description
      attributes['description']
    end

    def description=(value)
      attributes['description'] = value
    end

    def email
      attributes['email']
    end

    def email=(value)
      attributes['email'] = value
    end

    def uuid
      attributes['uuid']
    end

    def uuid=(value)
      attributes['uuid'] = value
    end

  end
  class CustomerResponse < Entity
    attr_reader :attributes

    def self.fields
      ['id', 'object', 'livemode', 'created', 'active_card', 'description', 'email', 'recursions', 'deleted']
    end


    def initialize(hash = {})
      hash = normalize_hash(hash)
      hash['active_card'] = WebPay::CardResponse.new(hash['active_card']) if hash['active_card'].is_a?(Hash)
      hash['recursions'] = hash['recursions'].is_a?(Array) ? hash['recursions'].map { |x| WebPay::RecursionResponse.new(x) if x.is_a?(Hash) }  : hash['recursions']
      hash['deleted'] ||= false
      @attributes = hash
    end



    # attributes accessors
    def id
      attributes['id']
    end

    def object
      attributes['object']
    end

    def livemode
      attributes['livemode']
    end

    def created
      attributes['created']
    end

    def active_card
      attributes['active_card']
    end

    def description
      attributes['description']
    end

    def email
      attributes['email']
    end

    def recursions
      attributes['recursions']
    end

    def deleted
      attributes['deleted']
    end

  end
  class RecursionResponse < Entity
    attr_reader :attributes

    def self.fields
      ['id', 'object', 'livemode', 'created', 'amount', 'currency', 'period', 'description', 'customer', 'shop', 'last_executed', 'next_scheduled', 'status', 'deleted']
    end


    def initialize(hash = {})
      hash = normalize_hash(hash)
      hash['deleted'] ||= false
      @attributes = hash
    end



    # attributes accessors
    def id
      attributes['id']
    end

    def object
      attributes['object']
    end

    def livemode
      attributes['livemode']
    end

    def created
      attributes['created']
    end

    def amount
      attributes['amount']
    end

    def currency
      attributes['currency']
    end

    def period
      attributes['period']
    end

    def description
      attributes['description']
    end

    def customer
      attributes['customer']
    end

    def shop
      attributes['shop']
    end

    def last_executed
      attributes['last_executed']
    end

    def next_scheduled
      attributes['next_scheduled']
    end

    def status
      attributes['status']
    end

    def deleted
      attributes['deleted']
    end

  end
  class CustomerIdRequest < Entity
    attr_reader :attributes

    def self.fields
      ['id']
    end


    def self.create(params)
      return params if params.is_a?(self)
      hash = case params
        when Hash; params
        when WebPay::CustomerResponse; {'id' => params.id}
        when String; {'id' => params}
        else
          raise WebPay::InvalidRequestError.new("#{self} does not accept the given value", params)
        end
      self.new(hash)
    end

    def initialize(hash = {})
      hash = normalize_hash(hash)
      @attributes = hash
    end


    def request_body
      result = {}
      result
    end

    def query_params
      result = {}
      return result
    end


    # attributes accessors
    def id
      attributes['id']
    end

    def id=(value)
      attributes['id'] = value
    end

  end
  class CustomerRequestUpdate < Entity
    attr_reader :attributes

    def self.fields
      ['id', 'card', 'description', 'email']
    end


    def self.create(params)
      return params if params.is_a?(self)
      hash = case params
        when Hash; params
        when WebPay::CustomerResponse; {'id' => params.id}
        when String; {'id' => params}
        else
          raise WebPay::InvalidRequestError.new("#{self} does not accept the given value", params)
        end
      self.new(hash)
    end

    def initialize(hash = {})
      hash = normalize_hash(hash)
      hash['card'] = hash['card'].is_a?(Hash) ? WebPay::CardRequest.new(hash['card']) : hash['card']
      @attributes = hash
    end


    def request_body
      result = {}
      copy_if_exists(@attributes, result, 'card', 'request_body');
      copy_if_exists(@attributes, result, 'description', 'request_body');
      copy_if_exists(@attributes, result, 'email', 'request_body');
      result
    end

    def query_params
      result = {}
      return result
    end


    # attributes accessors
    def id
      attributes['id']
    end

    def id=(value)
      attributes['id'] = value
    end

    def card
      attributes['card']
    end

    def card=(value)
      value = value.is_a?(Hash) ? WebPay::CardRequest.new(value) : value
      attributes['card'] = value
    end

    def description
      attributes['description']
    end

    def description=(value)
      attributes['description'] = value
    end

    def email
      attributes['email']
    end

    def email=(value)
      attributes['email'] = value
    end

  end
  class BasicListRequest < Entity
    attr_reader :attributes

    def self.fields
      ['count', 'offset', 'created']
    end


    def self.create(params)
      return params if params.is_a?(self)
      hash = case params
        when Hash; params
        else
          raise WebPay::InvalidRequestError.new("#{self} does not accept the given value", params)
        end
      self.new(hash)
    end

    def initialize(hash = {})
      hash = normalize_hash(hash)
      hash['created'] = hash['created'].is_a?(Hash) ? WebPay::CreatedRange.new(hash['created']) : hash['created']
      @attributes = hash
    end


    def request_body
      result = {}
      result
    end

    def query_params
      result = {}
      copy_if_exists(@attributes, result, 'count', 'query_params');
      copy_if_exists(@attributes, result, 'offset', 'query_params');
      copy_if_exists(@attributes, result, 'created', 'query_params');
      return result
    end


    # attributes accessors
    def count
      attributes['count']
    end

    def count=(value)
      attributes['count'] = value
    end

    def offset
      attributes['offset']
    end

    def offset=(value)
      attributes['offset'] = value
    end

    def created
      attributes['created']
    end

    def created=(value)
      value = value.is_a?(Hash) ? WebPay::CreatedRange.new(value) : value
      attributes['created'] = value
    end

  end
  class CustomerResponseList < Entity
    attr_reader :attributes

    def self.fields
      ['object', 'url', 'count', 'data']
    end


    def initialize(hash = {})
      hash = normalize_hash(hash)
      hash['data'] = hash['data'].is_a?(Array) ? hash['data'].map { |x| WebPay::CustomerResponse.new(x) if x.is_a?(Hash) }  : hash['data']
      @attributes = hash
    end



    # attributes accessors
    def object
      attributes['object']
    end

    def url
      attributes['url']
    end

    def count
      attributes['count']
    end

    def data
      attributes['data']
    end

  end
  class TokenRequestCreate < Entity
    attr_reader :attributes

    def self.fields
      ['card', 'customer', 'uuid']
    end


    def self.create(params)
      return params if params.is_a?(self)
      hash = case params
        when Hash; params
        when WebPay::CardRequest; {'card' => params}
        else
          raise WebPay::InvalidRequestError.new("#{self} does not accept the given value", params)
        end
      self.new(hash)
    end

    def initialize(hash = {})
      hash = normalize_hash(hash)
      hash['card'] = WebPay::CardRequest.new(hash['card']) if hash['card'].is_a?(Hash)
      @attributes = hash
    end


    def request_body
      result = {}
      copy_if_exists(@attributes, result, 'card', 'request_body');
      copy_if_exists(@attributes, result, 'customer', 'request_body');
      copy_if_exists(@attributes, result, 'uuid', 'request_body');
      result
    end

    def query_params
      result = {}
      return result
    end


    # attributes accessors
    def card
      attributes['card']
    end

    def card=(value)
      value = WebPay::CardRequest.new(value) if value.is_a?(Hash)
      attributes['card'] = value
    end

    def customer
      attributes['customer']
    end

    def customer=(value)
      attributes['customer'] = value
    end

    def uuid
      attributes['uuid']
    end

    def uuid=(value)
      attributes['uuid'] = value
    end

  end
  class TokenResponse < Entity
    attr_reader :attributes

    def self.fields
      ['id', 'object', 'livemode', 'card', 'created', 'used']
    end


    def initialize(hash = {})
      hash = normalize_hash(hash)
      hash['card'] = WebPay::CardResponse.new(hash['card']) if hash['card'].is_a?(Hash)
      @attributes = hash
    end



    # attributes accessors
    def id
      attributes['id']
    end

    def object
      attributes['object']
    end

    def livemode
      attributes['livemode']
    end

    def card
      attributes['card']
    end

    def created
      attributes['created']
    end

    def used
      attributes['used']
    end

  end
  class TokenIdRequest < Entity
    attr_reader :attributes

    def self.fields
      ['id']
    end


    def self.create(params)
      return params if params.is_a?(self)
      hash = case params
        when Hash; params
        when WebPay::TokenResponse; {'id' => params.id}
        when String; {'id' => params}
        else
          raise WebPay::InvalidRequestError.new("#{self} does not accept the given value", params)
        end
      self.new(hash)
    end

    def initialize(hash = {})
      hash = normalize_hash(hash)
      @attributes = hash
    end


    def request_body
      result = {}
      result
    end

    def query_params
      result = {}
      return result
    end


    # attributes accessors
    def id
      attributes['id']
    end

    def id=(value)
      attributes['id'] = value
    end

  end
  class EventIdRequest < Entity
    attr_reader :attributes

    def self.fields
      ['id']
    end


    def self.create(params)
      return params if params.is_a?(self)
      hash = case params
        when Hash; params
        when WebPay::EventResponse; {'id' => params.id}
        when String; {'id' => params}
        else
          raise WebPay::InvalidRequestError.new("#{self} does not accept the given value", params)
        end
      self.new(hash)
    end

    def initialize(hash = {})
      hash = normalize_hash(hash)
      @attributes = hash
    end


    def request_body
      result = {}
      result
    end

    def query_params
      result = {}
      return result
    end


    # attributes accessors
    def id
      attributes['id']
    end

    def id=(value)
      attributes['id'] = value
    end

  end
  class EventResponse < Entity
    attr_reader :attributes

    def self.fields
      ['id', 'object', 'livemode', 'created', 'data', 'pending_webhooks', 'type', 'shop']
    end


    def initialize(hash = {})
      hash = normalize_hash(hash)
      hash['data'] = WebPay::EventData.new(hash['data']) if hash['data'].is_a?(Hash)
      @attributes = hash
    end



    # attributes accessors
    def id
      attributes['id']
    end

    def object
      attributes['object']
    end

    def livemode
      attributes['livemode']
    end

    def created
      attributes['created']
    end

    def data
      attributes['data']
    end

    def pending_webhooks
      attributes['pending_webhooks']
    end

    def type
      attributes['type']
    end

    def shop
      attributes['shop']
    end

  end
  class EventData < Entity
    attr_reader :attributes

    def self.fields
      ['object', 'previous_attributes']
    end


    def initialize(hash = {})
      hash = normalize_hash(hash)
      hash['object'] =
  case hash['object'].is_a?(Hash) && hash['object']['object']
  when 'account'; AccountResponse.new(hash['object'])
  when 'charge'; ChargeResponse.new(hash['object'])
  when 'customer'; CustomerResponse.new(hash['object'])
  when 'recursion'; RecursionResponse.new(hash['object'])
  when 'shop'; ShopResponse.new(hash['object'])
  else; hash['object']
  end

      @attributes = hash
    end



    # attributes accessors
    def object
      attributes['object']
    end

    def previous_attributes
      attributes['previous_attributes']
    end

  end
  class EventListRequest < Entity
    attr_reader :attributes

    def self.fields
      ['count', 'offset', 'created', 'type', 'shop']
    end


    def self.create(params)
      return params if params.is_a?(self)
      hash = case params
        when Hash; params
        else
          raise WebPay::InvalidRequestError.new("#{self} does not accept the given value", params)
        end
      self.new(hash)
    end

    def initialize(hash = {})
      hash = normalize_hash(hash)
      hash['created'] = hash['created'].is_a?(Hash) ? WebPay::CreatedRange.new(hash['created']) : hash['created']
      @attributes = hash
    end


    def request_body
      result = {}
      result
    end

    def query_params
      result = {}
      copy_if_exists(@attributes, result, 'count', 'query_params');
      copy_if_exists(@attributes, result, 'offset', 'query_params');
      copy_if_exists(@attributes, result, 'created', 'query_params');
      copy_if_exists(@attributes, result, 'type', 'query_params');
      copy_if_exists(@attributes, result, 'shop', 'query_params');
      return result
    end


    # attributes accessors
    def count
      attributes['count']
    end

    def count=(value)
      attributes['count'] = value
    end

    def offset
      attributes['offset']
    end

    def offset=(value)
      attributes['offset'] = value
    end

    def created
      attributes['created']
    end

    def created=(value)
      value = value.is_a?(Hash) ? WebPay::CreatedRange.new(value) : value
      attributes['created'] = value
    end

    def type
      attributes['type']
    end

    def type=(value)
      attributes['type'] = value
    end

    def shop
      attributes['shop']
    end

    def shop=(value)
      attributes['shop'] = value
    end

  end
  class EventResponseList < Entity
    attr_reader :attributes

    def self.fields
      ['object', 'url', 'count', 'data']
    end


    def initialize(hash = {})
      hash = normalize_hash(hash)
      hash['data'] = hash['data'].is_a?(Array) ? hash['data'].map { |x| WebPay::EventResponse.new(x) if x.is_a?(Hash) }  : hash['data']
      @attributes = hash
    end



    # attributes accessors
    def object
      attributes['object']
    end

    def url
      attributes['url']
    end

    def count
      attributes['count']
    end

    def data
      attributes['data']
    end

  end
  class ShopRequestCreate < Entity
    attr_reader :attributes

    def self.fields
      ['description', 'details']
    end


    def self.create(params)
      return params if params.is_a?(self)
      hash = case params
        when Hash; params
        else
          raise WebPay::InvalidRequestError.new("#{self} does not accept the given value", params)
        end
      self.new(hash)
    end

    def initialize(hash = {})
      hash = normalize_hash(hash)
      @attributes = hash
    end


    def request_body
      result = {}
      copy_if_exists(@attributes, result, 'description', 'request_body');
      copy_if_exists(@attributes, result, 'details', 'request_body');
      result
    end

    def query_params
      result = {}
      return result
    end


    # attributes accessors
    def description
      attributes['description']
    end

    def description=(value)
      attributes['description'] = value
    end

    def details
      attributes['details']
    end

    def details=(value)
      attributes['details'] = value
    end

  end
  class ShopResponse < Entity
    attr_reader :attributes

    def self.fields
      ['id', 'object', 'livemode', 'status', 'description', 'access_key', 'created', 'statement_descriptor', 'card_types_supported', 'details']
    end


    def initialize(hash = {})
      hash = normalize_hash(hash)
      @attributes = hash
    end



    # attributes accessors
    def id
      attributes['id']
    end

    def object
      attributes['object']
    end

    def livemode
      attributes['livemode']
    end

    def status
      attributes['status']
    end

    def description
      attributes['description']
    end

    def access_key
      attributes['access_key']
    end

    def created
      attributes['created']
    end

    def statement_descriptor
      attributes['statement_descriptor']
    end

    def card_types_supported
      attributes['card_types_supported']
    end

    def details
      attributes['details']
    end

  end
  class ShopIdRequest < Entity
    attr_reader :attributes

    def self.fields
      ['id']
    end


    def self.create(params)
      return params if params.is_a?(self)
      hash = case params
        when Hash; params
        when WebPay::ShopResponse; {'id' => params.id}
        when String; {'id' => params}
        else
          raise WebPay::InvalidRequestError.new("#{self} does not accept the given value", params)
        end
      self.new(hash)
    end

    def initialize(hash = {})
      hash = normalize_hash(hash)
      @attributes = hash
    end


    def request_body
      result = {}
      result
    end

    def query_params
      result = {}
      return result
    end


    # attributes accessors
    def id
      attributes['id']
    end

    def id=(value)
      attributes['id'] = value
    end

  end
  class ShopRequestUpdate < Entity
    attr_reader :attributes

    def self.fields
      ['id', 'description', 'details']
    end


    def self.create(params)
      return params if params.is_a?(self)
      hash = case params
        when Hash; params
        when WebPay::ShopResponse; {'id' => params.id}
        when String; {'id' => params}
        else
          raise WebPay::InvalidRequestError.new("#{self} does not accept the given value", params)
        end
      self.new(hash)
    end

    def initialize(hash = {})
      hash = normalize_hash(hash)
      @attributes = hash
    end


    def request_body
      result = {}
      copy_if_exists(@attributes, result, 'description', 'request_body');
      copy_if_exists(@attributes, result, 'details', 'request_body');
      result
    end

    def query_params
      result = {}
      return result
    end


    # attributes accessors
    def id
      attributes['id']
    end

    def id=(value)
      attributes['id'] = value
    end

    def description
      attributes['description']
    end

    def description=(value)
      attributes['description'] = value
    end

    def details
      attributes['details']
    end

    def details=(value)
      attributes['details'] = value
    end

  end
  class ShopRequestAlterStatus < Entity
    attr_reader :attributes

    def self.fields
      ['id', 'status']
    end


    def self.create(params)
      return params if params.is_a?(self)
      hash = case params
        when Hash; params
        when WebPay::ShopResponse; {'id' => params.id}
        when String; {'id' => params}
        else
          raise WebPay::InvalidRequestError.new("#{self} does not accept the given value", params)
        end
      self.new(hash)
    end

    def initialize(hash = {})
      hash = normalize_hash(hash)
      @attributes = hash
    end


    def request_body
      result = {}
      copy_if_exists(@attributes, result, 'status', 'request_body');
      result
    end

    def query_params
      result = {}
      return result
    end


    # attributes accessors
    def id
      attributes['id']
    end

    def id=(value)
      attributes['id'] = value
    end

    def status
      attributes['status']
    end

    def status=(value)
      attributes['status'] = value
    end

  end
  class ShopResponseList < Entity
    attr_reader :attributes

    def self.fields
      ['object', 'url', 'count', 'data']
    end


    def initialize(hash = {})
      hash = normalize_hash(hash)
      hash['data'] = hash['data'].is_a?(Array) ? hash['data'].map { |x| WebPay::ShopResponse.new(x) if x.is_a?(Hash) }  : hash['data']
      @attributes = hash
    end



    # attributes accessors
    def object
      attributes['object']
    end

    def url
      attributes['url']
    end

    def count
      attributes['count']
    end

    def data
      attributes['data']
    end

  end
  class RecursionRequestCreate < Entity
    attr_reader :attributes

    def self.fields
      ['amount', 'currency', 'customer', 'period', 'description', 'shop', 'first_scheduled', 'uuid']
    end


    def self.create(params)
      return params if params.is_a?(self)
      hash = case params
        when Hash; params
        else
          raise WebPay::InvalidRequestError.new("#{self} does not accept the given value", params)
        end
      self.new(hash)
    end

    def initialize(hash = {})
      hash = normalize_hash(hash)
      @attributes = hash
    end


    def request_body
      result = {}
      copy_if_exists(@attributes, result, 'amount', 'request_body');
      copy_if_exists(@attributes, result, 'currency', 'request_body');
      copy_if_exists(@attributes, result, 'customer', 'request_body');
      copy_if_exists(@attributes, result, 'period', 'request_body');
      copy_if_exists(@attributes, result, 'description', 'request_body');
      copy_if_exists(@attributes, result, 'shop', 'request_body');
      copy_if_exists(@attributes, result, 'first_scheduled', 'request_body');
      copy_if_exists(@attributes, result, 'uuid', 'request_body');
      result
    end

    def query_params
      result = {}
      return result
    end


    # attributes accessors
    def amount
      attributes['amount']
    end

    def amount=(value)
      attributes['amount'] = value
    end

    def currency
      attributes['currency']
    end

    def currency=(value)
      attributes['currency'] = value
    end

    def customer
      attributes['customer']
    end

    def customer=(value)
      attributes['customer'] = value
    end

    def period
      attributes['period']
    end

    def period=(value)
      attributes['period'] = value
    end

    def description
      attributes['description']
    end

    def description=(value)
      attributes['description'] = value
    end

    def shop
      attributes['shop']
    end

    def shop=(value)
      attributes['shop'] = value
    end

    def first_scheduled
      attributes['first_scheduled']
    end

    def first_scheduled=(value)
      attributes['first_scheduled'] = value
    end

    def uuid
      attributes['uuid']
    end

    def uuid=(value)
      attributes['uuid'] = value
    end

  end
  class RecursionIdRequest < Entity
    attr_reader :attributes

    def self.fields
      ['id']
    end


    def self.create(params)
      return params if params.is_a?(self)
      hash = case params
        when Hash; params
        when WebPay::RecursionResponse; {'id' => params.id}
        when String; {'id' => params}
        else
          raise WebPay::InvalidRequestError.new("#{self} does not accept the given value", params)
        end
      self.new(hash)
    end

    def initialize(hash = {})
      hash = normalize_hash(hash)
      @attributes = hash
    end


    def request_body
      result = {}
      result
    end

    def query_params
      result = {}
      return result
    end


    # attributes accessors
    def id
      attributes['id']
    end

    def id=(value)
      attributes['id'] = value
    end

  end
  class RecursionRequestResume < Entity
    attr_reader :attributes

    def self.fields
      ['id', 'retry']
    end


    def self.create(params)
      return params if params.is_a?(self)
      hash = case params
        when Hash; params
        when WebPay::RecursionResponse; {'id' => params.id}
        when String; {'id' => params}
        else
          raise WebPay::InvalidRequestError.new("#{self} does not accept the given value", params)
        end
      self.new(hash)
    end

    def initialize(hash = {})
      hash = normalize_hash(hash)
      @attributes = hash
    end


    def request_body
      result = {}
      copy_if_exists(@attributes, result, 'retry', 'request_body');
      result
    end

    def query_params
      result = {}
      return result
    end


    # attributes accessors
    def id
      attributes['id']
    end

    def id=(value)
      attributes['id'] = value
    end

    def retry
      attributes['retry']
    end

    def retry=(value)
      attributes['retry'] = value
    end

  end
  class RecursionListRequest < Entity
    attr_reader :attributes

    def self.fields
      ['count', 'offset', 'created', 'customer', 'shop', 'suspended']
    end


    def self.create(params)
      return params if params.is_a?(self)
      hash = case params
        when Hash; params
        else
          raise WebPay::InvalidRequestError.new("#{self} does not accept the given value", params)
        end
      self.new(hash)
    end

    def initialize(hash = {})
      hash = normalize_hash(hash)
      hash['created'] = hash['created'].is_a?(Hash) ? WebPay::CreatedRange.new(hash['created']) : hash['created']
      @attributes = hash
    end


    def request_body
      result = {}
      result
    end

    def query_params
      result = {}
      copy_if_exists(@attributes, result, 'count', 'query_params');
      copy_if_exists(@attributes, result, 'offset', 'query_params');
      copy_if_exists(@attributes, result, 'created', 'query_params');
      copy_if_exists(@attributes, result, 'customer', 'query_params');
      copy_if_exists(@attributes, result, 'shop', 'query_params');
      copy_if_exists(@attributes, result, 'suspended', 'query_params');
      return result
    end


    # attributes accessors
    def count
      attributes['count']
    end

    def count=(value)
      attributes['count'] = value
    end

    def offset
      attributes['offset']
    end

    def offset=(value)
      attributes['offset'] = value
    end

    def created
      attributes['created']
    end

    def created=(value)
      value = value.is_a?(Hash) ? WebPay::CreatedRange.new(value) : value
      attributes['created'] = value
    end

    def customer
      attributes['customer']
    end

    def customer=(value)
      attributes['customer'] = value
    end

    def shop
      attributes['shop']
    end

    def shop=(value)
      attributes['shop'] = value
    end

    def suspended
      attributes['suspended']
    end

    def suspended=(value)
      attributes['suspended'] = value
    end

  end
  class RecursionResponseList < Entity
    attr_reader :attributes

    def self.fields
      ['object', 'url', 'count', 'data']
    end


    def initialize(hash = {})
      hash = normalize_hash(hash)
      hash['data'] = hash['data'].is_a?(Array) ? hash['data'].map { |x| WebPay::RecursionResponse.new(x) if x.is_a?(Hash) }  : hash['data']
      @attributes = hash
    end



    # attributes accessors
    def object
      attributes['object']
    end

    def url
      attributes['url']
    end

    def count
      attributes['count']
    end

    def data
      attributes['data']
    end

  end
  class EmptyRequest < Entity
    attr_reader :attributes

    def self.fields
      []
    end


    def self.create(params)
      return params if params.is_a?(self)
      hash = case params
        when Hash; params
        else
          raise WebPay::InvalidRequestError.new("#{self} does not accept the given value", params)
        end
      self.new(hash)
    end

    def initialize(hash = {})
      hash = normalize_hash(hash)
      @attributes = hash
    end


    def request_body
      result = {}
      result
    end

    def query_params
      result = {}
      return result
    end


    # attributes accessors
  end
  class AccountResponse < Entity
    attr_reader :attributes

    def self.fields
      ['id', 'object', 'charge_enabled', 'currencies_supported', 'details_submitted', 'email', 'statement_descriptor', 'card_types_supported']
    end


    def initialize(hash = {})
      hash = normalize_hash(hash)
      @attributes = hash
    end



    # attributes accessors
    def id
      attributes['id']
    end

    def object
      attributes['object']
    end

    def charge_enabled
      attributes['charge_enabled']
    end

    def currencies_supported
      attributes['currencies_supported']
    end

    def details_submitted
      attributes['details_submitted']
    end

    def email
      attributes['email']
    end

    def statement_descriptor
      attributes['statement_descriptor']
    end

    def card_types_supported
      attributes['card_types_supported']
    end

  end
  class DeletedResponse < Entity
    attr_reader :attributes

    def self.fields
      ['deleted']
    end


    def initialize(hash = {})
      hash = normalize_hash(hash)
      @attributes = hash
    end



    # attributes accessors
    def deleted
      attributes['deleted']
    end

  end
  class ErrorData < Entity
    attr_reader :attributes

    def self.fields
      ['error']
    end


    def initialize(hash = {})
      hash = normalize_hash(hash)
      hash['error'] = WebPay::ErrorBody.new(hash['error']) if hash['error'].is_a?(Hash)
      @attributes = hash
    end



    # attributes accessors
    def error
      attributes['error']
    end

  end
  class ErrorBody < Entity
    attr_reader :attributes

    def self.fields
      ['message', 'type', 'caused_by', 'code', 'param', 'charge']
    end


    def initialize(hash = {})
      hash = normalize_hash(hash)
      @attributes = hash
    end



    # attributes accessors
    def message
      attributes['message']
    end

    def type
      attributes['type']
    end

    def caused_by
      attributes['caused_by']
    end

    def code
      attributes['code']
    end

    def param
      attributes['param']
    end

    def charge
      attributes['charge']
    end

  end
end
