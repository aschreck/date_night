require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/node.rb'

class NodeTest < Minitest::Test
#because most of  node methods run off of the BinarySearchTree,
#the majority of the tests are run from the BinarySearchTree test file

  def test_node_exists

    node = Node.new(45, 'Inception', 0)
    assert_instance_of Node, node
  end

  def test_has_parameters

    node = Node.new(45, 'Inception', 0)
    assert_equal node.score , 45
    assert_equal node.name, 'Inception'
    assert_equal node.depth, 0
    assert_nil node.left
    assert_nil node.right
  end

  def test_node_to_hash
    node = Node.new(45, 'Inception', 0)
    assert_equal ({'Inception' => 45}), node.hash_converter
  end

end
