require_relative '../lib/node.rb'

class BinarySearchTree
  attr_accessor :root, :score, :name


  def initialize
    @root = nil
  end


  def insert (score,name)
    #Search Tree looks for leading node
    if @root.nil?
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


  def max
    node = @root.node_extrema(:right)
    return node.hash_converter
  end


  def min
    node = @root.node_extrema(:left)
    return node.hash_converter
  end


  def sort(node = @root)
    #iterate through nodes and put them into an array
    sorted_list =[]
    return nil if node.nil?
    sorted_list.push(sort(node.left))
    sorted_list.push(node.hash_converter)
    sorted_list.push(sort(node.right))

    return sorted_list.flatten.compact
  end


  def load(file_name)
    file = File.open(file_name, 'r')
    i = 0

    text = file.each do |line|
      trimmed_line =line.tr(',', '')
      line_array = trimmed_line.split(' ')
      #line array[0] is the value and [1] is the name.
      self.insert(line_array[0], line_array[1])
      i += 1
    end

    return i

  end


  def health(query_depth)
    count = @root.child_count
    #nodes_at_depth returns an array of all the nodes with the first two fields.
    nodes_at_depth = @root.find_nodes_at_depth(query_depth)
    #take the existing array and add third element, children/count

    health_arrays = nodes_at_depth.map do |node_array|
      parentage_percent = 100.0 * (node_array[1]/count.to_f)
      parentage_percent = parentage_percent.floor
      node_array.push(parentage_percent)
    end

    return health_arrays

  end


end
