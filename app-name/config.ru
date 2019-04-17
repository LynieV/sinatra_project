require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# in order to send PATCH and DELETE requests, I will need this code:
use Rack::MethodOverride

# here is where I will mount other controllers with 'use'
run ApplicationController
use ClientsController
use UsersController
