require_relative 'test_helper'


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe Tree do
  let (:tree) {Tree.new}

  let (:tree_with_nodes) {
    tree.add(5, "Peter")
    tree.add(3, "Paul")
    tree.add(1, "Mary")
    tree.add(10, "Karla")
    tree.add(15, "Ada")
    tree.add(25, "Kari")
    tree
  }

  it "add & find values" do
    tree.add(5, "Peter")
    expect(tree.find(5)).must_equal "Peter"

    tree.add(15, "Ada")
    expect(tree.find(15)).must_equal "Ada"

    tree.add(3, "Paul")
    expect(tree.find(3)).must_equal "Paul"
  end

  it "can't find anything when the tree is empty" do
    expect(tree.find(50)).must_be_nil
  end

  describe "inorder" do
    it "will give an empty array for an empty tree" do
      expect(tree.inorder).must_equal []
    end

    it "will return the tree in order" do

      expect(tree_with_nodes.inorder).must_equal [{:key=>1, :value=>"Mary"}, {:key=>3, :value=>"Paul"}, 
                                       {:key=>5, :value=>"Peter"}, {:key=>10, :value=>"Karla"}, 
                                       {:key=>15, :value=>"Ada"}, {:key=>25, :value=>"Kari"}]
    end
  end


  describe "preorder" do
    it "will give an empty array for an empty tree" do
      expect(tree.preorder).must_equal []
    end

    it "will return the tree in preorder" do
      expect(tree_with_nodes.preorder).must_equal [{:key=>5, :value=>"Peter"}, {:key=>3, :value=>"Paul"}, 
                                        {:key=>1, :value=>"Mary"}, {:key=>10, :value=>"Karla"}, 
                                        {:key=>15, :value=>"Ada"}, {:key=>25, :value=>"Kari"}]
    end
  end

  describe "postorder" do
    it "will give an empty array for an empty tree" do
      expect(tree.postorder).must_equal []
    end

    it "will return the tree in postorder" do
      expect(tree_with_nodes.postorder).must_equal [{:key=>1, :value=>"Mary"}, {:key=>3, :value=>"Paul"}, 
                                         {:key=>25, :value=>"Kari"}, {:key=>15, :value=>"Ada"}, 
                                         {:key=>10, :value=>"Karla"}, {:key=>5, :value=>"Peter"}]
    end
  end

  describe "breadth first search" do
    it "will give an empty array for an empty tree" do
      expect(tree.bfs).must_equal []
    end

    it "will return an array of a level-by-level output of the tree" do
      expect(tree_with_nodes.bfs).must_equal [{:key=>5, :value=>"Peter"}, {:key=>3, :value=>"Paul"}, 
                                   {:key=>10, :value=>"Karla"}, {:key=>1, :value=>"Mary"}, 
                                   {:key=>15, :value=>"Ada"}, {:key=>25, :value=>"Kari"}]
    end
  end

  describe "height" do
    it "will return 0 for an empty tree" do
      my_tree = Tree.new

      expect(my_tree.height).must_equal 0
    end

    it "will return 1 for a tree of height 1" do
      my_tree = Tree.new

      my_tree.add(100)
      expect(my_tree.height).must_equal 1
    end

    it "will report the height for a balanced tree" do
      expect(tree_with_nodes.height).must_equal 4 # this used to be 3, but when i drew out the tree the height was 4... 
    end

    it "will report the height for unbalanced trees" do
      my_tree = Tree.new

      my_tree.add(100)
      my_tree.add(110)
      my_tree.add(120)
      my_tree.add(130)
      my_tree.add(140)

      expect(my_tree.height).must_equal 5

      my_tree = Tree.new

      my_tree = Tree.new

      my_tree.add(100)
      my_tree.add(90)
      my_tree.add(80)
      my_tree.add(70)
      my_tree.add(60)

      expect(my_tree.height).must_equal 5
    end
  end

  describe "delete" do 
    it "returns nil for single node trees and empty trees" do 
      expect(tree.delete(1)).must_be_nil
      tree.add(1)
      expect(tree.delete(1)).must_be_nil
    end

    it "absorbs branch as new root when root must be deleted but only has one branch" do 
      tree.add(1)
      tree.add(3)
      tree.delete(1)
      expect(tree.preorder).must_equal [{:key=>3, :value=>nil}]

      tree.add(2)
      tree.delete(3)
      expect(tree.preorder).must_equal [{:key=>2, :value=>nil}]
    end

    it "absorbs left branch if root must be deleted, has a right branch, and left branch has no right branch" do 
      tree.add(3)
      tree.add(1)
      tree.add(4)
      tree.add(0)
      tree.delete(3)
      expect(tree.preorder).must_equal [{:key=>1, :value=>nil}, {:key=>0, :value=>nil}, {:key=>4, :value=>nil}]
    end

    it "absorbs rightmost element of left branch if root must be deleted, has a right branch, and left branch has right branch" do 
      tree.add(3)
      tree.add(0)
      tree.add(4)
      tree.add(1)
      tree.add(2)
      tree.delete(3)
      expect(tree.preorder).must_equal [{:key=>2, :value=>nil}, {:key=>0, :value=>nil}, {:key=>1, :value=>nil}, {:key=>4, :value=>nil}]
    end

    it "deletes leaves successfully" do 
      tree.add(1)
      tree.add(2)
      tree.add(3)
      tree.delete(3)
      expect(tree.preorder).must_equal  [{:key=>1, :value=>nil}, {:key=>2, :value=>nil}]
    end

    it "absorbs branch for node to be deleted with only one branch" do 
      tree.add(1)
      tree.add(2)
      tree.add(6)
      tree.add(3)
      tree.add(5)
      tree.add(4)
      tree.add(9)
      tree.add(7)
      tree.add(8)
      tree.delete(2)
      expect(tree.preorder).must_equal [{:key=>1, :value=>nil}, {:key=>6, :value=>nil}, {:key=>3, :value=>nil}, {:key=>5, :value=>nil},
                                        {:key=>4, :value=>nil}, {:key=>9, :value=>nil},{:key=>7, :value=>nil}, {:key=>8, :value=>nil},]

      tree.delete(9)
      expect(tree.preorder).must_equal [{:key=>1, :value=>nil}, {:key=>6, :value=>nil}, {:key=>3, :value=>nil}, {:key=>5, :value=>nil}, 
                                        {:key=>4, :value=>nil}, {:key=>7, :value=>nil}, {:key=>8, :value=>nil}]
    end

    it "absorbs left branch if node must be deleted, has a right branch, and left branch has no right branch" do 
      tree.add(10)
      tree.add(5)
      tree.add(7)
      tree.add(2)
      tree.add(1)
      tree.delete(5)
      expect(tree.preorder).must_equal [{:key=>10, :value=>nil}, {:key=>2, :value=>nil}, {:key=>1, :value=>nil}, {:key=>7, :value=>nil}]
    end

    it "absorbs rightmost element of left branch if root must be deleted, has a right branch, and left branch has right branch" do 
      tree.add(5)
      tree.add(3)
      tree.add(4)
      tree.add(1)
      tree.add(2)
      tree.delete(3)
      expect(tree.preorder).must_equal [{:key=>5, :value=>nil}, {:key=>2, :value=>nil}, {:key=>1, :value=>nil}, {:key=>4, :value=>nil}]
    end
  end
end
