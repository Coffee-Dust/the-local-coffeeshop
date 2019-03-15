class UsersController < ApplicationController

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
        if params[:email] == nil || params[:password] == nil
            session[:errors] = "login_blank"
            redirect "/login"
        end

        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(password: params[:password])
            session[:user_id] = @user.id
            redirect "/"
        else
            session[:errors] = "login"
            redirect "/login"
        end
    end

    post "/signup" do
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