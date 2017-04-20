json.array! movies do |movie|
  json.extract! movie, :id, :title
  json.genre do
    json.id movie.genre.id
    json.name movie.genre.name
    json.number_of_movies movie.genre.number_of_movies
  end
end
