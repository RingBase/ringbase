set :stage, :staging
set :rails_env, :staging

role :app, %w{deploy@example.com}
role :web, %w{deploy@example.com}
role :db,  %w{deploy@example.com}
