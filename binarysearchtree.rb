require './node.rb'
require 'pry'
class BinarySearchTree
  attr_accessor :root, :score, :name

  def initialize
    @root = nil
  end


  def insert (score,name)
    #Search Tree looks for leading node
    if @root == nil
      @root = Node.new(score,name, 0)
      return 0 #root depth is always zero
    else
      #If it exists, Binary's insert delegates to Node's insert
      return @root.insert(score, name)
    end
  end

  def include?(query_score)

    return false if @root.nil?

    node = @root.find_node(query_score)

    if node.nil?
      return false
    else
      return true
    end
  end


  def depth_of(query_score)
    #return the depth of the node in question by score.
    return nil if @root.nil?
    node = @root.find_node(query_score)
    return node.depth

  end
end


#smart node and dumb node.
#guard clause: stop recuring if reach the end of whatever.
