class User < ActiveRecord::Base
    has_many :cocktails
    has_secure_password
end