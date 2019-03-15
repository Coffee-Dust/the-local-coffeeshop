class UsersController < ApplicationController

    get "/login" do
        if !logged_in?
            erb :"user/login"
        else
            redirect "/"
        end
    end

    get "/signup" do

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

    end

end