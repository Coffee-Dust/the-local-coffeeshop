class UsersController < ApplicationController

    get "/profile" do
        erb :"user/show"
    end

    get "/favorite-coffeeshop/:coffeeshop" do
        if logged_in?
            @cs = Coffeeshop.find(params[:coffeeshop])
            if current_user.favorite_coffeeshops.include?(@cs)
                current_user.remove_coffeeshop_from_favorites(@cs)
                redirect "/coffeeshops/#{@cs.id}/#{@cs.name.to_slug}"
            else
                current_user.add_coffeeshop_to_favorites(@cs)
                redirect "/coffeeshops/#{@cs.id}/#{@cs.name.to_slug}"
            end
        end
    end

    get "/login" do
        if !logged_in?
            session[:errrors] = ""
            erb :"user/login"
        else
            redirect "/"
        end
    end

    get "/signup" do
        if !logged_in?
            erb :"user/new"
        else
            redirect "/"
        end
    end

    post "/login" do
        
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/"
        else
            flash[:message] = "Incorrect email/password"
            erb :"user/login"
        end
    end

    post "/signup" do
        if !User.find_by(email: params[:user][:email])
            @user = User.new(params[:user])
            if new_location_requested?
                @user.build_location(city: params[:location][:city], state: params[:location][:state])
            end

            if @user.save
                session[:user_id] = @user.id
                redirect "/"
            else
                erb :"user/new"
            end
        else
            #User already exists
            flash[:message] = "User already exists with that email."
            erb :"user/new"
        end
    end

    get "/logout" do
        session.clear
        redirect "/login"
    end

    helpers do
        def new_location_requested?
            !params[:location][:city].empty?
        end
    end

end