require 'mina/rails'
require 'mina/git'
# require 'mina/rbenv'  # for rbenv support. (https://rbenv.org)
require 'mina/rvm'    # for rvm support. (https://rvm.io)
require 'mina/puma'

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

set :application_name, 'tnr-gallery'
set :domain, '138.68.100.165'
set :deploy_to, '/home/deploy/apps/tnr-gallery'
set :repository, 'git@github.com:mityakoval/tnr-gallery.git'
set :branch, 'master'

# Optional settings:
set :user, 'deploy'          # Username in the server to SSH to.
set :port, '22'              # SSH port number.
set :forward_agent, true     # SSH forward_agent.

# Shared dirs and files will be symlinked into the app-folder by the 'deploy:link_shared_paths' step.
# Some plugins already add folders to shared_dirs like `mina/rails` add `public/assets`, `vendor/bundle` and many more
# run `mina -d` to see all folders and files already included in `shared_dirs` and `shared_files`
set :shared_dirs, fetch(:shared_dirs, []).push('log', 'tmp/pids', 'tmp/sockets', 'public/uploads')
set :shared_files, fetch(:shared_files, []).push('config/database.yml', 'config/credentials.yml.enc', 'config/puma.rb', 'config/master.key')

set :puma_state, -> { "#{fetch(:deploy_to)}/#{fetch(:shared)}/tmp/sockets/puma.state" }
set :puma_pid, -> { "#{fetch(:deploy_to)}/#{fetch(:shared)}/tmp/pids/puma.pid" }

# This task is the environment that is loaded for all remote run commands, such as
# `mina deploy` or `mina rake`.
task :remote_environment do
  # If you're using rbenv, use this to load the rbenv environment.
  # Be sure to commit your .ruby-version or .rbenv-version to your repository.
  # invoke :'rbenv:load'

  # For those using RVM, use this to load an RVM version@gemset.
  invoke :'rvm:use', 'default'
  
  queue! %(mkdir -p "#{fetch(:deploy_to)}/#{fetch(:shared)}/tmp/sockets")
  queue! %(chmod g+rx,u+rwx "#{fetch(:deploy_to)}/#{fetch(:shared)}/tmp/sockets")
  queue! %(mkdir -p "#{fetch(:deploy_to)}/#{fetch(:shared)}/tmp/pids")
  queue! %(chmod g+rx,u+rwx "#{fetch(:deploy_to)}/#{fetch(:shared)}/tmp/pids")
end

# Put any custom commands you need to run at setup
# All paths in `shared_dirs` and `shared_paths` will be created on their own.
task :setup do
  run :local do  
    comment 'Upload master.key to shared path'
    command "scp config/master.key #{fetch(:user)}@#{fetch(:domain)}:#{fetch(:shared_path)}/config"
    
    comment 'Upload credentials.yml.enc to shared path'
    command "scp config/credentials.yml.enc #{fetch(:user)}@#{fetch(:domain)}:#{fetch(:shared_path)}/config"
    
    comment 'Upload database.yml to shared path'
    command "scp config/database.yml #{fetch(:user)}@#{fetch(:domain)}:#{fetch(:shared_path)}/config"
  end
end

namespace :credentials do
  task :upload do
    run :local do
      comment 'Upload master.key to shared path'
      command "scp config/master.key #{fetch(:user)}@#{fetch(:domain)}:#{fetch(:shared_path)}"
    end
  end
  
  task :symlink do
    comment 'Symlink master.key'
    command "test -f #{fetch(:current_path)}/config/master.key || ln -sf #{fetch(:current_path)}/config/master.key #{fetch(:shared_path)}/master.key"
  end
end

desc "Deploys the current version to the server."
task :deploy do
  # uncomment this line to make sure you pushed your local branch to the remote origin
  # invoke :'git:ensure_pushed'
  # invoke :'credentials:upload'
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    # invoke :'credentials:symlink'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    on :launch do
      invoke :'puma:restart'
      in_path(fetch(:current_path)) do
        # command %{mkdir -p tmp/}
        # command %{touch tmp/restart.txt}
      end
    end
  end

  # you can use `run :local` to run tasks on local machine before of after the deploy scripts
  # run(:local){ say 'done' }
end

# For help in making your deploy script, see the Mina documentation:
#
#  - https://github.com/mina-deploy/mina/tree/master/docs
