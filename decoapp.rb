require "sinatra"
require "sinatra/activerecord"
require "./config/environments"
require "./models/user"
require "./models/daily_report"

class DecoApp < Sinatra::Application

    def login_required!
        if session[:user].nil?
            halt 401, "Not authorized\n"
        end
    end

    post "/login" do
        user = User.find(:first, :conditions => {:name => params[:username]})
        p user.password
        p params[:password]
        if user.nil?
            status 410
        elsif user.password == params[:password]
            session[:user] = user.id
            status 200
        else
            status 401
        end
    end

    get "/" do
        login_required!
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
        login_required!
        User.all.to_json
    end

    get "/daily_reports" do
        DailyReport.all.to_json
    end

end
