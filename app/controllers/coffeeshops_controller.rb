class CoffeeshopsController < ApplicationController
    get "/coffeeshops" do
        @coffeeshops = Coffeeshop.all
        erb :"coffeeshop/index"
    end

    get "/coffeeshops/new" do
        if logged_in? && current_user.admin
            erb :"coffeeshop/new"
        else
            redirect "/coffeeshops"
        end
    end

    post "/coffeeshops" do
        if logged_in? && current_user.admin
            @coffeeshop = Coffeeshop.new(params[:coffeeshop])
            if new_location_requested?
                @coffeeshop.build_location(params[:location])
            end

            if @coffeeshop.save
                redirect "/coffeeshops/#{@coffeeshop.id}/#{@coffeeshop.name.to_slug}"
            else
                erb :"coffeeshop/new"
            end
        end
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

    helpers do
        def new_location_requested?
            !params[:location][:city].empty?
        end
    end

end