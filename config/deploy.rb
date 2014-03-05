set :application, 'RingBase'
set :repo_url, 'https://github.com/RingBase/ringbase.git'
set :branch, (ENV['BRANCH'] || 'master')
set :deploy_to, 'var/www/ringbase'

set :scm, :git
set :format, :pretty
set :log_level, :debug

set :user, 'ubuntu'
set :deploy, '/home/ubuntu'
set :use_sudo, false


set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :keep_releases, 5

# set :normalize_asset_timestamps %{public/images public/javascripts public/stylesheets}

# See https://github.com/capistrano/rbenv
set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.1.0'
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all

namespace :deploy do

  desc 'Restart Unicorn webserver'
  task :restart do
    on(roles(fetch(:unicorn_roles))) do
      invoke 'unicorn:restart'
    end
  end

  after :finishing, 'deploy:cleanup'

end
