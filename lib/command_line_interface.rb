def welcome
  puts "Welcome boys and girls!"
end

def get_character_from_user
  puts "please enter a character name"
  user_input = gets.chomp
  return user_input.downcase 
end
