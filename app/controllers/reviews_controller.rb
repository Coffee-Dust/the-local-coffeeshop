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
        @review = Review.find(params[:id])
        if logged_in? && current_user == @review.user
            erb :"reviews/edit"
        else
            redirect "/reviews/#{@review.id}"
        end
    end

    patch "/reviews/:id" do
        @review = Review.find(params[:id])

        if current_user == @review.user
            if @review.update(params[:review])
                redirect "/reviews/#{@review.id}"
            else
                erb :"reviews/edit"
            end
        else
            redirect "/reviews/#{@review.id}"
        end
    end

    delete "/reviews/:id" do
        @review = Review.find(params[:id])

        if current_user == @review.user
            @review.destroy
            redirect "/profile"
        else
            redirect "/reviews/#{@review.id}"
        end
    end

end