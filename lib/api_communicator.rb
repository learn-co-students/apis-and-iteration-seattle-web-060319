require 'rest-client'
require 'json'
require 'pry'

def get_json(list)
  response_string = RestClient.get('http://www.swapi.co/api/' + list +'/')
  response_hash = JSON.parse(response_string)

  results = response_hash['results']

  return results
end

def get_character_movies_from_api(character_name)
  results = get_json("people")

  found_character = results.find { |character|
    character['name'].downcase.include? character_name
  }

  if found_character == nil
    return nil
  else
    found_character["films"]
  end
end

def film_id_getter(films)
  films.map { |film_url|
    film_url.chars[-2].to_i
  }
end

def print_movies(character_films)
  if character_films == nil
    puts "Character and associated films not found"
  else
    results = get_json("films")

    film_id_getter(character_films).select { |an_episode_id|
      results.select { |film|
        if film['episode_id'] == an_episode_id
          puts film['title']
        end
      }
    }
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end