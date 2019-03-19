require_relative "config/environment"

use Rack::MethodOverride

use CoffeeshopsController
use UsersController
run ApplicationController