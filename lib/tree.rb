class TreeNode
  attr_reader :key, :value
  attr_accessor :left, :right

   def initialize(key, val)
    @key = key
    @value = val
    @left = nil
    @right = nil
   end
end

class Tree
  attr_reader :root
  def initialize
    @root = nil
  end

  # Time Complexity: O(logn)
  # Space Complexity: O(logn)
  def add(key, value)

    unless root
      @root = TreeNode.new(key, value)
    else
      add_helper(@root, key, value)
    end
  end

  def add_helper(current, key, value)
    return TreeNode.new(key, value) unless current

    if key < current.key
      current.left = add_helper(current.left, key, value)
    else
      current.right = add_helper(current.right, key, value)
    end

    # still working through why this needed
    return current

  end

  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    return find_helper(@root, key)
  end

  def find_helper(current, key)
    return current unless current
    return current.value if key == current.key

    if current.key < key
      find_helper(current.right, key)
    else
      find_helper(current.left, key)
    end
    
    # why isnt a return needed here?
    # not working back up stack?
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n^2)???? O(n) recursive calls but creating array of size n? - maybe O(2n?)
  def inorder
    tree_in_order = []
    return inorder_helper(tree_in_order, @root)
  end

  def inorder_helper(tree, current)
    return tree unless current

    inorder_helper(tree, current.left)
    tree.push({:key=>current.key, :value=>current.value})
    inorder_helper(tree, current.right)

    return tree
  end

  # Time Complexity: 
  # Space Complexity: 
  def preorder
    tree_pre_order = []
    return preorder_helper(@root, tree_pre_order)
  end

  def preorder_helper(current, tree)
    return tree unless current

    tree.push({:key=>current.key, :value=>current.value})
    preorder_helper(current.left, tree)
    preorder_helper(current.right, tree)

    return tree
  end

  # Time Complexity: 
  # Space Complexity: 
  def postorder
    tree_post_order = []
    return postorder_helper(@root, tree_post_order)
  end

  def postorder_helper(current, tree)
    return tree unless current

    postorder_helper(current.left, tree)
    postorder_helper(current.right, tree)
    tree.push({:key=>current.key, :value=>current.value})

    return tree
  end

  # Time Complexity: 
  # Space Complexity: 
  def height
    raise NotImplementedError
  end

  # Optional Method
  # Time Complexity: 
  # Space Complexity: 
  def bfs
    raise NotImplementedError
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end

tree = Tree.new()
# p tree.find(8)
tree.add(5, "Peter")
# print("#{tree}\n")

tree.add(3, "Paul")
# print(tree)
# p "#{tree.root.key}"

tree.add(1, "Mary")
# print(tree)
# p "#{tree.root.key}"

p tree.find(1)