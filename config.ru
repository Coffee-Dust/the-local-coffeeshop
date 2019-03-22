require_relative "config/environment"

use Rack::MethodOverride

use ReviewsController
use CoffeeshopsController
use UsersController
run ApplicationController