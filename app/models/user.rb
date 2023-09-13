# email:string
# password_digest:string
#
# password:string virtual
# password_confirmation:string virtual

class User < ApplicationRecord
    has_secure_password
    # it adds a password and a password confirmation to the User
    # the attributes will run into a bcrypt and hash it to be saved in the database
end