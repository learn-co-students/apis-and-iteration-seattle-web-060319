def welcome
  "Welcome!"
end

def get_character_from_user
  puts "please enter a character name"
  character = gets.chomp
  return character.downcase
end
