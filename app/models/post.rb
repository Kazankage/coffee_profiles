class Post < ActiveRecord::Base
  belongs_to :user 

validates :name, :prepare, :region, presence: true

 
end