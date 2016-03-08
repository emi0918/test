# Load DSL and set up stages
require 'capistrano/setup'

# Include default deployment tasks
require 'capistrano/deploy'

# Include tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails
#   https://github.com/capistrano/passenger
#
# require 'capistrano/rvm'
# require 'capistrano/rvm'
require 'capistrano/rbenv' #コメントアウトをはずす
# require 'capistrano/chruby'
require 'capistrano/bundler' #コメントアウトをはずす
require 'capistrano/rails/assets' #コメントアウトをはずす
require 'capistrano/rails/migrations' #コメントアウトをはずす
# require 'capistrano/passenger'
require 'capistrano3/unicorn' #追記

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.task').each { |r| import r }
