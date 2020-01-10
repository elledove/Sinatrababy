require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end
#use Rack::Methodoverride #Sinatra Middleware that lets our app send 'patch' request
use ShoesController
run ApplicationController
