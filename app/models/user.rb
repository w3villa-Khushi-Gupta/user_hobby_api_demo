class User < ApplicationRecord
    has_many :hobbies
    
    validates :username, presence: true
    validates :age, presence: true
end
