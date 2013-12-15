
require 'bcrypt'

class DecoSetup < ActiveRecord::Migration
  def change

    create_table :users, :id=> false do |t|
      t.string :user_id, :null => false, :primary_key => true
      t.string :user_name
      t.string :user_email
      t.integer :sex
      t.integer :locked
      t.timestamps
      #primary_key :user_id, :type=>:string
    end
    #add_index :users, :user_id, :unique=>true
    #create_table :logins, :id=>false do |t|
    #  t.belongs_to :user
    #  t.string  :login_name, :primary=>true
    #  t.string  :encrypted_password
    #  t.string  :ac_token # a token stored at cookies as "remember me"
    #  t.date    :token_expire_at
    #end
    #create_table :daily_reports, :id=>false do |t|
    #  t.belongs_to :user
    #  t.string :report_id, :primary=>true
    #  t.date :date
    #  t.text :commitment
    #  t.text :plan
    #  t.text :problem
    #end
  end
end
