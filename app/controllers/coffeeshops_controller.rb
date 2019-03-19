class CoffeeshopsController < ApplicationController
    get "/coffeeshops" do
        erb :"coffeeshop/index"
    end

    get "/coffeeshops/new" do
        erb :"coffeeshop/new"
    end

    post "/coffeeshops" do

    end

    get "/coffeeshops/:id/:slug" do
        @coffeeshop = Coffeeshop.find(params[:id])
        erb :"coffeeshop/show"
    end

    get "/coffeeshops/:id/:slug/edit" do
        erb :"coffeeshop/edit"
    end

    patch "/coffeeshops/:id/:slug" do
        
    end

end