# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = 'webpay'
  spec.version       = '3.2.3'
  spec.authors       = ['webpay', 'tomykaira']
  spec.email         = ['administrators@webpay.jp', 'tomykaira@webpay.jp']
  spec.description   = 'WebPay is payment gateway service in Japan. See also https://webpay.jp/.'
  spec.summary       = 'Bindings of WebPay API'
  spec.homepage      = 'https://webpay.jp/docs/api/ruby'
  spec.license       = 'MIT'

  spec.files         = File.read(File.expand_path(File.join(__FILE__, "..", "FILELIST"))).split("\n")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 1.9'

  spec.add_dependency 'faraday', '~> 0.9'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake', '~> 10.3.1'
end
