class MoveTree
  attr_reader :coordinates, :children
  def initialize(coordinates)
    @coordinates = coordinates
    @children = []
  end

  def append_child(node)
    @children << node
  end
  
end