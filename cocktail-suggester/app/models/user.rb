class User < ActiveRecord::Base
    has_many :stashes
    has_many :cocktails
    has_secure_password
    validates :username, presence: true, uniqueness: true, on: :create
    validates :password_digest, presence: true, uniqueness: true, on: :create
    validates :email, presence: true, uniqueness: true, on: :create
end