require 'bcrypt'

class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :name
      t.string :encrypted_password
      t.timestamps
    end
    User.create(name: "liu", encrypted_password: BCrypt::Password.create("liu"));
    User.create(name: "feng", encrypted_password: BCrypt::Password.create("feng"));
  end

  def down
    drop_table :users
  end
end
