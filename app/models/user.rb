class User < ActiveRecord::Base
    has_secure_password
    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true
    
    has_many :positive_posts

end