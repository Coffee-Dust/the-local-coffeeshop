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
        if logged_in? && current_user.admin
            @cs = Coffeeshop.find(params[:id])
            erb :"coffeeshop/edit"
        else
            redirect "/coffeeshops/#{params[:id]}/#{params[:slug]}"
        end
    end

    patch "/coffeeshops/:id" do
        if logged_in? && current_user.admin
            @cs = Coffeeshop.find(params[:id])
            @cs.update(params[:coffeeshop])

            if new_location_requested?
                @cs.location = nil
                @cs.build_location(params[:location])
            end

            if @cs.save
                redirect "/coffeeshops/#{@cs.id}/#{@cs.name.to_slug}"
            else
                erb :"coffeeshop/edit"
            end
        end
    end

    delete "/coffeeshops/:id/:slug" do
        if logged_in? && current_user.admin
            cs = Coffeeshop.find(params[:id])
            cs.reviews.destroy_all
            cs.destroy
            redirect "/coffeeshops"
        end
    end

    helpers do
        def new_location_requested?
            !params[:location][:city].empty?
        end
    end

end