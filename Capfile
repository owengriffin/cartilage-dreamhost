

load 'deploy' if respond_to?(:namespace) # cap2 differentiator

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

before 'deploy:restart', 'vendor_gems:install'
after 'deploy:setup', 'vendor_gems:after_setup'

namespace :vendor_gems do
  task :install do
    run "rm -rf #{current_path}/vendor"
    run "ln -s #{applicationdir}/vendor #{current_path}/vendor"
    run "cd #{current_path} ; dep vendor --all"
  end
  task :after_setup do
    File.open("dependencies", "r").each_line do |line|
      next unless line =~ /^([\w\-_]+) ?([<~=> \d\.]+)?(?: \(([\w, ]+)\))?(?: ([a-z]+:\/\/.+?))?$/
      name = $1
      version = $2
      environment = $3
      url = $4
      if not environment or environment != "test"
        install_cmd = "gem install --no-ri --no-rdoc #{name}"
        install_cmd = install_cmd + " -v #{version}" if version and !version.empty?
        run install_cmd
      end
    end
    run "mkdir #{applicationdir}/vendor"
  end
end

namespace :deploy do
  task :restart do
    run "touch #{current_path}/tmp/restart.txt" 
  end
end


#Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }

#load 'config/deploy' # remove this line to skip loading any of the default tasks
