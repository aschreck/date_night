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
    if new_score <= @score #use single line if. traverse(node, depth) if new_score <= @score

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

  def include?(query_score)

    if @score < query_score
      #run recursively on the .right
      if @right.nil?  #should make into own method,
        return false
      else
        @right.include?(query_score)
      end

    elsif @score > query_score #should combine @left and @right into one method.
      #run recursively on left branch
      if @left.nil?
        return false
      else
        @left.include?(query_score)
      end

    elsif @score == query_score

      return true

    end
  end



  end
end

#look into node names
