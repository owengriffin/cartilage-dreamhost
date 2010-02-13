load 'deploy' if respond_to?(:namespace) # cap2 differentiator

set :user, "ogriffin"
set :application, "cartilage.owengriffin.com"
set :project, "cartilage"
set :repository,  "git://github.com/owengriffin/cartilage-dreamhost.git"
set :domain, "cartilage.owengriffin.com"
set :applicationdir, "/home/#{user}/#{application}"  # The standard Dreamhost setup

set :scm, :git
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true
set :deploy_to, "/home/#{user}/#{domain}"
set :deploy_via, :remote_cache
set :use_sudo, false

role :web, domain
role :app, domain
role :db,  domain, :primary => true

before 'deploy:restart', 'vendor_gems:install'
after 'deploy:setup', 'vendor_gems:after_setup'

namespace :vendor_gems do
  # Ensure that all the Gems are installed
  task :install do
    run "cd #{current_path} ; bundle install ; bundle lock"
    upload("config/settings.yml", "#{current_path}/config/settings.yml")
  end
  # Ensure that bundler is installed on the remote host
  task :after_setup do
    run "gem install bundler"
  end
end

namespace :deploy do
  # Ensure that the server is restarted when we deploy
  task :restart do
    run "touch #{current_path}/tmp/restart.txt" 
  end
end
