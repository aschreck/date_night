require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './node.rb'

class NodeTest < Minitest::Test

  def test_node_exists
    node = Node.new(45, 'Inception')
    assert_instance_of Node, node
  end

  def test_has_parameters
    node = Node.new(45, 'Inception')
    assert_equal node.score , 45
    assert_equal node.name, 'Inception'
    assert_nil node.left
    assert_nil node.right
  end

  def test_insert_left
    node = Node.new(45, 'Inception')
    new_node = node.insert(23, 'Emoji Movie')
    assert_equal node.left , new_node
    assert_nil node.right
  end

  def test_insert_right
    node = Node.new(45, 'Inception')
    new_node = node.insert(98, 'Tree of Life')
    assert_equal node.right, new_node
    assert_nil node.left
  end

  def three_nodes_deep
    #assess the whole tree after 3 nodes.
    node = Node.new(45, 'Inception')
    second_node = node.insert(98, 'Tree of Life')
    third_node = node.insert(55, 'Ice Age')

    assert_nil node.left
    assert_equal second_node.left, third_node
    assert_nil second_node
    assert_nil second_node.right
    assert_nil third_node.right
    assert_nil third_node.left
  end

end