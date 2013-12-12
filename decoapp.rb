require "sinatra"
require "sinatra/activerecord"

set :database, "sqlite3:///db/deco.sqlite3"

class Post < ActiveRecord::Base
end

class DecoApp < Sinatra::Application

    get "/" do
        Post.order("created_at DESC").to_json
    end

end
