require_relative "config/environment"

use Rack::MethodOverride

use LocationsController
use ReviewsController
use CoffeeshopsController
use UsersController
run ApplicationController