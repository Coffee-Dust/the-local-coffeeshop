class LocationsController < ApplicationController
    get "/locations" do
        erb :"location/index"
    end
end