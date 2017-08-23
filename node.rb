class Node

  attr_accessor :score, :name, :left, :right, :depth

  def initialize(score, name, depth)
  @score = score
  @name =  name
  @left = nil
  @right = nil
  @depth = depth
  end

  def insert(new_score, new_name)
    #recursively traverse the existing node tree for an open spot
    #refactor to a single method that takes @left or @right as arg.
    if new_score <= @score

      if @left.nil?
        @left = Node.new(new_score, new_name, @depth + 1)
        return @left.depth
      else
        return @left.insert(new_score, new_name)
      end



    elsif new_score > @score

      if @right.nil?
        @right = Node.new(new_score, new_name, @depth + 1)
        return @right.depth
      else
        return @right.insert(new_score, new_name)
      end
    end


  end

  def find_node(query_score)
    #this method will find a node and return it.
    if @score == query_score
      return self
    end

    @score < query_score ? target_node = @right : target_node = @left

    if target_node.nil?
      return nil
    else
      target_node.find_node(query_score)
    end

  end

  def find_nodes_at_depth(query_depth)
    nodes_at_depth = []
    if @depth == query_depth
      children = self.child_count
      nodes_at_depth.push([self.score, children])
    end

    unless @left.nil?
      @left.find_nodes_at_depth(query_depth)
    end

    unless @right.nil?
      @right.find_nodes_at_depth(query_depth)
    end

    return nodes_at_depth
  end

  def child_count(node = self)
    child_counter = 1 #default at 1 for current node
    #for a given node, check its @left and @right for children
    #if there is a child, add +1 to a counter.
    unless node.left.nil?
      child_counter +=1
      childcount(@left)
    end

    unless node.right.nil?
      child_counter +=1
      childcount(@right)
    end

    return child_counter

  end

  def node_extrema(direction) #takes @left or @right
    #no nil case since called from node.
    node = @right if direction == :right
    node = @left if direction == :left

    if node.nil?
      return self
    else
      node.node_extrema(direction)
    end

  end

  def hash_converter
   {self.name => self.score}
  end
end

#look into node names
