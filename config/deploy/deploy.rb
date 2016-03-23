lock '3.4.0'

# アプリケーション名
set :application, 'protospace'

# deployするレポジトリ
set :repo_url, 'git@github.com:kuboshizuma/protospace.git'

# Default branch is :master
# deployするブランチ。デフォルトはmasterなのでなくても可。
set :branch, 'master'
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# deploy先のディレクトリ
set :deploy_to, '/var/www/rails/protospace'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# シンボリックリンクをはるファイル。今回はgemのconfigを使用して、production.ymlを共通化。
set :linked_files, fetch(:linked_files, []).push('config/settings/production.yml')

# Default value for linked_dirs is []
# シンボリックリンクをはるフォルダ。
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# 保持するバージョンの個数
set :keep_releases, 5

# rubyのバージョン
set :rbenv_ruby, '2.1.3'

namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end
  desc 'Create database'
  task :db_create do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:create'
        end
      end
    end
  end
  desc 'Run seed'
  task :seed do
    on roles(:app) do
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end
  after :publishing, :restart
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
end