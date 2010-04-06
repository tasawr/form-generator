require File.join(File.dirname(__FILE__), 'other_tasks')

set :application, "form-generator"
set :repository,  "git://github.com/we4tech/Form-generator.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :use_sudo, false

role :web, "review.codesymmetry.com:2212", :user => 'form'                          # Your HTTP server, Apache/etc
role :app, "review.codesymmetry.com:2212", :user => 'form'                          # This may be the same as your `Web` server
role :db,  "review.codesymmetry.com:2212", :user => 'form', :primary => true # This is where Rails migrations will run

set :deploy_to, "/home/form/"

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start {}
#   task :stop {}
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
