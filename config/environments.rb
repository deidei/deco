configure :production, :development do
    set :database, "sqlite3:///db/deco.sqlite3"
end