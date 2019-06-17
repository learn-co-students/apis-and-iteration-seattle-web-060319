require 'rest-client'
require 'json'
require 'pry'

  def get_character_movies_from_api(character_name)
    results = get_json("people")

    name_of_character(results, character_name)
  end

  def get_json(list)
  response_string = RestClient.get('http://www.swapi.co/api/' + list +'/')
  response_hash = JSON.parse(response_string)

  results = response_hash['results']
end

  def find_films(character, name)
    if character == nil
        puts "#{name} does not exist"
    else
      character["films"]
    end
  end

  def name_of_character(res, name)
    found_character = res.find do |character|
      character["name"].downcase == name
    end
    find_films(found_character, name)
  end

  def print_movies(films)
    if films == nil
      return "No films with character"
    end

    res = get_json("films")

    episode_id = films.map do |film_url|
      film_url.chars[-2].to_i
    end
    
    res.each do |film|
      episode_id.each do |id|
        if film["episode_id"] == id
          puts film["title"]
        end
      end
    end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end
