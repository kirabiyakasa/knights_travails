class Knight
  def initialize()
    @knight_move_list =
    [
      [-2, 1], [-1, 2], [2, 1], [1, 2],
      [-2, -1], [-1, -2], [2, -1], [1, -2]
    ]
    @visited = []
    @move_tree = nil
  end

  def find_move(starting_point, destination)
    path = []
    if @move_tree.nil?
      @move_tree = MoveTree.new(starting_point)
      filter_moves(@move_tree)
    else
      build_tree(@move_tree)
      search_tree(@move_tree, path, destination)
    end
    find_move(starting_point, destination)
  end

  def build_tree(node)
    if node.children.empty? == false
      node.children.each do |child|
        build_tree(child)
      end
    end
    filter_moves(node)
  end

  def filter_moves(node)
    new_moves = []
    @knight_move_list.each do |move|
      x = node.coordinates[0] + move[0]
      y = node.coordinates[1] + move[1]
      if (0..7).include?(x) && (0..7).include?(y)
        new_moves << [x, y]
      end
    end

    new_moves -= @visited

    if new_moves.empty? == false
      new_moves.each do |coordinates|
        node.append_child(MoveTree.new(coordinates))
        @visited << coordinates
      end
    end
  end

  def search_tree(node, path, destination)
    return path if node == nil
    check_node(node.coordinates, path, destination)

    node.children.each do |child|
      search_tree(child, path << node.coordinates, destination)
      path.pop
    end
  end

  def check_node(coordinates, path, destination)
    if coordinates == destination
      show_solution(coordinates, path, destination)
    end
  end

  def show_solution(coordinates, path, destination)
    turns = path.length
    moves = ""
    path.each do |space|
      moves += space.to_s + ", "
    end
    moves += destination.to_s 
    puts "\nStart: #{path.first}  Destination: #{destination}"
    puts "Reached destination in #{turns} turns."
    puts "Path: #{moves}"
    @visited = []
    @move_tree = []
    start_travailing()
  end

end