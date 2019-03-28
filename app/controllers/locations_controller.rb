class LocationsController < ApplicationController

    get "/locations" do
        @locations = Location.all
        erb :"location/index"
    end

    get "/locations/:id/:slug" do
        @location = Location.find(params[:id])
        erb :"location/show"
    end

end