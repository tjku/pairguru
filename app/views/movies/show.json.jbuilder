json.extract! movie, :id, :title, :description
json.genre do
  json.id movie.genre.id
  json.name movie.genre.name
  json.number_of_movies movie.genre.number_of_movies
end
