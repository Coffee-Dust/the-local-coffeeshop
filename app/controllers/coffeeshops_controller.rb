class CoffeeshopsController < ApplicationController
    get "/coffeeshops" do
        @coffeeshops = Coffeeshop.all
        erb :"coffeeshop/index"
    end

    get "/coffeeshops/new" do
        if current_user.admin
            erb :"coffeeshop/new"
        else
            redirect "/coffeeshops"
        end
    end

    post "/coffeeshops" do

    end

    get "/coffeeshops/:id/:slug" do
        @cs = Coffeeshop.find(params[:id])
        erb :"coffeeshop/show"
    end

    get "/coffeeshops/:id/:slug/edit" do
        if current_user.admin
            erb :"coffeeshop/edit"
        else
            redirect "/coffeeshops/#{params[:id]}/#{params[:slug]}"
        end
    end

    patch "/coffeeshops/:id/:slug" do

    end

    delete "/coffeeshops/:id/:slug" do

    end

end