require 'rest-client'
require 'json'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Movie.destroy_all 
User.destroy_all 
Review.destroy_all 
Rating.destroy_all 

#Movies

def get_movies
    movie_hash = []
    i = 500
    while i < 514 do
        movie = RestClient.get("https://api.themoviedb.org/3/movie/#{i}?api_key=364eaa630e9d39baf69b5fdfc41fffc3")
        movie_hash.push(JSON.parse(movie))
        i = i + 1
    end
    movie_hash.each do |movie|
        Movie.find_or_create_by( 
        imdb_id: movie["imdb_id"], 
        title: movie["original_title"], 
        plot: movie["overview"], 
        poster: movie["poster_path"],
        release_date: movie["release_date"])
    end
end 

get_movies

#Users

user1 = User.create(name: Faker::Name.name, username: "JohnDoe", password: "password", age: "18", bio: Faker::Quote.famous_last_words)
user2 = User.create(name: Faker::Name.name, username: "JaneDoe", password: "password", age: "25", bio: Faker::Quote.famous_last_words)
user3 = User.create(name: Faker::Name.name, username: "JackDoe", password: "password", age: "55", bio: Faker::Quote.famous_last_words)
user4 = User.create(name: Faker::Name.name, username: "AshleyDoe", password: "password", age: "42", bio: Faker::Quote.famous_last_words)
user5 = User.create(name: Faker::Name.name, username: "RickyBobby", password: "password", age: "21", bio: Faker::Quote.famous_last_words)

#Reviews

review1 = Review.create(
user: user1,
movie: Movie.first,
content: Faker::Quotes::Shakespeare.as_you_like_it_quote,
upvotes: 0,
downvotes: 0)

review2 = Review.create(
user: user2,
movie: Movie.second,
content: Faker::Quotes::Shakespeare.as_you_like_it_quote,
upvotes: 0,
downvotes: 0)

review3 = Review.create(
user: user3,
movie: Movie.third,
content: Faker::Quotes::Shakespeare.as_you_like_it_quote,
upvotes: 0,
downvotes: 0)

review4 = Review.create(
user: user4,
movie: Movie.fourth,
content: Faker::Quotes::Shakespeare.as_you_like_it_quote,
upvotes: 0,
downvotes: 0)

review5 = Review.create(
user: user5,
movie: Movie.fifth,
content: Faker::Quotes::Shakespeare.as_you_like_it_quote,
upvotes: 0,
downvotes: 0)

review6 = Review.create(
user: user5,
movie: Movie.second_to_last,
content: Faker::Quotes::Shakespeare.as_you_like_it_quote,
upvotes: 0,
downvotes: 0)

#Ratings

rating1 = Rating.create(
user: user1,
movie: Movie.first,
number: 5
)

rating2 = Rating.create(
user: user2,
movie: Movie.second,
number: 2
)

rating3 = Rating.create(
user: user1,
movie: Movie.third,
number: 10
)

rating4 = Rating.create(
user: user1,
movie: Movie.fourth,
number: 7
)

rating5 = Rating.create(
user: user5,
movie: Movie.fifth,
number: 1
)

rating6 = Rating.create(
user: user5,
movie: Movie.second_to_last,
number: 9
)

