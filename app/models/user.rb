# email:string
# password_digest:string
#
# password:string virtual
# password_confirmation:string virtual

class User < ApplicationRecord
    has_many :twitter_accounts
    
    has_secure_password
    # it adds a password and a password confirmation to the User
    # the attributes will run into a bcrypt and hash it to be saved in the database

    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }
    #validates if the email is present when inserting a new user
    #we can also set the rule on the migration to validate on the database level
end

