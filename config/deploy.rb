set :application, 'RingBase'
set :repo_url, 'https://github.com/RingBase/ringbase.git'
set :branch 'master'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :user, 'ubuntu'
set :deploy, '/home/ubuntu'
set :use_sudo, false
set :latest_release_directory, File.join(fetch(:deploy_to), 'current')

# set :deploy_to, '/var/www/my_app'
# set :scm, :git

# set :format, :pretty
# set :log_level, :debug
# set :pty, true

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :keep_releases, 5

# set :normalize_asset_timestamps %{public/images public/javascripts public/stylesheets}

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'

end
