require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative './binarysearchtree'
require_relative './node'
require 'pry'

class BinarySearchTreeTest < Minitest::Test

  def prefilled_tree
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    return tree
  end

  def test_it_exists
    tree = BinarySearchTree.new
    assert_instance_of BinarySearchTree, tree
  end

  def test_start_with_nil
    tree = BinarySearchTree.new
    assert_nil tree.root
  end

  def test_tree_insert_returns_tree_depth
    tree = BinarySearchTree.new

    assert_nil tree.root
    assert_equal 0, tree.insert(98, "Animals United")
    assert_equal 1, tree.insert(36, "Bill & Ted's Bogus Journey")
    refute_nil tree.root

  end


  def test_includes
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

  def test_depth_of_reports_depth
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal 1, tree.depth_of(92)
    assert_equal 2, tree.depth_of(50)
  end

  def test_max
    tree = prefilled_tree

    assert_equal ({"Johnny English" => 16}), tree.min
  end

  def test_min
    tree = prefilled_tree

    assert_equal ({"Johnny English" => 16}), tree.min
  end


  def test_sort
    tree = prefilled_tree
    assert_equal [
      {"Johnny English"=>16},
      {"Hannibal Buress: Animal Furnace"=>50},
      {"Bill & Ted's Excellent Adventure"=>61},
      {"Sharknado 3"=>92}
    ] , tree.sort
  end

  def test_load
    tree = BinarySearchTree.new
    assert_equal 99, tree.load('movies.txt')
  end

  def test_health
    tree = BinarySearchTree.new
    tree.insert(98, "Animals United")
    tree.insert(58, "Armageddon")
    tree.insert(36, "Bill & Ted's Bogus Journey")
    tree.insert(93, "Bill & Ted's Excellent Adventure")
    tree.insert(86, "Charlie's Angels")
    tree.insert(38, "Charlie's Country")
    tree.insert(69, "Collateral Damage")

    assert_equal [[98, 7, 100]], tree.health(0)
    assert_equal [[58, 6, 85]], tree.health(1)
    assert_equal [[36, 2, 28], [93, 3, 42]], tree.health(2)
  end


end


# tree.insert(58, "Armageddon")
# tree.insert(99, 'Usual Suspects')
