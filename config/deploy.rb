

set :user, "ogriffin"
set :application, "hamoi.owengriffin.com"
set :project, "cartilage"
set :repository,  "git://github.com/owengriffin/cartilage.git"
set :domain, "hamoi.owengriffin.com"
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

namespace :deploy do
  task :restart do
    run "touch #{current_path}/tmp/restart.txt" 
  end
end
