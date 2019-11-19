class User < ActiveRecord::Base
 
 has_secure_password
 
 has_many :posts
 validates :username, uniqueness: true
 validates :email, uniqueness: true
end