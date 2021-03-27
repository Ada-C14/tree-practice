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

  # Time Complexity: 
  # Space Complexity: 
  def add(key, value)

    # wrong think about why
    # @root = TreeNode.new(key, value) unless root
    # return add_helper(@root, key, value)

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

    # needed idk why
    # return current

  end

  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    raise NotImplementedError
  end

  # Time Complexity: 
  # Space Complexity: 
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
    raise NotImplementedError
  end

  # Time Complexity: 
  # Space Complexity: 
  def postorder
    raise NotImplementedError
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
