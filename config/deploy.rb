set :application, "papienterprises.com"
set :repository,  "git@github.com:wdaniels38/papienterprises.com.git"
set :user, "will"

set :scm_username, "wdaniels38"
set :scm, :git

set :deploy_via, :remote_cache
set :deploy_to, "/var/www/#{application}"
set :use_sudo, false

role :app, "209.20.83.218:10022"
role :web, "209.20.83.218:10022"
role :db,  "209.20.83.218:10022", :primary => true