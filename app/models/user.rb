class User < ApplicationRecord
    has_many :reviews
    has_many :ratings
    has_many :movies, through: :reviews
    has_many :movies, through: :ratings


    has_secure_password
end
