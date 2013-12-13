require "sinatra"
require "sinatra/activerecord"
require "./config/environments"
require "./models/user"
require "./models/daily_report"

class DecoApp < Sinatra::Application

    enable :sessions
    set :session_secret, '*&(^B234'

    def login_required!
        if session[:user].nil?
            halt 401, "Not authorized\n"
        end
    end

    before do
        body = request.body.read
        @json = JSON.parse(body) unless body.empty?
    end

    post "/login" do
        user = User.find_by(name: @json["username"])
        if user.nil?
            status 410
        elsif user.password == @json["password"]
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
        user.name = @json[:username]
        user.password = @json[:password]
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
