require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end
use Rack::MethodOverride #Sinatra Middleware that lets our app send 'patch' request
use SessionsController
use UserController
use ShoesController
run ApplicationController
