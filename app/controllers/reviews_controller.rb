class ReviewsController < ApplicationController
    
    get "/reviews/new/:coffeeshop_id" do
        if logged_in?
            @coffeeshop = Coffeeshop.find(params[:coffeeshop_id])
            erb :"reviews/new"
        else
            redirect :"/coffeeshops"
        end
    end

    post "/reviews" do
        @review = Review.new(params[:review])

        if params[:new_drink][:name].empty?
            @drink = Drink.new(params[:drink])
        else
            @drink = Drink.new(name: params[:new_drink][:name], coffeeshop_id: params[:drink][:coffeeshop_id])
        end
        if @review.save && @drink.save
            redirect "/coffeeshops/#{review.coffeeshop.id}/#{review.coffeeshop.name.to_slug}"
        else
            @coffeeshop = @review.coffeeshop
            erb :"reviews/new"
        end
    end

    get "/reviews/:id" do
        if logged_in?
            @review = Review.find(params[:id])
            erb :"reviews/show"
        else
            redirect :"/login"
        end
    end

    get "/reviews/:id/edit" do
        erb :"reviews/edit"
    end

    patch "/reviews/:id" do

    end

    delete "/reviews/:id" do

    end
end