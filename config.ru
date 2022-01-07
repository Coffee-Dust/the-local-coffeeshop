require_relative "config/environment"

use Rack::Cors do
  allow do
    # regular expressions can be used here
    origins 'https://dust.coffee','http://localhost:3000', 'https://demo.dust.coffee', '127.0.0.1:3000'
    resource '/',
        :methods => [:get],
        :headers => :any,
        :expose  => ['body'],
        :max_age => 600
        # headers to expose
  end
end

use Rack::MethodOverride

use LocationsController
use ReviewsController
use CoffeeshopsController
use UsersController
run ApplicationController
