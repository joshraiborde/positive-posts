require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# patch and delete
use Rack::MethodOverride

#mount other controllers with 'use'
use UsersController
use PositivePostsController
run ApplicationController
