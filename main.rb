require './lib/knight.rb'
require './lib/move_tree.rb'

def knight_moves(starting_point, destination)
  knight = Knight.new
  knight.find_move(starting_point, destination)
end

def get_axis(axis, position)
  puts "\nEnter #{axis} axis value for #{position}."
  value = gets.chomp
  until (0..7).include?(value.to_i) && value.count("a-zA-Z") == 0
    puts "\nInavlid coordinates for #{axis}."
    value = gets.chomp
  end
  return value.to_i
end

def get_coordinates(position)
  puts "\n\nEnter numbers 0-7 for both X and Y coordinates."
  x = get_axis("X", position)
  y = get_axis("Y", position)
  return x, y
end

def start_travailing()
  puts "\nSelect coordinates for knight or randomize?"
  puts "\n1) Choose Manually    2) Choose Randomly"
  answer = gets.chomp
  until answer == "1" || answer == "2"
    answer = gets.chomp
    puts "\nPlease Enter a valid Input."
  end
  if answer == "1"
    starting_point = get_coordinates("starting point")
    destination = get_coordinates("destination")
    knight_moves(starting_point, destination)
  elsif answer == "2"
    puts "\nChose Randomly."
    knight_moves([rand(0..7), rand(0..7)], [rand(0..7), rand(0..7)])
  end
end
start_travailing()
