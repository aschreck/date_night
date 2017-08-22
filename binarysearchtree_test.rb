require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './binarysearchtree.rb'
require './node.rb'
require 'pry'

class BinarySearchTreeTest < Minitest::Test

  def test_it_exists
    tree = BinarySearchTree.new
    assert_instance_of BinarySearchTree, tree
  end

  def test_start_with_nil
    tree = BinarySearchTree.new
    assert_nil tree.root
  end

  def test_tree_insert_single
    tree = BinarySearchTree.new

    assert_nil tree.root
    assert_equal 0, tree.insert(98, "Animals United")
    assert_equal 1, tree.insert(36, "Bill & Ted's Bogus Journey")
    refute_nil tree.root

  end

  def test_tree_include?
    tree = BinarySearchTree.new
    tree.insert(98, "Animals United")
    tree.insert(36, "Bill & Ted's Bogus Journey")
    tree.insert(93, "Bill & Ted's Excellent Adventure")

    assert tree.include?(36)
    assert tree.include?(98)
    assert tree.include?(93)
    refute tree.include?(45)

  end


  def test_multinode_include?
    tree = BinarySearchTree.new
    tree.insert(98, "Animals United")
    tree.insert(58, "Armageddon")
    tree.insert(36, "Bill & Ted's Bogus Journey")
    tree.insert(93, "Bill & Ted's Excellent Adventure")
    tree.insert(86, "Charlie's Angels")
    tree.insert(38, "Charlie's Country")
    tree.insert(69, "Collateral Damage")

    assert tree.include?(69)
    assert tree.include?(93)
    refute tree.include?(35)
    assert tree.include?(36)
    assert tree.include?(38)
    assert tree.include?(98)
    refute tree.include?(45)
  end

  def test_depth_of
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal 1, tree.depth_of(92)
    assert_equal 2, tree.depth_of(50)
  end

  def test_min_max
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal ({"Sharknado 3" => 92}), tree.max
    assert_equal ({"Johnny English" => 16}), tree.min
  end

  def test_sort
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal [{"Johnny English"=>16}, {"Hannibal Buress: Animal Furnace"=>50}, {"Bill & Ted's Excellent Adventure"=>61}, {"Sharknado 3"=>92}] , tree.sort
  end

  def test_load
    tree = BinarySearchTree.new
    assert_equal 99, tree.load('movies.txt')
  end
end


# tree.insert(58, "Armageddon")
# tree.insert(99, 'Usual Suspects')
