require "sinatra"
require "sinatra/activerecord"
require "./config/environments"
require "./model/user"

class DecoApp < Sinatra::Application

    post "/login" do
        user = User.find(:first, :conditions => {:name => params[:username]})
        p user.password
        p params[:password]
        if user.nil?
            status 401
        elsif user.password == params[:password]
            session[:user] = user.id
            status 200
        else
            status 401
        end
    end

    get "/" do
        "Hello"
    end

    post "/users" do
        user = User.new
        user.name = params[:username]
        p params
        user.password = params[:password]
        user.save!
    end

    get "/users" do
        User.all.to_json
    end

end
