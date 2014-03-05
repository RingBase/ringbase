APP_PATH = '/var/www/ringbase/current/'

# 16 workers and 1 master
# worker_processes (rails_env == 'production' ? 16 : 4)

worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)

# Restart any workers that haven't responded in 15 seconds
timeout 15

# Load app into the master before forking workers
# # for super-fast worker spawn times
preload_app true

listen APP_PATH + 'tmp/sockets/.unicorn.sock', backlog: 2048

pid APP_PATH + 'tmp/pids/unicorn.pid'


before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
        ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
        ActiveRecord::Base.establish_connection

end
