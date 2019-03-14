class ApplicationController < Sinatra::Base
    configure do
        set :views, "app/views"
        set :public_dir, "public"

        enable :sessions
        set :session_secret, "*(!@&$*(&!@JHO*ASYLJKDH*(U@!(&DISAHJD*&!@*(&D*(!@JKHJKSACXJNKAJSD*@!&(*&ISmashedMyFaceontheKeyboardForThissupersecretsessionsecret"
    end
    
end