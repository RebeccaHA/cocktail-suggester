class User < ActiveRecord::Base
    has_many :stashes
    has_many :cocktails, through: :stashes
    has_secure_password
    validates :username, presence: true, uniqueness: true
end