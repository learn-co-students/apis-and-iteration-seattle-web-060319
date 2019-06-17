require 'rest-client'
require 'json'
require 'pry'


def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

    films = []
    var1 = response_hash["results"].find do |detail|
      detail["name"] == character_name
    end
    var2 = var1["films"]
      var2.each do |url|
        film_data = RestClient.get(url)
        stuff = JSON.parse(film_data)
        films << stuff
      end
      films
end



  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.



def print_movies(films)
    movies = films.map { |film| film["title"]}
    puts movies
    binding.pry
end



def show_character_movies(character)

  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
