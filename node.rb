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



  def node_depth_of(query_score)

    node = find_node(query_score)
    return node.depth
  end
end

#look into node names
