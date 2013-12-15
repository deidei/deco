require "bcrypt"

class User < ActiveRecord::Base
    include BCrypt

    self.primary_key = :user_id

    #has_many :daily_reports

    #validates_uniqueness_of :name

    def password
        @password ||= Password.new(encrypted_password)
    end

    def password=(new_password)
        @password = Password.create(new_password)
        self.encrypted_password = @password
    end
end
