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

  def include?(query_score, node = @root)
    #check existing tree for nodes of a specifc value
    #run on root node and recursively test
    #pass in @root as a default—then recursive calls are generalized.
    if node.nil?
      return false
    else
      #delegate to the node method.
      @root.include?(query_score)
    end
  end

  def depth_of(query_score)
    #return the depth of the node in question by score.
    return nil if @root.nil? 



  end
end


#smart node and dumb node.
#guard clause: stop recuring if reach the end of whatever.
