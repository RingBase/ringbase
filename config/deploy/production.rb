set :stage, :production
set :rails_env, :production

rails_server    = 'ubuntu@54.213.135.39'
database_server = 'ubuntu@54.213.174.109'

role :app, rails_server
role :web, rails_server
role :db, database_server

set :ssh_options, {
  user: %(ubuntu),
  keys: [File.join(ENV["HOME"], ".ssh", "ringbase")],
  forward_agent: true,
  auth_methods %w(publickey)

}
